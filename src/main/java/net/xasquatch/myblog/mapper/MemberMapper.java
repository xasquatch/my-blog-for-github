package net.xasquatch.myblog.mapper;

import net.xasquatch.myblog.model.Member;
import org.apache.ibatis.annotations.*;

import java.util.HashMap;
import java.util.Map;

public interface MemberMapper {

    @Select("SELECT email FROM mbr WHERE email = #{email}")
    String selectOneEmail(String email);

    @Insert("INSERT INTO mbr(email, pwd, name, img) VALUES(#{email}, #{pwd}, #{name}, #{img})")
    @SelectKey(statement = "SELECT LAST_INSERT_ID()", keyProperty = "no", before = false, resultType = long.class)
    void insertOneMbr(Member member);

    @Insert("INSERT INTO mbr(email, pwd, name) VALUES(#{email}, #{pwd}, #{name})")
    @SelectKey(statement = "SELECT LAST_INSERT_ID()", keyProperty = "no", before = false, resultType = long.class)
    void insertMbrExceptionImg(Member member);

    @Update("UPDATE mbr SET img = #{img} WHERE no = #{no}")
    int updateMbrImg(Member member);

    @Delete("DELETE FROM mbr WHERE no = #{no}")
    int deleteOneMbr(Member member);

    @Select("SELECT * FROM mbr WHERE email = #{email} AND pwd = #{pwd}")
    HashMap<String ,Object> selectOnMbr(Member member);
}
