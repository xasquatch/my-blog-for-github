package net.xasquatch.myblog.service;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.PropertyNamingStrategy;
import net.xasquatch.myblog.oauth.GoogleOAuthRequest;
import net.xasquatch.myblog.oauth.GoogleOAuthResponse;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import java.util.HashMap;
import java.util.Map;

@Service
@PropertySource("/WEB-INF/properties/oauth/oauth-setting.properties")
public class GoogleOAuthService {

    @Value("${oauth.google.client_id}")
    private String clientId;

    @Value("${oauth.google.client_secret}")
    private String clientSecret;

    @Value("${oauth.google.redirect_uri}")
    private String redirectUri;

    @Value("${oauth.google.response_type}")
    private String responseType;

    @Value("${oauth.google.scope}")
    private String scope;

    @Value("${oauth.google.access_type}")
    private String accessType;

    public String getGoogleInfo() {

        StringBuilder resultQueryString;
        resultQueryString = new StringBuilder()
                .append("client_id=")
                .append(clientId)
                .append("&")
                .append("redirect_uri=")
                .append(redirectUri)
                .append("&")
                .append("response_type=")
                .append(responseType)
                .append("&")
                .append("scope=")
                .append(scope)
                .append("&")
                .append("access_type=")
                .append(accessType);

        return resultQueryString.toString();

    }


    public String signUpAndIn(String authCode) throws JsonProcessingException {
        //HTTP Request를 위한 RestTemplate
        RestTemplate restTemplate = new RestTemplate();

        //Google OAuth Access Token 요청을 위한 파라미터 세팅
        GoogleOAuthRequest googleOAuthRequestParam = GoogleOAuthRequest
                .builder()
                .clientId(clientId)
                .clientSecret(clientSecret)
                .code(authCode)
                .redirectUri(redirectUri)
                .grantType("authorization_code").build();


        //JSON 파싱을 위한 기본값 세팅
        //요청시 파라미터는 스네이크 케이스로 세팅되므로 Object mapper에 미리 설정해준다.
        ObjectMapper mapper = new ObjectMapper();
        mapper.setPropertyNamingStrategy(PropertyNamingStrategy.SNAKE_CASE);
        mapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);

        //AccessToken 발급 요청
        ResponseEntity<String> resultEntity = restTemplate.postForEntity("https://oauth2.googleapis.com/token", googleOAuthRequestParam, String.class);

        //Token Request
        GoogleOAuthResponse result = mapper.readValue(resultEntity.getBody(), new TypeReference<GoogleOAuthResponse>() {
        });

        //ID Token만 추출 (사용자의 정보는 jwt로 인코딩 되어있다)
        String jwtToken = result.getIdToken();
        String requestUrl = UriComponentsBuilder.fromHttpUrl("https://oauth2.googleapis.com/tokeninfo")
                .queryParam("id_token", jwtToken).encode().toUriString();

        String resultJson = restTemplate.getForObject(requestUrl, String.class);

        Map<String, String> userInfo = mapper.readValue(resultJson, new TypeReference<Map<String, String>>() {});
        userInfo.put("token", result.getAccessToken());

        return new ObjectMapper().writerWithDefaultPrettyPrinter().writeValueAsString(userInfo);
    }



}
