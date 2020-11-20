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

    public String[] parsingSearchValue(String keyword, String title, String contents, String titleAndContents) {
        Map<String, String> map = new HashMap<String, String>();
        String[] searchValue = new String[2];

        map.put("keyword", keyword);
        map.put("title", title);
        map.put("contents", contents);
        map.put("titleAndContents", titleAndContents);

        map.forEach((key, value) -> {
            if (!value.equals("empty")) {
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

        int totalCount = apiDao.selectBoardCount(memberNo);

        List<Integer> pageBlockList = new Pagination().getBlockList(pageLimit, currentPageBlock, totalCount);

        Map<String, Object> data = new HashMap<String, Object>();
        data.put("boardList", boardList);
        data.put("pageBlockList", pageBlockList);
/*

        Map<String, Object> explainDetail = new HashMap<String, Object>();
        explainDetail.put("추가설명","GET요청 시 해당 인자를 생략하면 기본값으로 출력됩니다. page-limit(블록당 게시글 수)의 기본값은 10, current-page-block(현재페이지 블록번호)의 기본값은 1입니다.");
        explainDetail.put("row_number","작성일자 기준으로 정렬된 번호입니다. 최근 작성일자가 제일 앞으로 표시됩니다. 고유 ID 와는 무관합니다.");
        explainDetail.put("no","해당 게시글의 고유 ID 입니다.");
        explainDetail.put("title","해당 게시글의 제목입니다.");
        explainDetail.put("thumbnail","해당 게시글의 썸네일 이미지입니다.");
        explainDetail.put("created_date","해당 게시글의 작성일자입니다.");

        Map<String, Object> explain = new HashMap<String, Object>();
        explain.put("boardList", explainDetail);
        explain.put("pageBlockList", "다음 페이지버튼 리스트입니다." +
                " 페이지블록 5개와 다음, 이전페이지블록 2개를 포함해 총 7개의 리스트가 출력됩니다.");

        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("explain", explain);
        resultMap.put("data", data);

*/

        ObjectWriter objectWriter = new ObjectMapper().writerWithDefaultPrettyPrinter();

        try {
            result = objectWriter.writeValueAsString(data);
        } catch (JsonProcessingException e) {
            log.warn("[getBoardList] JsonProcessingException");
        }

        return result;
    }

    public String viewBoard(String memberNo, String boardNo) {


        return null;
    }
}
