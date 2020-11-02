package net.xasquatch.myblog.mapper;

import net.xasquatch.myblog.model.Member;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface UserMapper {

    @Select("SELECT email FROM mbr WHERE email = #{email}")
    String selectOneEmail(String email);

    @Insert("INSERT INTO mbr(email, pwd, name, img) VALUES(#{email}, #{pwd}, #{name}, #{img})")
    void insertOneMbr(Member member);
}
