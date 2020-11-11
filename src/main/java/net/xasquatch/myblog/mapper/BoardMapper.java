package net.xasquatch.myblog.mapper;

import net.xasquatch.myblog.model.Board;
import org.apache.ibatis.annotations.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface BoardMapper {

    @Insert("INSERT INTO board(member_no, completed) VALUES(#{member_no}, 'false')")
    @SelectKey(statement = "SELECT LAST_INSERT_ID()", keyProperty = "no", before = false, resultType = long.class)
    int insertDefaultBoard(Map<String, Object> memberMap);

    @Update("UPDATE board SET keyword = #{keyword}, title = #{title}, contents = #{contents}, thumbnail = #{thumbnail}, created_ip = #{created_ip}, completed = 'true' WHERE no = #{no}")
    int updateBoard(Board board);

    @Delete("DELETE FROM board WHERE no = #{arg0}")
    int deleteOneBoard(Object boardKey);

    @Delete("DELETE FROM board WHERE completed = 'false' AND member_no = #{member_no}")
    void deleteUnfinishedBoard(Map<String, Object> memberMap);

    @Select("SELECT no, keyword, title, thumbnail, created_date, created_ip FROM board WHERE member_no = #{arg0} AND completed = 'true' ORDER BY no DESC Limit #{arg1}, #{arg2}")
    List<HashMap<String, Object>> selectBoardList(Object member_no, Object currentPage, Object lastPage);

    @Select("SELECT no, member_no, keyword, title, convert(contents USING UTF8) as contents, created_date, created_ip, thumbnail FROM board WHERE no = #{arg0}")
    HashMap<String, Object> selectOneBoard(Object board_no);


}