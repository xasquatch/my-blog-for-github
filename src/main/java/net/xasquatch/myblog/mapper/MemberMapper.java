package net.xasquatch.myblog.mapper;

import net.xasquatch.myblog.model.Authorization;
import net.xasquatch.myblog.model.Member;
import org.apache.ibatis.annotations.*;

import java.util.HashMap;
import java.util.List;
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

    @Select("SELECT no FROM mbr WHERE pwd = #{arg0}")
    int selectMbr(String pwdKey);

    @Update("UPDATE mbr SET name = #{name}, pwd = #{pwd} WHERE no = #{no} AND email = #{email}")
    int updateMbrDefault(Member member);

    @Delete("DELETE FROM mbr WHERE no = #{no}")
    int deleteOneMbr(Member member);

    @Select("SELECT m.no as no, a.rank as rank, m.email as email, m.pwd as pwd, m.name as name, m.img as img " +
            "FROM mbr m LEFT OUTER JOIN authorization a " +
            "ON m.authorization_no = a.no " +
            "WHERE m.email = #{arg0} AND m.pwd = #{arg1}")
    HashMap<String, Object> selectOneMbr(String email, String pwd);

    @Select("SELECT * FROM authorization")
    List<Authorization> selectAuthorization();

}
