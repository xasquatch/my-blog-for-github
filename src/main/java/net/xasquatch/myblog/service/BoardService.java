package net.xasquatch.myblog.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import lombok.extern.slf4j.Slf4j;
import net.xasquatch.myblog.model.Board;
import net.xasquatch.myblog.model.Comment;
import net.xasquatch.myblog.model.Member;
import net.xasquatch.myblog.repository.BoardDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Service
@PropertySource("/WEB-INF/properties/file-manager.properties")
public class BoardService {

    @Autowired
    private BoardDao boardDao;

    @Resource(name = "sessionMember")
    private Member sessionMember;

    @Autowired
    private FileService fileService;

    @Value("${files.save.directory.blog}")
    String SaveDir;

    @Value("${files.save.contents.name.blog}")
    String ContentsName;

    public String checkBoardFormData(Board board) {
        String[] prohibitedWords = {"<script", "onload="};

        String title = board.getTitle().replaceAll(" ", "");
        String contents = board.getContents().replaceAll(" ", "");
        ;
        String keyword = board.getKeyword().replaceAll(" ", "");
        ;
        String thumbnail = board.getThumbnail().replaceAll(" ", "");
        ;

        if (!thumbnail.contains("<img"))
            board.setThumbnail("<img style=\"max-width: 140px; max-height: 140px;\" src=\"https://myblog.xasquatch.net/img/no_image.png\">");

        Map<String, String> CheckTargetString = new HashMap<String, String>();
        CheckTargetString.put("Title", title);
        CheckTargetString.put("Contents", contents);
        CheckTargetString.put("Keyword", keyword);
        CheckTargetString.put("Thumbnail", thumbnail);
        CheckTargetString.put("msg", "");

        CheckTargetString.forEach((key, value) -> {
            for (String word : prohibitedWords) {
                if (!key.equals("msg") && value.contains(word)) {
                    CheckTargetString.put("msg", "[script Error] \"" + key + "\"부분의 스크립트를 제거해주시기바랍니다.");
                }
            }
        });

        return CheckTargetString.get("msg");
    }

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

    public Map<String, Object> getNoticeList(Object rank, int pageLimit, int currentPageBlock, String[] searchValue) {

        int currentPage = 0;
        try {
            currentPage = (currentPageBlock - 1) * pageLimit;

        } catch (ArithmeticException e) {
            log.warn("[ArithmeticException]pageLimit: {}", pageLimit);
        }

        List<Map<String, Object>> boardList
                = boardDao.selectNoticeList(rank, currentPage, pageLimit, searchValue[0], searchValue[1]);

        int totalCount = boardDao.selectNoticeCount(rank, searchValue[0], searchValue[1]);

        List<String> pageBlockList = new Pagination().getNoticeBlockList(pageLimit, currentPageBlock, totalCount, searchValue[0], searchValue[1]);


        Map<String, Object> data = new HashMap<String, Object>();
        data.put("boardList", boardList);
        data.put("pageBlockList", pageBlockList);

        return data;
    }

    public String getCommentList(Object boardNo) {

        String commentListForJson = null;
        List<Map<String, Object>> commentList = boardDao.selectCommentList(boardNo);
        ObjectWriter objectWriter = new ObjectMapper().writerWithDefaultPrettyPrinter();

        try {
            commentListForJson = objectWriter.writeValueAsString(commentList);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }


        return commentListForJson;
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

        List<String> pageBlockList;
        if (memberNo.equals("all")) {
            pageBlockList = new Pagination().getBoardBlockList(pageLimit, currentPageBlock, totalCount, searchValue[0], searchValue[1]);

        } else {
            pageBlockList = new Pagination().getBoardBlockList(memberNo, pageLimit, currentPageBlock, totalCount, searchValue[0], searchValue[1]);

        }

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
        if (board.getThumbnail().trim().equals("") || board.getThumbnail() == null)
            board.setThumbnail("<img style=\"max-width: 140px; max-height: 140px;\" src=\"https://myblog.xasquatch.net/img/no_image.png\"/>");
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

    public boolean delete(Object boardKey) {
        boolean result = false;
        if (boardDao.deleteOneBoard(boardKey) == 1)
            result = true;
        return result;
    }

    public boolean createComment(Comment comment) {
        boolean result = false;
        String pwd = comment.getPwd();
        if (pwd == null || pwd.equals(""))
            comment.setPwd("0000");

        comment.setMbr_no(sessionMember.getNo());
        if (boardDao.insertOneComment(comment) == 1) result = true;

        return result;
    }

    public String deleteComment(String commentNo, String pwd) {
        int result = 0;

        if (sessionMember.getName().equals("GUEST")) {
            result = boardDao.deleteComment(commentNo, pwd);

        } else {
            result = boardDao.deleteComment(commentNo);
        }

        return result == 1 ? "true": "false";
    }

}