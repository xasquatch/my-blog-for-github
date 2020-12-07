package net.xasquatch.myblog.repository;

import lombok.extern.slf4j.Slf4j;
import net.xasquatch.myblog.mapper.MemberMapper;
import net.xasquatch.myblog.model.Authorization;
import net.xasquatch.myblog.model.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Hashtable;
import java.util.Map;

@Slf4j
@Repository
public class MemberDao {

    @Autowired
    private MemberMapper memberMapper;

    public String selectEmail(String name) {
        return memberMapper.selectEmail(name);

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
        if (memberMapper.updateRank(no, email) == 1) result = true;
        return result;
    }

    public String selectOneEmail(String email) {
        return memberMapper.selectOneEmail(email);
    }

    public String selectOneName(String name) {
        return memberMapper.selectOneName(name);
    }

    public boolean insertMbrExceptionImg(Member member) {

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

    public boolean insertMbrForToken(Member member){

        //TODO: DB저장 후 member.setNo 호출하여 PK 저장
        memberMapper.insertMbrForToken(member);

        return member.getNo() != null;
    }

    public int selectMbr(Object no, String pwdKey) {
        int result = 0;
        try {
            result = memberMapper.selectMbr(no, pwdKey);
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

        if (memberMapper.updateMbrDefault(member) == 1) result = true;

        return result;
    }

    public Map<String, Object> selectOneMbr(Member member) {

        String email = member.getEmail();
        String pwd = member.getPwd();


        return memberMapper.selectOneMbr(email, pwd);
    }


    public Map<String, Object> selectOneMbrForToken(Member member) {

        String email = member.getEmail();
        String token = member.getToken();

        return memberMapper.selectOneMbrForToken(email, token);
    }


}
