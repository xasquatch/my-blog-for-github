package net.xasquatch.myblog.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import lombok.extern.slf4j.Slf4j;
import net.xasquatch.myblog.repository.ApiDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Service
public class ApiService {

    @Autowired
    private ApiDao apiDao;

    public String[] parsingSearchValue(String keyword, String title, String contents, String titleOrContents) {
        Map<String, String> map = new HashMap<String, String>();
        String[] searchValue = new String[2];

        map.put("keyword", keyword);
        map.put("title", title);
        map.put("contents", contents);
        map.put("title-or-contents", titleOrContents);

        map.forEach((key, value) -> {
            if (!value.equals("") && !value.equals("undefined")) {
                searchValue[0] = key;
                searchValue[1] = '%' + value + '%';
            }
        });

        return searchValue;
    }


    public String getBoardList(String memberNo, int pageLimit, int currentPageBlock, String[] searchValue) {

        String result = "false";

        int currentPage = 0;
        try {
            currentPage = (currentPageBlock - 1) * pageLimit;

        } catch (ArithmeticException e) {
            log.warn("[ArithmeticException]pageLimit: {}", pageLimit);
        }

        List<Map<String, Object>> boardList
                = apiDao.selectBoardList(memberNo, currentPage, pageLimit, searchValue[0], searchValue[1]);

        int totalCount = apiDao.selectBoardCount(memberNo, searchValue[0], searchValue[1]);

        List<String> pageBlockList = new Pagination().getBoardBlockListForAPI(Long.parseLong(memberNo), pageLimit, currentPageBlock, totalCount, searchValue[0], searchValue[1]);

        Map<String, Object> data = new HashMap<String, Object>();
        data.put("boardList", boardList);
        data.put("pageBlockList", pageBlockList);

        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("data", data);
        resultMap.put("document",
                "https://myblog.xasquatch.net/document/members/{member-Number}/boards");


        ObjectWriter objectWriter = new ObjectMapper().writerWithDefaultPrettyPrinter();

        try {
            result = objectWriter.writeValueAsString(resultMap);
        } catch (JsonProcessingException e) {
            log.warn("[getBoardList] JsonProcessingException");
        }

        return result;
    }

    public String getBoardDetail(String memberNo, String boardNo) {
        String result = "false";

        Map<String, Object> boardDetails = apiDao.selectBoardOne(memberNo, boardNo);

        Map<String, Object> data = new HashMap<String, Object>();
        data.put("board", boardDetails);

        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("data", data);
        resultMap.put("document",
                "https://myblog.xasquatch.net/document/members/{member-Number}/boards/{board-Number}");

        ObjectWriter objectWriter = new ObjectMapper().writerWithDefaultPrettyPrinter();
        try {
            result = objectWriter.writeValueAsString(resultMap);
        } catch (JsonProcessingException e) {
            log.warn("[getBoardDetail] JsonProcessingException");
        }

        return result;
    }

    public String getResource(String memberNo, String resourceNo) {
        String result = "false";

        Map<String, Object> resource = apiDao.selectResource(memberNo, resourceNo);

        Map<String, Object> data = new HashMap<String, Object>();
        data.put("resource", resource);

        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("data", data);
        resultMap.put("document",
                "https://myblog.xasquatch.net/document/members/{member-Number}/resources/{resource-Number}");

        ObjectWriter objectWriter = new ObjectMapper().writerWithDefaultPrettyPrinter();
        try {
            result = objectWriter.writeValueAsString(resultMap);
        } catch (JsonProcessingException e) {
            log.warn("[getResource] JsonProcessingException");
        }

        return result;
    }
}
