package net.xasquatch.myblog.repository;

import net.xasquatch.myblog.mapper.ApiMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class ApiDao {

    @Autowired
    private ApiMapper apiMapper;

    public Map<String, Object> selectBoardOne(String memberNo, String boardNo) {

        return apiMapper.selectBoardOne(memberNo, boardNo);
    }

    public List<Map<String, Object>> selectBoardList(Object memberNo, Object currentPage, Object pageLimit,
                                                     Object searchTarget, Object searchValue) {

        return apiMapper.selectBoardList(memberNo, currentPage, pageLimit, searchTarget, searchValue);
    }

    public int selectBoardCount(Object memberNo, String searchTarget, String searchValue) {
        try {
            return apiMapper.selectBoardCount(memberNo, searchTarget, searchValue);

        }catch (Exception e){
            return apiMapper.selectBoardCount(memberNo, "", "");
        }
    }

    public Map<String, Object> selectResource(Object memberNo, Object resourceNo) {
        return apiMapper.selectResourceOne(memberNo, resourceNo);
    }
}
