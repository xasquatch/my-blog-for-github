package net.xasquatch.myblog.mapper;

import net.xasquatch.myblog.model.Board;
import org.apache.ibatis.annotations.*;

import java.util.HashMap;
import java.util.List;

public interface BoardMapper {

    @Insert("INSERT INTO board(member_no, keyword, title, contents, created_ip) VALUES(#{mbr_no}, #{keyword}, #{title}, '', #{created_ip})")
    @SelectKey(statement = "SELECT LAST_INSERT_ID()", keyProperty = "no", before = false, resultType = long.class)
    int insertBoardExceptionImg(Board board);

    @Update("UPDATE board SET keyword = #{keyword}, title = #{title}, contents = #{contents}, thumbnail = #{thumbnail} WHERE no = #{no}")
    int updateBoard(Board board);

    @Update("UPDATE board SET thumbnail = #{thumbnailSrcDir} WHERE no = #{no}")
    int updateThumbnailImg(Board board);

    @Update("UPDATE board SET contents = #{contents} WHERE no = #{no}")
    int updateContents(Board board);

    @Delete("DELETE FROM board WHERE no = #{arg0}")
    int deleteOneBoard(Object boardKey);

    @Select("SELECT no, keyword, title, thumbnail, created_date, created_ip FROM board WHERE member_no = #{arg0} ORDER BY no DESC")
    List<HashMap<String, Object>> selectBoardList(Object member_no);

    @Select("SELECT no, member_no, keyword, title, convert(contents USING UTF8) as contents, created_date, created_ip, thumbnail FROM board WHERE no = #{arg0}")
    HashMap<String, Object> selectOneBoard(Object board_no);


}