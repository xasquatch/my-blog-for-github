package net.xasquatch.myblog.mapper;

import net.xasquatch.myblog.model.Authorization;
import net.xasquatch.myblog.model.Member;
import org.apache.ibatis.annotations.*;

import java.util.HashMap;
import java.util.List;

public interface MemberMapper {

    @Select("SELECT email FROM mbr WHERE email = #{email}")
    String selectOneEmail(String email);

    @Select("SELECT name FROM mbr WHERE name = #{name}")
    String selectOneName(String name);

    @Insert("INSERT INTO mbr(email, pwd, name, img) VALUES(#{email}, #{pwd}, #{name}, #{img})")
    @SelectKey(statement = "SELECT LAST_INSERT_ID()", keyProperty = "no", before = false, resultType = long.class)
    void insertOneMbr(Member member);

    @Insert("INSERT INTO mbr(email, pwd, name) VALUES(#{email}, #{pwd}, #{name})")
    @SelectKey(statement = "SELECT LAST_INSERT_ID()", keyProperty = "no", before = false, resultType = long.class)
    void insertMbrExceptionImg(Member member);

    @Update("UPDATE mbr SET img = #{img} WHERE no = #{no}")
    int updateMbrImg(Member member);

    @Select("SELECT no FROM mbr WHERE no = #{arg0} AND pwd = #{arg1}")
    int selectMbr(Object no, String pwdKey);

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

    @Update("UPDATE mbr SET authorization_no = 2, email = #{arg1} WHERE no = #{arg0}")
    int updateRank(Long no, String email);

    @Select("SELECT email FROM mbr WHERE name = #{arg0}")
    String selectEmail(String name);

    @Select("SELECT no FROM mbr WHERE email = #{arg0} AND name = #{arg1}")
    String selectNo(String email, String name);

}
