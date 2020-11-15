package net.xasquatch.myblog.repository;

import lombok.extern.slf4j.Slf4j;
import net.xasquatch.myblog.mapper.MemberMapper;
import net.xasquatch.myblog.model.Authorization;
import net.xasquatch.myblog.model.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

@Slf4j
@Repository
public class MemberDao {

    @Autowired
    private MemberMapper memberMapper;

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
}
