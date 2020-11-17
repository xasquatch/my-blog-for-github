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
    void deleteOneBoard(Object boardKey);

    @Delete("DELETE FROM board WHERE completed = 'false' AND member_no = #{member_no}")
    void deleteUnfinishedBoard(Map<String, Object> memberMap);

    @Select("SELECT COUNT(*) as list_count FROM board WHERE member_no = #{arg0} AND completed = 'true'")
    int selectBoardListCount(Object member_no);

    @Select("SELECT no, member_no, keyword, title, convert(contents USING UTF8) as contents, created_date, created_ip, thumbnail FROM board WHERE no = #{arg0}")
    HashMap<String, Object> selectOneBoard(Object board_no);


    @Select("SELECT * FROM " +
                "(SELECT @ROWNUM := @ROWNUM + 1 AS rowno, board.* " +
                "FROM board board, (SELECT @ROWNUM := 0 ) TMP " +
                "WHERE member_no = #{arg0} AND completed = 'true'" +
                "ORDER BY board.no ASC)SUB " +
            "ORDER BY SUB.rowno DESC " +
            "Limit #{arg1}, #{arg2};")
    List<HashMap<String, Object>> selectBoardList(Object member_no, Object currentPage, Object lastPage);

    @Select("SELECT * FROM " +
                "(SELECT @ROWNUM := @ROWNUM + 1 AS rowno, board.* " +
                "FROM board board, (SELECT @ROWNUM := 0 ) TMP " +
                "WHERE member_no = #{arg0} AND completed = 'true' AND (keyword LIKE #{arg3})" +
                "ORDER BY board.no ASC)SUB " +
            "ORDER BY SUB.rowno DESC " +
            "Limit #{arg1}, #{arg2};")
    List<HashMap<String, Object>> selectBoardListWhereLikeKeyword(Object member_no, Object currentPage, Object lastPage, Object searchValue);

    @Select("SELECT * FROM " +
                "(SELECT @ROWNUM := @ROWNUM + 1 AS rowno, board.* " +
                "FROM board board, (SELECT @ROWNUM := 0 ) TMP " +
                "WHERE member_no = #{arg0} AND completed = 'true' AND (title LIKE #{arg3})" +
                "ORDER BY board.no ASC)SUB " +
            "ORDER BY SUB.rowno DESC " +
            "Limit #{arg1}, #{arg2};")
    List<HashMap<String, Object>> selectBoardListWhereLikeTitle(Object member_no, Object currentPage, Object lastPage, Object searchValue);

    @Select("SELECT * FROM " +
                "(SELECT @ROWNUM := @ROWNUM + 1 AS rowno, board.* " +
                "FROM board board, (SELECT @ROWNUM := 0 ) TMP " +
                "WHERE member_no = #{arg0} AND completed = 'true' AND (contents LIKE #{arg3})" +
                "ORDER BY board.no ASC)SUB " +
            "ORDER BY SUB.rowno DESC " +
            "Limit #{arg1}, #{arg2};")
    List<HashMap<String, Object>> selectBoardListWhereLikeContents(Object member_no, Object currentPage, Object lastPage, Object searchValue);

    @Select("SELECT * FROM " +
                "(SELECT @ROWNUM := @ROWNUM + 1 AS rowno, board.* " +
                "FROM board board, (SELECT @ROWNUM := 0 ) TMP " +
                "WHERE member_no = #{arg0} AND completed = 'true' AND (title LIKE #{arg3} OR contents LIKE #{arg3})" +
                "ORDER BY board.no ASC)SUB " +
            "ORDER BY SUB.rowno DESC " +
            "Limit #{arg1}, #{arg2};")
    List<HashMap<String, Object>> selectBoardListWhereLikeTitleAndContents(Object member_no, Object currentPage, Object lastPage, Object searchValue);

}