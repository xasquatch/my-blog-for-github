package net.xasquatch.myblog.repository;

import net.xasquatch.myblog.mapper.LikeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LikeDao {

    @Autowired
    private LikeMapper likeMapper;

    public String selectOneLkeNo(String likeTarget, Object targetNo, Object memberNo) {
        return likeMapper.selectOneLkeNo(likeTarget, targetNo, memberNo);

    }

    public void deleteLke(String targetNo) {
        likeMapper.deleteOneLke(targetNo);
    }

    public void insertLke(String likeTarget, String targetNo, String memberNo, String likeValue) {
        likeMapper.insertOneLke(likeTarget, targetNo, memberNo, likeValue);
    }
}
