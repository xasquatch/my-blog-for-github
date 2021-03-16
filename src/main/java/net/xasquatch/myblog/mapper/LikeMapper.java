package net.xasquatch.myblog.mapper;

import net.xasquatch.myblog.model.Like;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface LikeMapper {

    @Select("SELECT no, mbr_no, board_no, comment_no, good FROM lke WHERE no = #{arg0}")
    Like selectAllLike(Object likeNo);

    @Select("SELECT no, mbr_no, board_no, comment_no, good FROM lke WHERE mbr_no = #{arg0}")
    List<Like> selectMemberLikeList(Object memberNo);

    @SelectProvider(method = "selectOneLike", type = LikeMapper.class)
    Like selectOneLike(Object likeNo, Object memberNo);

    @Delete("DELETE FROM lke WHERE no = #{arg0} AND mbr_no = #{arg1}")
    int deleteOneLike(Object likeNo, Object memberNo);

    @Update("UPDATE lke SET good = #{arg2} WHERE no = #{arg0} AND mbr_no = #{arg1}")
    int updateOneLike(Object likeNo, Object memberNo, Object goodValue);

}
