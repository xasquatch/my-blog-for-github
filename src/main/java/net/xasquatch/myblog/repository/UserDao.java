package net.xasquatch.myblog.repository;

import lombok.extern.slf4j.Slf4j;
import net.xasquatch.myblog.mapper.UserMapper;
import net.xasquatch.myblog.model.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
}
