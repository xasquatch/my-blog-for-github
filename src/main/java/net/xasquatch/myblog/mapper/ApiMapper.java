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

    @Select("SELECT COUNT(*) as total_count FROM board WHERE mbr_no = #{arg0} AND completed = 'true'")
    int selectBoardCount(Object memberNo);

    @Select("SELECT no, mbr_no, keyword, title, " +
            "convert(contents USING UTF8) as contents, " +
            "DATE_FORMAT(created_date, '%Y.%m.%d %H:%i:%s') AS created_date, " +
            "thumbnail, " +
            "REPLACE(created_ip, RIGHT(created_ip, 4),'.***') AS created_ip " +
            "FROM board " +
            "WHERE mbr_no = #{arg0} AND no = #{arg1}")
    Map<String, Object> selectBoardOne(String memberNo, String boardNo);

    @Select("SELECT no, mbr_no, title, contents FROM resource WHERE mbr_no = #{arg0} AND no = #{arg1}")
    Map<String, Object> selectResourceOne(Object memberNo, Object resourceNo);
}