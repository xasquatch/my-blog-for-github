package net.xasquatch.myblog.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import lombok.extern.slf4j.Slf4j;
import net.xasquatch.myblog.model.Board;
import net.xasquatch.myblog.repository.BoardDao;
import net.xasquatch.myblog.service.Pagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.*;

@Slf4j
@Service
@PropertySource("/WEB-INF/properties/file/FileManager.properties")
public class BoardService {

    @Autowired
    private BoardDao boardDao;

    @Autowired
    private FileService fileService;

    @Value("${files.save.directory.blog}")
    String SaveDir;

    @Value("${files.save.contents.name.blog}")
    String ContentsName;

    public String[] parsingSearchValue(Map<String, String> map) {

        String[] searchValue = new String[2];
        map.forEach((key, value) -> {
            if (!value.equals("empty")){
                searchValue[0] = key;
                searchValue[1] = '%' + value + '%';
            }
        });

        return searchValue;
    }

    public Object createDefaultBoard(String memberNo) {
        Map<String, Object> memberMap = new HashMap<String, Object>();
        memberMap.put("mbr_no", memberNo);
        boardDao.deleteUnfinishedBoard(memberMap);
        if (boardDao.insertDefaultBoard(memberMap)) {
            String path = File.separator + memberNo + SaveDir + File.separator + memberMap.get("no");
            fileService.removeFiles(path);
            return memberMap.get("no");

        } else {
            return false;

        }

    }

    public boolean createFinish(Board board) {
        if (board.getTitle().equals("") || board.getTitle() == null) board.setTitle("[No Title]");

        byte[] bytes = (board.getTitle() + System.lineSeparator() + board.getCreated_ip() + System.lineSeparator() + board.getContents()).getBytes();

        fileService.writeFile(bytes, File.separator + board.getMbr_no() + SaveDir + File.separator + board.getNo(), ContentsName + "-origin");
        return boardDao.updateBoard(board);

    }

    public boolean modify(Board board) {
        SimpleDateFormat format = new SimpleDateFormat("-yyyyMMddhhmmss");

        byte[] bytes = (board.getTitle() + System.lineSeparator() + board.getCreated_ip() + System.lineSeparator() + board.getContents()).getBytes();

        fileService.writeFile(bytes, File.separator + board.getMbr_no() + SaveDir + File.separator + board.getNo(), ContentsName + format.format(new Date()));
        return boardDao.updateBoard(board);

    }

    public HashMap<String, Object> viewDetail(Object memberNo, Object boardNo) {
        return boardDao.selectOneBoard(memberNo, boardNo);

    }

    public String viewDetailToJSON(Object memberNo, Object boardNo) {
        String result = null;

        HashMap<String, Object> map = boardDao.selectOneBoard(memberNo, boardNo);
        ObjectWriter objectWriter = new ObjectMapper().writerWithDefaultPrettyPrinter();

        try {
            result = objectWriter.writeValueAsString(map);
        } catch (JsonProcessingException e) {
            log.warn("API JsonProcessingException");
        }

        return result;
    }



    public void delete(Object boardKey) {
        boardDao.deleteOneBoard(boardKey);

    }

    public String getBoardList(String memberKey, int pageLimit, int currentPageBlock, String[] searchValue) {

        List<HashMap<String, Object>> boardList;
        if (searchValue[0] == null) {
            boardList = boardDao.SelectBoardList(memberKey, pageLimit, currentPageBlock, null, null);

        } else {
            boardList = boardDao.SelectBoardList(memberKey, pageLimit, currentPageBlock, searchValue[0], searchValue[1]);

        }


        int totalCount = boardDao.selectBoardListCount(memberKey);


        Pagination pagination = Pagination.builder()
                .pageLimit(pageLimit)
                .currentPageBlock(currentPageBlock)
                .totalCount(totalCount)
                .build();
        pagination.setPageBlogList();

        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap.put("boardList", boardList);
        resultMap.put("pageBlockList", pagination);

        ObjectMapper objectMapper = new ObjectMapper();
        String resultDataString = null;
        try {
            resultDataString = objectMapper.writerWithDefaultPrettyPrinter().writeValueAsString(resultMap);
        } catch (JsonProcessingException e) {
            log.warn("JsonProcessingException");
        }


        return resultDataString;
    }

    public String getAllBoardList(int pageLimit, int currentPageBlock, String[] searchValue) {

        List<HashMap<String, Object>> boardList;
        if (searchValue[0] == null) {
            boardList = boardDao.SelectAllBoardList(pageLimit, currentPageBlock, null, null);

        } else {
            boardList = boardDao.SelectAllBoardList(pageLimit, currentPageBlock, searchValue[0], searchValue[1]);

        }


        int totalCount = boardDao.selectAllBoardListCount();


        Pagination pagination = Pagination.builder()
                .pageLimit(pageLimit)
                .currentPageBlock(currentPageBlock)
                .totalCount(totalCount)
                .build();
        pagination.setPageBlogList();

        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap.put("boardList", boardList);
        resultMap.put("pageBlockList", pagination);

        ObjectMapper objectMapper = new ObjectMapper();
        String resultDataString = null;
        try {
            resultDataString = objectMapper.writerWithDefaultPrettyPrinter().writeValueAsString(resultMap);
        } catch (JsonProcessingException e) {
            log.warn("JsonProcessingException");
        }


        return resultDataString;
    }
}
