package net.xasquatch.myblog.repository;

import lombok.extern.slf4j.Slf4j;
import net.xasquatch.myblog.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Slf4j
@Repository
public class UserDao {

    @Autowired
    private UserMapper userMapper;

    public String selectOneEmail(String email){
        log.debug(email);
        return userMapper.selectOneEmail(email);
    }

}
