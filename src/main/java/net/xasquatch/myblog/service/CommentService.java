package net.xasquatch.myblog.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import lombok.extern.slf4j.Slf4j;
import net.xasquatch.myblog.model.Comment;
import net.xasquatch.myblog.model.Member;
import net.xasquatch.myblog.repository.CommentDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Service
public class CommentService {

    @Autowired
    private CommentDao commentDao;

    @Resource(name = "sessionMember")
    private Member sessionMember;

    public boolean createComment(Comment comment) {
        boolean result = false;
        String pwd = comment.getPwd();
        if (pwd == null || pwd.equals("") || pwd.equals("null"))
            comment.setPwd("0000");

        comment.setMbr_no(sessionMember.getNo());
        if (commentDao.insertOneComment(comment) == 1) result = true;

        return result;
    }

    public String deleteComment(String commentNo, String pwd) {
        int result = 0;

        if (sessionMember.getName().equals("GUEST")) {
            result = commentDao.deleteComment(commentNo, pwd);

        } else {
            result = commentDao.deleteComment(commentNo);
        }

        return result == 1 ? "true" : "false";
    }


    public String getCommentList(long boardNo, String currentPageBlock, String pageLimit) {

        int currentPage = 0;
        int castedCurrentPageBlock =Integer.parseInt(currentPageBlock);
        try {
            currentPage = (castedCurrentPageBlock - 1) * Integer.parseInt(pageLimit);

        } catch (ArithmeticException e) {
            log.warn("[ArithmeticException]pageLimit: {}", pageLimit);
        }

        String commentListForJson = null;

        int totalCount = commentDao.selectCountComment(boardNo);
        List<String> pageBlockList = new Pagination().getCommentsBlockListOfBoard(boardNo, 5, castedCurrentPageBlock, totalCount);
        List<Map<String, Object>> commentList = commentDao.selectCommentList(boardNo, currentPage);

        HashMap<String, Object> resultMap = new HashMap<>();
        resultMap.put("commentList", commentList);
        resultMap.put("pageBlockList", pageBlockList);

        ObjectWriter objectWriter = new ObjectMapper().writerWithDefaultPrettyPrinter();

        try {
            commentListForJson = objectWriter.writeValueAsString(resultMap);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        return commentListForJson;
    }

}
