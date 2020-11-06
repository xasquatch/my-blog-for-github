package net.xasquatch.myblog.mapper;

import net.xasquatch.myblog.model.Board;
import org.apache.ibatis.annotations.*;

public interface BoardMapper {

    @Select("SELECT * FROM board WHERE no = #{no}")
    String selectOneContents(Long no);

    @Insert("INSERT INTO board(member_no, keyword, title, contents, created_ip) VALUES(#{mbr_no}, #{keyword}, #{title}, '', #{created_ip})")
    @SelectKey(statement = "SELECT LAST_INSERT_ID()", keyProperty = "no", before = false, resultType = long.class)
    int insertBoardExceptionImg(Board board);

    @Update("UPDATE board SET thumbnail = #{thumbnailSrcDir} WHERE no = #{no}")
    int updateThumbnailImg(Board board);

    @Update("UPDATE board SET contents = #{contents} WHERE no = #{no}")
    int updateContents(Board board);

    @Delete("DELETE FROM board WHERE no = #{no}")
    int deleteOneBoard(Board board);
}