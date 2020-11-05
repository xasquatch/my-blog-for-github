package net.xasquatch.myblog.mapper;

import net.xasquatch.myblog.model.Board;
import net.xasquatch.myblog.model.Member;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;

public interface BoardMapper {
    @Insert("INSERT INTO board(keyword, title, contents, created_ip, thumbnail) VALUES(#{keyword}, #{title}, #{contents}, #{created_ip}, #{thumbnailSrcDir})")
    @SelectKey(statement = "SELECT LAST_INSERT_ID()", keyProperty = "no", before = false, resultType = long.class)
    void insertOneBoard(Board board);

    @Select("SELECT * FROM board WHERE no = #{no}")
    String selectOneContents(Long no);
}
