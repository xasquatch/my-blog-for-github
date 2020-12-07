package net.xasquatch.myblog.mapper;

import net.xasquatch.myblog.model.Authorization;
import net.xasquatch.myblog.model.Member;
import org.apache.ibatis.annotations.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface MemberMapper {

    /**
     *
     * @param email
     * @return 이메일 중복확인 후 해당 이메일 반환 없으면 null
     */
    @Select("SELECT email FROM mbr WHERE email = #{email}")
    String selectOneEmail(String email);

    /**
     *
     * @param name
     * @return 이름 중복확인 후 해당 이름 반환 없으면 null
     */
    @Select("SELECT name FROM mbr WHERE name = #{name}")
    String selectOneName(String name);

    /**
     * @param member
     * member객체를 DB에 주입 후 no값을 member객체에 주입
     */
    @Insert("INSERT INTO mbr(email, pwd, name) VALUES(#{email}, #{pwd}, #{name})")
    @SelectKey(statement = "SELECT LAST_INSERT_ID()", keyProperty = "no", before = false, resultType = long.class)
    void insertMbrExceptionImg(Member member);

    /**
     * @param member
     * @return member의 이미지 dataUrl방식의 이미지 DB에 등록 후 결과값반환 성공시 1, 실패시 0
     */
    @Update("UPDATE mbr SET img = #{img} WHERE no = #{no}")
    int updateMbrImg(Member member);

    /**
     * @param member
     * 패스워드는 임의의 랜덤값으로 삽입
     */
    @Insert("INSERT INTO mbr(email, pwd, token, name, img) VALUES(#{email}, #{pwd}, #{token}, #{name}, #{img})")
    void insertMbrForToken(Member member);

    /**
     * @param no
     * @param pwdKey
     * @return 이메일 변경 시 해당 멤버가 맞는지 확인 후 결과값 반환 성공시 1, 실패시 0
     */
    @Select("SELECT no FROM mbr WHERE no = #{arg0} AND pwd = #{arg1}")
    int selectMbr(Object no, String pwdKey);

    /**
     *
     * @param member
     * @return 멤버객체를 통해 이미지를 제외한 나머지 컬럼들 업로드 후 결과값 반환 성공시 1, 실패시 0
     */
    @Update("UPDATE mbr SET name = #{name}, pwd = #{pwd} WHERE no = #{no} AND email = #{email}")
    int updateMbrDefault(Member member);

    /**
     *
     * @param member
     * @return 회원탈퇴, 성공시 1, 실패시 0
     */
    @Delete("DELETE FROM mbr WHERE no = #{no}")
    int deleteOneMbr(Member member);

    /**
     * @param email
     * @param pwd
     * @return 이메일과 비밀번호를 대조하여 DB에서 멤버테이블과 권한 테이블은 조인하여 Map형태로 반환
     */
    @Select("SELECT m.no as no, a.rank as rank, m.email as email, m.pwd as pwd, m.name as name, m.img as img " +
            "FROM mbr m LEFT OUTER JOIN authorization a " +
            "ON m.authorization_no = a.no " +
            "WHERE m.email = #{arg0} AND m.pwd = #{arg1}")
    Map<String, Object> selectOneMbr(String email, String pwd);

    /**
     * @param email
     * @param token
     * @return 이메일과 토큰을 대조하여 DB에서 멤버테이블과 권한 테이블은 조인하여 Map형태로 반환
     */
    @Select("SELECT m.no as no, a.rank as rank, m.email as email, m.token as token, m.name as name, m.img as img " +
            "FROM mbr m LEFT OUTER JOIN authorization a " +
            "ON m.authorization_no = a.no " +
            "WHERE m.email = #{arg0} AND m.token = #{arg1}")
    Map<String, Object> selectOneMbrForToken(String email, String token);

    /**
     * @return 권한테이블 DB에서 권한들 목록을 가져옴
     */
    @Select("SELECT * FROM authorization")
    List<Authorization> selectAuthorization();

    /**
     * @param no
     * @param email
     * @return 임시회원에서 일반회원으로 변경 후 결과값 반환 성공시 1, 실패시 0
     */
    @Update("UPDATE mbr SET authorization_no = 2, email = #{arg1} WHERE no = #{arg0}")
    int updateRank(Long no, String email);

    /**
     * @param name
     * @return 이메일 찾기 시에 사용 됨 이름을 통해 이메일 값 반환
     */
    @Select("SELECT email FROM mbr WHERE name = #{arg0}")
    String selectEmail(String name);

    /**
     * @param email
     * @param name
     * @return 비밀번호 찾기시에 사용됨, 비밀번호 변경을 위해 해당 멤버의 no값을 반환
     */
    @Select("SELECT no FROM mbr WHERE email = #{arg0} AND name = #{arg1}")
    String selectNo(String email, String name);

}
