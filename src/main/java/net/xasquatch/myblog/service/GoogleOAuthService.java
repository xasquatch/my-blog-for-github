package net.xasquatch.myblog.service;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.PropertyNamingStrategy;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.apache.v2.ApacheHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import lombok.extern.slf4j.Slf4j;
import net.xasquatch.myblog.model.Member;
import net.xasquatch.myblog.oauth.GoogleOAuthRequest;
import net.xasquatch.myblog.oauth.GoogleOAuthResponse;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

@Slf4j
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


    public ResponseEntity<String> requestAccessToken(String authCode) {
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

        //AccessToken 발급 요청
        return restTemplate.postForEntity("https://oauth2.googleapis.com/token", googleOAuthRequestParam, String.class);
    }

    public Map<String, Object> getAccessToken(ResponseEntity<String> resultEntity) throws JsonProcessingException {
        //HTTP Request를 위한 RestTemplate
        RestTemplate restTemplate = new RestTemplate();

        //JSON 파싱을 위한 기본값 세팅
        //요청시 파라미터는 스네이크 케이스로 세팅되므로 Object mapper에 미리 설정해준다.
        ObjectMapper mapper = new ObjectMapper();
        mapper.setPropertyNamingStrategy(PropertyNamingStrategy.SNAKE_CASE);
        mapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);

        //Token Request
        GoogleOAuthResponse googleOAuthResponse = mapper.readValue(resultEntity.getBody(), new TypeReference<GoogleOAuthResponse>() {
        });

        //ID Token만 추출 (사용자의 정보는 jwt로 인코딩 되어있다)
        String idToken = googleOAuthResponse.getIdToken();
        String requestUrl = UriComponentsBuilder.fromHttpUrl("https://oauth2.googleapis.com/tokeninfo")
                .queryParam("id_token", idToken).encode().toUriString();

        String resultJson = restTemplate.getForObject(requestUrl, String.class);

        Map<String, String> decodedToken = mapper.readValue(resultJson, new TypeReference<Map<String, String>>() {
        });
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("decodedToken", decodedToken);
        resultMap.put("JWT", idToken);

        return resultMap;
    }

    public Member convertModelToMember(Map<String, Object> tokenMap) {

        Map<String, String> decodedToken = (Map<String, String>) tokenMap.get("decodedToken");
        String token = (String) tokenMap.get("JWT");

        Member member = Member.builder()
                .email(decodedToken.get("email"))
                .pwd(token.substring(token.lastIndexOf("."), token.lastIndexOf(".") + 20))
                .token(token)
                .name(decodedToken.get("name") + Math.round(Math.random() * 10000000))
                .img(decodedToken.get("picture"))
                .build();

        return member;
    }

    public String revokeGoogleToken(String token) throws JsonProcessingException {
        Map<String, String> result = new HashMap<>();
        RestTemplate restTemplate = new RestTemplate();
        final String requestUrl = UriComponentsBuilder.fromHttpUrl("https://oauth2.googleapis.com/revoke")
                .queryParam("token", token).encode().toUriString();

        String resultJson = restTemplate.postForObject(requestUrl, null, String.class);
        result.put("result", "success");
        result.put("resultJson", resultJson);

        return new ObjectMapper().writerWithDefaultPrettyPrinter().writeValueAsString(result);
    }


    public Member verifyToken(String JWT) throws GeneralSecurityException, IOException {

        HttpTransport transport = new ApacheHttpTransport();
        JsonFactory jsonFactory = new JacksonFactory();
        GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(transport, jsonFactory)
                // Specify the CLIENT_ID of the app that accesses the backend:
                .setAudience(Collections.singletonList(clientId))
                // Or, if multiple clients access the backend:
                //.setAudience(Arrays.asList(CLIENT_ID_1, CLIENT_ID_2, CLIENT_ID_3))
                .build();

// (Receive idTokenString by HTTPS POST)

        GoogleIdToken idToken = verifier.verify(JWT);
        Member member = null;
        if (idToken != null) {
            Payload payload = idToken.getPayload();
            if (!payload.getAudience().equals(clientId)) return null;

            // Print user identifier
            String userId = payload.getSubject();

            // Get profile information from payload
            String email = payload.getEmail();
            String name = (String) payload.get("name");
            String pictureUrl = (String) payload.get("picture");

            member = Member.builder()
                    .email(email)
                    .token(JWT)
                    .build();

        } else {
            log.debug("Invalid ID token.");
        }

        return member;
    }
}
