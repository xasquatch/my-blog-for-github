package net.xasquatch.myblog.mapper;

import net.xasquatch.myblog.mapper.builder.CommentBuilder;
import net.xasquatch.myblog.model.Comment;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.SelectProvider;

import java.util.List;
import java.util.Map;

public interface CommentMapper {

    @Insert("INSERT INTO comment(board_no, mbr_no, contents, created_ip, pwd) VALUES(#{board_no}, #{mbr_no}, #{contents}, #{created_ip}, #{pwd})")
    @SelectKey(statement = "SELECT LAST_INSERT_ID()", keyProperty = "no", before = false, resultType = long.class)
    int insertOneComment(Comment comment);

    @SelectProvider(type = CommentBuilder.class, method = "selectCommentList")
    List<Map<String, Object>> selectCommentList(Object boardNo, Object currentPage);

    @SelectProvider(type = CommentBuilder.class, method = "selectCountComment")
    int selectCountComment(Object boardNo);

    @Delete("DELETE FROM comment WHERE no = #{arg0} AND pwd = #{arg1}")
    int deleteCommentForGuest(Object commentNo, Object pwd);

    @Delete("DELETE FROM comment WHERE no = #{arg0}")
    int deleteComment(Object commentNo);


}
