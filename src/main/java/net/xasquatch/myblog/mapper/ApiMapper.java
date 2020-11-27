package net.xasquatch.myblog.mapper;

import net.xasquatch.myblog.mapper.builder.BoardBuilder;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;

import java.util.List;
import java.util.Map;

public interface ApiMapper {

    @SelectProvider(type = BoardBuilder.class, method = "selectBoardList")
    List<Map<String, Object>> selectBoardList(Object memberNo, Object currentPage, Object pageLimit,
                                              Object searchTarget, Object searchValue);

    @SelectProvider(type = BoardBuilder.class, method = "selectBoardCount")
    int selectBoardCount(Object memberNo, String searchTarget, String searchValue);

    @Select("SELECT b.no AS no, " +
            "b.mbr_no AS mbr_no, " +
            "m.name AS name, " +
            "b.keyword AS keyword, " +
            "b.title AS title, " +
            "convert(b.contents USING UTF8) AS contents, " +
            "DATE_FORMAT(b.created_date, '%Y.%m.%d %H:%i:%s') AS created_date, " +
            "b.thumbnail AS thumbnail, " +
            "REPLACE(b.created_ip, RIGHT(b.created_ip, 4),'.***') AS created_ip " +
            "FROM board b LEFT OUTER JOIN mbr m " +
            "ON b.mbr_no = m.no " +
            "WHERE b.mbr_no = #{arg0} AND b.no = #{arg1}")
    Map<String, Object> selectBoardOne(String memberNo, String boardNo);

    @Select("SELECT no, mbr_no, title, contents FROM resource WHERE mbr_no = #{arg0} AND no = #{arg1}")
    Map<String, Object> selectResourceOne(Object memberNo, Object resourceNo);
}