package net.xasquatch.myblog.mapper;

import net.xasquatch.myblog.mapper.builder.LikeBuilder;
import net.xasquatch.myblog.model.Like;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface LikeMapper {

    /**
     *
     * @param likeNo
     * no값으로 like데이터 뽑아오기
     * TODO: 조인필요
     * @return
     */
    @Select("SELECT no, mbr_no, board_no, comment_no, good FROM lke WHERE no = #{arg0}")
    Like selectAllLike(Object likeNo);

    /**
     *
     * @param memberNo
     * 한 멤버의 모든 like가져오기
     * TODO: 조인필요
     * @return
     */
    @Select("SELECT no, mbr_no, board_no, comment_no, good FROM lke WHERE mbr_no = #{arg0}")
    List<Like> selectMemberLikeList(Object memberNo);

    @SelectProvider(method = "selectOneLike", type = LikeBuilder.class)
    Like selectOneLike(String likeTarget, Object likeNo);

    /**
     *
     * @param likeNo
     * @param memberNo
     * 두 파라미터로 해당 라이크 제거(취소)
     * @return
     */
    @Delete("DELETE FROM lke WHERE no = #{arg0} AND mbr_no = #{arg1}")
    int deleteOneLike(Object likeNo, Object memberNo);

    @InsertProvider(method = "insertOneLike", type = LikeBuilder.class)
    int insertOneLike(String likeTarget, String targetNo, String memberNo, String goodValue);

}
