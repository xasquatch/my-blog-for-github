package net.xasquatch.myblog.mapper;

import org.apache.ibatis.annotations.Select;

public interface UserMapper {

    @Select("SELECT email FROM mbr WHERE email = #{email}")
    String selectOneEmail(String email);
}
