package net.xasquatch.myblog.mapper;

import net.xasquatch.myblog.mapper.provider.BoardBuilder;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;

import java.util.List;
import java.util.Map;

public interface ApiMapper {

    @SelectProvider(type = BoardBuilder.class, method = "selectBoardList")
    List<Map<String, Object>> selectBoardList(Object memberNo, Object currentPage, Object pageLimit,
                                              Object searchTarget, Object searchValue);

    @Select("SELECT COUNT(*) as total_count FROM board WHERE member_no = #{arg0} AND completed = 'true'")
    int selectBoardCount(Object memberNo);

    @Select("SELECT no, member_no, keyword, title, " +
            "convert(contents USING UTF8) as contents, " +
            "created_date, thumbnail, " +
            "REPLACE(created_ip, RIGHT(created_ip,5),'*****') AS created_ip " +
            "FROM board " +
            "WHERE member_no = #{arg0} AND no = #{arg1}")
    Map<String, Object> selectBoardOne(String memberNo, String boardNo);
}
