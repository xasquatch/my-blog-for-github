package net.xasquatch.myblog.repository;


import lombok.extern.slf4j.Slf4j;
import net.xasquatch.myblog.mapper.MemberMapper;
import net.xasquatch.myblog.model.Authorization;
import net.xasquatch.myblog.model.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Repository;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

@Slf4j
@Repository
@PropertySource("/WEB-INF/properties/security.properties")
public class MemberDao {

    @Autowired
    private MemberMapper memberMapper;

    @Value("${password.encryption.salt}")
    private String salt;

    public String selectEmail(String name) {
        return memberMapper.selectEmail(name);

    }

    public List<Map<String, Object>> selectAllMember(int currentPage, int pageLimit, String searchTarget, String searchValue) {
        return memberMapper.selectAllMember(currentPage, pageLimit, searchTarget, searchValue);
    }

    public int selectAllMemberCount(String searchTarget, String searchValue) {
        return memberMapper.selectAllMemberCount(searchTarget, searchValue);
    }

    public String selectNo(String email, String name) {
        return memberMapper.selectNo(email, name);
    }

    public Map<String, Long> selectAuthorization() {
        Map<String, Long> authorizationMap = new Hashtable<String, Long>();

        for (Authorization auth : memberMapper.selectAuthorization()) {
            authorizationMap.put(auth.getRank(), auth.getNo());
        }

        return authorizationMap;
    }

    public boolean updateRank(Long no, String email) {
        boolean result = false;
        try {
            Object memberRank = memberMapper.selectRank(no, email).get("rank");
            if (memberRank.equals("temporary"))
                if (memberMapper.updateRank(no, email) == 1) result = true;

        } catch (NullPointerException e) {
            log.warn(e.getMessage());

        }

        return result;
    }

    public long selectOneNo(String email) {
        return memberMapper.selectOneNo(email);
    }

    public String selectOneEmail(String email) {
        return memberMapper.selectOneEmail(email);
    }

    public String selectOneName(String name) {
        return memberMapper.selectOneName(name);
    }

    public boolean insertMbrExceptionImg(Member member) {

        member.setPwd(encryptPwd(member.getPwd()));

        //TODO: DB저장 후 member.setNo 호출하여 PK 저장
        memberMapper.insertMbrExceptionImg(member);

        return member.getNo() != null;

    }

    public boolean updateMbrImg(Member member) {
        boolean result = false;

        //TODO: DB저장 후 member.setNo 호출하여 PK 저장
        if (memberMapper.updateMbrImg(member) == 1) result = true;

        return result;
    }

    public boolean insertMbrForToken(Member member) {

        member.setPwd(encryptPwd(member.getPwd()));

        //TODO: DB저장 후 member.setNo 호출하여 PK 저장
        memberMapper.insertMbrForToken(member);

        return member.getNo() != null;
    }

    public int selectMbr(Object no, String pwdKey) {
        int result = 0;
        try {
            result = memberMapper.selectMbr(no, encryptPwd(pwdKey));
        } catch (Exception e) {
            log.warn("selectMbr Exception: no:{} key:{}", no, pwdKey);
        }
        return result;
    }

    public boolean deleteOneMbr(Member member) {
        boolean result = false;

        if (memberMapper.deleteOneMbr(member) == 1) result = true;

        return result;
    }

    public boolean updateMbrDefault(Member member) {
        boolean result = false;

        member.setPwd(encryptPwd(member.getPwd()));
        if (memberMapper.updateMbrDefault(member) == 1) result = true;

        return result;
    }

    public Map<String, Object> selectOneMbr(Member member) {

        String email = member.getEmail();
        String pwd = member.getPwd();

        return memberMapper.selectOneMbr(email, encryptPwd(pwd));
    }


    public Map<String, Object> selectOneMbrForToken(Member member) {
        String email = member.getEmail();

        return memberMapper.selectOneMbrForToken(email);
    }

    public Map<String, Object> selectOneMbrForManagement(String memberEmail) {

        return memberMapper.selectOneMbrForToken(memberEmail);
    }

    public String encryptPwd(String pwd) {

        MessageDigest md = null;
        try {
            md = MessageDigest.getInstance("SHA-512");
            md.update(salt.getBytes());
            md.update(pwd.getBytes());

        } catch (Exception e) {
            log.warn("암호화 예외 발생");
        }

        return String.format("%0128x", new BigInteger(1, md.digest()));
    }

}
