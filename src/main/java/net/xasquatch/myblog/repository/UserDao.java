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

        userMapper.insertOneMbr(member);
//        Long test = userMapper.insertOneMbr(member);
//        System.out.println("test = " + test);
//
        return userMapper.selectOneEmail(member.getEmail()) != null;
//        return userMapper.selectOneEmail(member.getEmail()) != null;

    }
}
