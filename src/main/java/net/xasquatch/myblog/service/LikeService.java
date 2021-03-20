package net.xasquatch.myblog.service;


import net.xasquatch.myblog.repository.LikeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LikeService {

    @Autowired
    private LikeDao likeDao;

    public String increaseLike(String likeTarget, String targetNo, Long memberNo) {

        String result = "false";
        String historyResult = likeDao.selectOneLkeNo(likeTarget, targetNo, memberNo);
        if (historyResult != null) {
            likeDao.deleteLke(historyResult);
            result = "succeed cancel Like";

        } else {
            likeDao.insertLke(likeTarget, targetNo, String.valueOf(memberNo),"1");
            result = "succeed increase Like";

        }

        return result;
    }

    public String decreaseLike(String likeTarget, String targetNo, Long memberNo) {

        String result = "false";
        String historyResult = likeDao.selectOneLkeNo(likeTarget, targetNo, memberNo);
        if (historyResult != null) {
            likeDao.deleteLke(historyResult);
            result = "succeed cancel Like";

        } else {
            likeDao.insertLke(likeTarget, targetNo, String.valueOf(memberNo),"-1");
            result = "succeed decrease Like";

        }

        return result;

    }
}
