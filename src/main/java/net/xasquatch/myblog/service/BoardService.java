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

    public String[] parsingSearchValue(String keyword, String title, String contents, String titleOrContents) {
        Map<String, String> map = new HashMap<String, String>();
        String[] searchValue = new String[2];

        map.put("keyword", keyword);
        map.put("title", title);
        map.put("contents", contents);
        map.put("titleOrContents", titleOrContents);

        map.forEach((key, value) -> {
            if (!value.equals("") && !value.equals("undefined")) {
                searchValue[0] = key;
                searchValue[1] = '%' + value + '%';
            }
        });

        return searchValue;
    }

    public Map<String, Object> getBoardList(Object memberNo, int pageLimit, int currentPageBlock, String[] searchValue) {

        int currentPage = 0;
        try {
            currentPage = (currentPageBlock - 1) * pageLimit;

        } catch (ArithmeticException e) {
            log.warn("[ArithmeticException]pageLimit: {}", pageLimit);
        }

        List<Map<String, Object>> boardList
                = boardDao.selectBoardList(memberNo, currentPage, pageLimit, searchValue[0], searchValue[1]);

        int totalCount = boardDao.selectBoardCount(memberNo, searchValue[0], searchValue[1]);

        List<String> pageBlockList = new Pagination().getBlockList(memberNo, pageLimit, currentPageBlock, totalCount, searchValue[0], searchValue[1]);

        Map<String, Object> data = new HashMap<String, Object>();
        data.put("boardList", boardList);
        data.put("pageBlockList", pageBlockList);

        return data;
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
        if (board.getTitle().equals("") || board.getTitle() == null) board.setTitle("[Empty Title]");
        if (board.getThumbnail().trim().equals("")||board.getThumbnail() == null) board.setThumbnail("<img style=\"max-width: 140px; max-height: 140px;\" src=\"https://myblog.xasquatch.net/img/no_image.png\"/>");
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

    public Map<String, Object> viewDetail(Object memberNo, Object boardNo) {
        return boardDao.selectOneBoard(memberNo, boardNo);

    }

    public String viewDetailToJSON(Object memberNo, Object boardNo) {
        String result = null;

        Map<String, Object> map = boardDao.selectOneBoard(memberNo, boardNo);
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

}
