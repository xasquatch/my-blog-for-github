package net.xasquatch.myblog.mapper;

import net.xasquatch.myblog.mapper.builder.LikeBuilder;
import net.xasquatch.myblog.model.Like;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface LikeMapper {

    /**
     * @param likeNo no값으로 like데이터 뽑아오기
     *               TODO: 조인필요
     * @return
     */
    @Select("SELECT no, mbr_no, board_no, comment_no, good FROM lke WHERE no = #{arg0}")
    Like selectAllLke(Object likeNo);

    /**
     * @param memberNo 한 멤버의 모든 like가져오기
     *                 TODO: 조인필요
     * @return
     */
    @Select("SELECT no, mbr_no, board_no, comment_no, good FROM lke WHERE mbr_no = #{arg0}")
    List<Like> selectMemberLkeList(Object memberNo);

    @SelectProvider(method = "selectOneLke", type = LikeBuilder.class)
    Like selectOneLke(String likeTarget, Object likeNo);

    @SelectProvider(method = "selectOneLkeNo", type = LikeBuilder.class)
    String selectOneLkeNo(String likeTarget, Object targetNo, Object memberNo);


    /**
     * @param likeNo
     * @param memberNo 두 파라미터로 해당 라이크 제거(취소)
     * @return
     */
    @Delete("DELETE FROM lke WHERE no = #{arg0}")
    int deleteOneLke(Object likeNo);

    @InsertProvider(method = "insertOneLke", type = LikeBuilder.class)
    int insertOneLke(String likeTarget, String targetNo, String memberNo, String goodValue);

}
