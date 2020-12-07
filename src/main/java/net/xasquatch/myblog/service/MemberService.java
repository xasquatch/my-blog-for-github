package net.xasquatch.myblog.service;

import lombok.extern.slf4j.Slf4j;
import net.xasquatch.myblog.model.Member;
import net.xasquatch.myblog.repository.MemberDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.File;
import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;


@Slf4j
@Service
public class MemberService {

    @Autowired
    private MemberDao memberDao;

    @Autowired
    private FileService fileService;

    @Autowired
    private MailService mailService;

    @Resource(name = "sessionMember")
    private Member sessionMember;

    public Map<String, Long> getAuthorization(){
        return memberDao.selectAuthorization();
    }

    public boolean updateRank(String email){
        return memberDao.updateRank(sessionMember.getNo(), email);
    }

    public boolean isExistedEmail(String email) {
        String memberEmail = memberDao.selectOneEmail(email);

        return memberEmail != null;

    }

    public boolean isExistedName(String name) {
        String memberName = memberDao.selectOneName(name);

        return memberName != null;

    }

    public String login(Member member) {

        Map<String, Object> resultMap = memberDao.selectOneMbr(member);

        try {
            long sessionMemberNo = ((BigInteger) resultMap.get("no")).longValue();
            sessionMember.setNo(sessionMemberNo);

        } catch (Exception e) {
            log.warn("CLASS CAST EXCEPTION: member no->{}", "null");
            return "false";
        }
        sessionMember.setRank((String) resultMap.get("rank"));
        sessionMember.setEmail((String) resultMap.get("email"));
        sessionMember.setPwd((String) resultMap.get("pwd"));
        sessionMember.setName((String) resultMap.get("name"));
        sessionMember.setImg((String) resultMap.get("img"));

        return String.valueOf(sessionMember.getNo());
    }

    public String loginForToken(Member member) {

        Map<String, Object> resultMap = memberDao.selectOneMbr(member);

        try {
            long sessionMemberNo = ((BigInteger) resultMap.get("no")).longValue();
            sessionMember.setNo(sessionMemberNo);

        } catch (Exception e) {
            log.warn("CLASS CAST EXCEPTION: member no->{}", "null");
            return "false";
        }
        sessionMember.setRank((String) resultMap.get("rank"));
        sessionMember.setEmail((String) resultMap.get("email"));
        sessionMember.setToken((String) resultMap.get("token"));
        sessionMember.setName((String) resultMap.get("name"));
        sessionMember.setImg((String) resultMap.get("img"));

        return String.valueOf(sessionMember.getNo());
    }

    public void reset(Member sessionMember) {
        sessionMember.setNo(null);
        sessionMember.setEmail(null);
        sessionMember.setRank(null);
        sessionMember.setPwd(null);
        sessionMember.setName(null);
        sessionMember.setImg(null);
        sessionMember.setCheckSession(false);
    }

    public boolean saveForToken(Member member){
        boolean result = false;
        result = memberDao.insertMbrForToken(member);

        return result;
    }

    //TODO:img파일 저장 및 경로 설정 + result false시 해당 폴더 제거 구현 필요
    public boolean save(Member member) {
        boolean result = false;

        ImgParser imgParser = ImgParser.getImgParser(member.getImgFile());

        while (imgParser.isCuttableImgSrc()) {
            imgParser.addImgList();

        }
        result = memberDao.insertMbrExceptionImg(member);


        List<String> imgSrcList = imgParser.getImgSrcList();
        String path = File.separator + member.getNo();
        for (int i = 0; i < imgSrcList.size(); i++) {
            byte[] decodedImgSrc = fileService.decodeBase64(imgSrcList.get(i));
            String src = fileService.writeFile(decodedImgSrc, path, new SimpleDateFormat("yyyyMMddhhmmss").format(new Date()) + ".png");
            member.setImg(src);

        }

        if (!memberDao.updateMbrImg(member)) {
            fileService.removeFiles(path);
            delete(member);
            result = false;
        }

        return result;
    }

    public String updateMember(Member member) {
        boolean result = false;

        ImgParser imgParser = ImgParser.getImgParser(member.getImgFile());

        while (imgParser.isCuttableImgSrc()) {
            imgParser.addImgList();

        }
        result = memberDao.updateMbrDefault(member);


        List<String> imgSrcList = imgParser.getImgSrcList();
        String path = File.separator + member.getNo();
        for (int i = 0; i < imgSrcList.size(); i++) {
            byte[] decodedImgSrc = fileService.decodeBase64(imgSrcList.get(i));
            String src = fileService.writeFile(decodedImgSrc, path, new SimpleDateFormat("yyyyMMddhhmmss").format(new Date()) + ".png");
            member.setImg(src);

        }

        if (!memberDao.updateMbrImg(member)) {
            fileService.removeFiles(path);
            delete(member);
        }

        return String.valueOf(result);
    }

    public boolean checkMember(String pwdKey) {
        boolean result = false;
        int i = memberDao.selectMbr(sessionMember.getNo(), pwdKey);
        if (i > 0) result = true;

        return result;
    }

    public boolean delete(Member member) {
        boolean result = false;
        result = memberDao.deleteOneMbr(member);

        return result;
    }

    public String searchEmail(String name){
        return memberDao.selectEmail(name);
    }

    public boolean searchPwd(Member member){
        boolean result = false;

        String memberNo = memberDao.selectNo(member.getEmail(),member.getName());
        if (memberNo != null){
            String pwdToken = mailService.createToken(8);
            mailService.createMainContents(member.getName() + "님<BR>My Blog By Xasquatch에<BR>요청한 임시비밀번호입니다.",
                    "            password: " + pwdToken,
                    "<a href=\"https://myblog.xasquatch.net\" style=\"text-decoration: none; color: darkred; font-weight: bold;\">로그인 하러가기</a>");
            mailService.sendAuthMail(member.getEmail(),member.getName() + "님 My Blog By Xasquatch에 요청한 임시비밀번호입니다");
            member.setNo(Long.valueOf(memberNo));
            member.setPwd(pwdToken);
            result = memberDao.updateMbrDefault(member);
        }

        return result;
    }
}
