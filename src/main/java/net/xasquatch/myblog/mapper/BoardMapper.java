package net.xasquatch.myblog.mapper;

import net.xasquatch.myblog.mapper.builder.BoardBuilder;
import net.xasquatch.myblog.mapper.builder.CommentBuilder;
import net.xasquatch.myblog.model.Board;
import net.xasquatch.myblog.model.Comment;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

public interface BoardMapper {

    //TODO: 게시글 작성 1단계 기본 멤버 넘버삽입하여 selectKey 확보
    @Insert("INSERT INTO board(mbr_no, completed) VALUES(#{mbr_no}, 'false')")
    @SelectKey(statement = "SELECT LAST_INSERT_ID()", keyProperty = "no", before = false, resultType = long.class)
    int insertDefaultBoard(Map<String, Object> memberMap);

    //TODO: 게시글 작성 1단계에서 확보한 selectKey를 통해 나머지 내역 업데이트, 글 작성완료  ----> 글 새로 작성, 글 수정에 쓰임
    @Update("UPDATE board SET keyword = #{keyword}, title = #{title}, contents = #{contents}, thumbnail = #{thumbnail}, created_ip = #{created_ip}, pwd = #{pwd}, completed = 'true' WHERE no = #{no}")
    int updateBoard(Board board);

    //TODO: 게시글 작성 1단계에서 더 이상 작성되지 않고 새 글 작성시 그 전의 글 삭제
    @Delete("DELETE FROM board WHERE completed = 'false' AND mbr_no = #{mbr_no}")
    void deleteUnfinishedBoard(Map<String, Object> memberMap);

    //TODO: 게시글 삭제
    @Delete("DELETE FROM board WHERE no = #{arg0}")
    int deleteOneBoard(Object boardKey);

    //TODO: 게시글 상세보기
    @Select("SELECT b.no AS no,  " +
            "b.mbr_no AS mbr_no,  " +
            "m.name AS name,  " +
            "b.keyword AS keyword,  " +
            "b.title AS title,  " +
            "convert(b.contents USING UTF8) AS contents,  " +
            "DATE_FORMAT(b.created_date, '%Y.%m.%d %H:%i:%s') AS created_date,  " +
            "b.thumbnail AS thumbnail,  " +
            "REPLACE(b.created_ip, RIGHT(b.created_ip, 4),'.***') AS created_ip  " +
            "FROM board b LEFT OUTER JOIN mbr m  " +
            "ON b.mbr_no = m.no  " +
            "WHERE b.mbr_no = #{arg0} AND b.no = #{arg1}")
    Map<String, Object> selectOneBoard(Object mbr_no, Object board_no);

    @SelectProvider(type = BoardBuilder.class, method = "selectBoardList")
    List<Map<String, Object>> selectBoardList(Object memberNo, Object currentPage, Object pageLimit,
                                              Object searchTarget, Object searchValue);

    @SelectProvider(type = BoardBuilder.class, method = "selectBoardCount")
    int selectBoardCount(Object memberNo, String searchTarget, String searchValue);

    @SelectProvider(type = BoardBuilder.class, method = "selectNoticeList")
    List<Map<String, Object>> selectNoticeList(Object rank, Object currentPage, Object pageLimit,
                                               Object searchTarget, Object searchValue);

    @SelectProvider(type = BoardBuilder.class, method = "selectNoticeCount")
    int selectNoticeCount(Object rank, String searchTarget, String searchValue);

    @Insert("INSERT INTO comment(board_no, mbr_no, contents, created_ip, pwd) VALUES(#{board_no}, #{mbr_no}, #{contents}, #{created_ip}, #{pwd})")
    @SelectKey(statement = "SELECT LAST_INSERT_ID()", keyProperty = "no", before = false, resultType = long.class)
    int insertOneComment(Comment comment);

    @SelectProvider(type = CommentBuilder.class, method = "selectCommentList")
    List<Map<String, Object>> selectCommentList(Object boardNo);

    @Delete("DELETE FROM comment WHERE no = #{arg0} AND pwd = #{arg1}")
    int deleteCommentForGuest(Object commentNo, Object pwd);

    @Delete("DELETE FROM comment WHERE no = #{arg0}")
    int deleteComment(Object commentNo);

    @Select("SELECT COUNT(no) FROM board WHERE no = #{arg0} AND pwd = #{arg1}")
    int selectOneBoardColumnPwd(Object boardno, String pwd);
}