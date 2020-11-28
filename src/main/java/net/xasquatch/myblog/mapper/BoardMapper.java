package net.xasquatch.myblog.mapper;

import net.xasquatch.myblog.model.Board;
import org.apache.ibatis.annotations.*;

import java.util.HashMap;
import java.util.Map;

public interface BoardMapper {

    @Insert("INSERT INTO board(mbr_no, completed) VALUES(#{mbr_no}, 'false')")
    @SelectKey(statement = "SELECT LAST_INSERT_ID()", keyProperty = "no", before = false, resultType = long.class)
    int insertDefaultBoard(Map<String, Object> memberMap);

    @Update("UPDATE board SET keyword = #{keyword}, title = #{title}, contents = #{contents}, thumbnail = #{thumbnail}, created_ip = #{created_ip}, completed = 'true' WHERE no = #{no}")
    int updateBoard(Board board);

    @Delete("DELETE FROM board WHERE no = #{arg0}")
    void deleteOneBoard(Object boardKey);

    @Delete("DELETE FROM board WHERE completed = 'false' AND mbr_no = #{mbr_no}")
    void deleteUnfinishedBoard(Map<String, Object> memberMap);

    @Select("SELECT no, mbr_no, keyword, title, convert(contents USING UTF8) as contents, created_date, created_ip, thumbnail FROM board WHERE no = #{arg1} AND mbr_no = #{arg0}")
    HashMap<String, Object> selectOneBoard(Object mbr_no, Object board_no);

}