package net.xasquatch.myblog.repository;

import lombok.extern.slf4j.Slf4j;
import net.xasquatch.myblog.mapper.UserMapper;
import net.xasquatch.myblog.model.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Slf4j
@Repository
public class UserDao {

    @Autowired
    private UserMapper userMapper;

    public String selectOneEmail(String email) {
        return userMapper.selectOneEmail(email);
    }

    public boolean insertOneMbr(Member member) {

        //TODO: DB저장 후 member.setNo 호출하여 PK 저장
        userMapper.insertOneMbr(member);

        return member.getNo() != null;

    }
    public boolean insertMbrExceptionImg(Member member) {

        //TODO: DB저장 후 member.setNo 호출하여 PK 저장
        userMapper.insertMbrExceptionImg(member);

        return member.getNo() != null;

    }

    public boolean updateMbrImg(Member member) {
        boolean result = false;

        //TODO: DB저장 후 member.setNo 호출하여 PK 저장
        if (userMapper.updateMbrImg(member) == 1) result = true;

        return result;
    }

    public boolean deleteOneMbr(Member member){
        boolean result = false;

        if (userMapper.deleteOneMbr(member) == 1) result = true;

        return result;
    }

    public Map<String, Object> selectOnMbr(Member member) {

        return userMapper.selectOnMbr(member);
    }
}
