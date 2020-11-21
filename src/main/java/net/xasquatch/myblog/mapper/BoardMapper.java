package net.xasquatch.myblog.mapper;

import net.xasquatch.myblog.model.Board;
import org.apache.ibatis.annotations.*;

import java.util.HashMap;
import java.util.List;
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
/*-----------------------------------------------------------------*/
    @Select("SELECT COUNT(*) as list_count FROM board WHERE mbr_no = #{arg0} AND completed = 'true'")
    int selectBoardListCount(Object mbr_no);

    @Select("SELECT * FROM " +
                "(SELECT @ROWNUM := @ROWNUM + 1 AS rowno, board.* " +
                "FROM board board, (SELECT @ROWNUM := 0 ) TMP " +
                "WHERE mbr_no = #{arg0} AND completed = 'true'" +
                "ORDER BY board.no ASC)SUB " +
            "ORDER BY SUB.rowno DESC " +
            "Limit #{arg1}, #{arg2};")
    List<HashMap<String, Object>> selectBoardList(Object mbr_no, Object currentPage, Object lastPage);

    @Select("SELECT * FROM " +
                "(SELECT @ROWNUM := @ROWNUM + 1 AS rowno, board.* " +
                "FROM board board, (SELECT @ROWNUM := 0 ) TMP " +
                "WHERE mbr_no = #{arg0} AND completed = 'true' AND (keyword LIKE #{arg3})" +
                "ORDER BY board.no ASC)SUB " +
            "ORDER BY SUB.rowno DESC " +
            "Limit #{arg1}, #{arg2};")
    List<HashMap<String, Object>> selectBoardListWhereLikeKeyword(Object mbr_no, Object currentPage, Object lastPage, Object searchValue);

    @Select("SELECT * FROM " +
                "(SELECT @ROWNUM := @ROWNUM + 1 AS rowno, board.* " +
                "FROM board board, (SELECT @ROWNUM := 0 ) TMP " +
                "WHERE mbr_no = #{arg0} AND completed = 'true' AND (title LIKE #{arg3})" +
                "ORDER BY board.no ASC)SUB " +
            "ORDER BY SUB.rowno DESC " +
            "Limit #{arg1}, #{arg2};")
    List<HashMap<String, Object>> selectBoardListWhereLikeTitle(Object mbr_no, Object currentPage, Object lastPage, Object searchValue);

    @Select("SELECT * FROM " +
                "(SELECT @ROWNUM := @ROWNUM + 1 AS rowno, board.* " +
                "FROM board board, (SELECT @ROWNUM := 0 ) TMP " +
                "WHERE mbr_no = #{arg0} AND completed = 'true' AND (contents LIKE #{arg3})" +
                "ORDER BY board.no ASC)SUB " +
            "ORDER BY SUB.rowno DESC " +
            "Limit #{arg1}, #{arg2};")
    List<HashMap<String, Object>> selectBoardListWhereLikeContents(Object mbr_no, Object currentPage, Object lastPage, Object searchValue);

    @Select("SELECT * FROM " +
                "(SELECT @ROWNUM := @ROWNUM + 1 AS rowno, board.* " +
                "FROM board board, (SELECT @ROWNUM := 0 ) TMP " +
                "WHERE mbr_no = #{arg0} AND completed = 'true' AND (title LIKE #{arg3} OR contents LIKE #{arg3})" +
                "ORDER BY board.no ASC)SUB " +
            "ORDER BY SUB.rowno DESC " +
            "Limit #{arg1}, #{arg2};")
    List<HashMap<String, Object>> selectBoardListWhereLiketitleOrContents(Object mbr_no, Object currentPage, Object lastPage, Object searchValue);

    /*--------TODO:전체글 조회---------------------------------------------------------*/
    @Select("SELECT COUNT(*) as list_count FROM board WHERE completed = 'true'")
    int selectAllBoardListCount();

    @Select("SELECT * FROM " +
            "(SELECT @ROWNUM := @ROWNUM + 1 AS rowno, board.* " +
            "FROM board board, (SELECT @ROWNUM := 0 ) TMP " +
            "WHERE completed = 'true'" +
            "ORDER BY board.no ASC)SUB " +
            "ORDER BY SUB.rowno DESC " +
            "Limit #{arg0}, #{arg1};")
    List<HashMap<String, Object>> selectAllBoardList(Object currentPage, Object lastPage);

    @Select("SELECT * FROM " +
            "(SELECT @ROWNUM := @ROWNUM + 1 AS rowno, board.* " +
            "FROM board board, (SELECT @ROWNUM := 0 ) TMP " +
            "WHERE completed = 'true' AND (keyword LIKE #{arg2})" +
            "ORDER BY board.no ASC)SUB " +
            "ORDER BY SUB.rowno DESC " +
            "Limit #{arg0}, #{arg1};")
    List<HashMap<String, Object>> selectAllBoardListWhereLikeKeyword(Object currentPage, Object lastPage, Object searchValue);

    @Select("SELECT * FROM " +
            "(SELECT @ROWNUM := @ROWNUM + 1 AS rowno, board.* " +
            "FROM board board, (SELECT @ROWNUM := 0 ) TMP " +
            "WHERE completed = 'true' AND (title LIKE #{arg2})" +
            "ORDER BY board.no ASC)SUB " +
            "ORDER BY SUB.rowno DESC " +
            "Limit #{arg0}, #{arg1};")
    List<HashMap<String, Object>> selectAllBoardListWhereLikeTitle(Object currentPage, Object lastPage, Object searchValue);

    @Select("SELECT * FROM " +
            "(SELECT @ROWNUM := @ROWNUM + 1 AS rowno, board.* " +
            "FROM board board, (SELECT @ROWNUM := 0 ) TMP " +
            "WHERE completed = 'true' AND (contents LIKE #{arg2})" +
            "ORDER BY board.no ASC)SUB " +
            "ORDER BY SUB.rowno DESC " +
            "Limit #{arg0}, #{arg1};")
    List<HashMap<String, Object>> selectAllBoardListWhereLikeContents(Object currentPage, Object lastPage, Object searchValue);

    @Select("SELECT * FROM " +
            "(SELECT @ROWNUM := @ROWNUM + 1 AS rowno, board.* " +
            "FROM board board, (SELECT @ROWNUM := 0 ) TMP " +
            "WHERE completed = 'true' AND (title LIKE #{arg2} OR contents LIKE #{arg2})" +
            "ORDER BY board.no ASC)SUB " +
            "ORDER BY SUB.rowno DESC " +
            "Limit #{arg0}, #{arg1};")
    List<HashMap<String, Object>> selectAllBoardListWhereLiketitleOrContents(Object currentPage, Object lastPage, Object searchValue);

    /*-----------------------------------------------------------------*/

}