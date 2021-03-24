package net.xasquatch.myblog.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import net.xasquatch.myblog.model.Comment;
import net.xasquatch.myblog.model.Member;
import net.xasquatch.myblog.repository.CommentDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

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


    public String getCommentList(Object boardNo) {

        String commentListForJson = null;
        List<Map<String, Object>> commentList = commentDao.selectCommentList(boardNo);
        ObjectWriter objectWriter = new ObjectMapper().writerWithDefaultPrettyPrinter();

        try {
            commentListForJson = objectWriter.writeValueAsString(commentList);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }


        return commentListForJson;
    }

}
