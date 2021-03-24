package net.xasquatch.myblog.repository;

import net.xasquatch.myblog.mapper.CommentMapper;
import net.xasquatch.myblog.model.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class CommentDao {

    @Autowired
    private CommentMapper commentMapper;

    public List<Map<String, Object>> selectCommentList(Object boardNo) {

        return commentMapper.selectCommentList(boardNo);
    }

    public int deleteComment(Object commentNo, Object pwd) {

        return commentMapper.deleteCommentForGuest(commentNo, pwd);
    }

    public int deleteComment(Object commentNo) {

        return commentMapper.deleteComment(commentNo);
    }

    public int insertOneComment(Comment comment) {
        return commentMapper.insertOneComment(comment);
    }


}
