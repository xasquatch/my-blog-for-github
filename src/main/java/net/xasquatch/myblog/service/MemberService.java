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
import java.util.*;


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

    public Map<String, Long> getAuthorization() {
        return memberDao.selectAuthorization();
    }

    public boolean updateRank(long number, String email) {
        return memberDao.updateRank(number, email);
    }

    public long findNumberForEmail(String email) {

        return memberDao.selectOneNo(email);
    }

    public boolean isExistedEmail(String email) {
        String memberEmail = memberDao.selectOneEmail(email);

        return memberEmail != null;

    }

    public boolean isExistedName(String name) {
        String memberName = memberDao.selectOneName(name);

        return memberName != null;

    }

    public String[] parsingSearchValue(String memberNo, String memberEmail, String memberName) {
        Map<String, String> map = new HashMap<String, String>();
        String[] searchValue = new String[2];

        map.put("member-number", memberNo);
        map.put("member-email", memberEmail);
        map.put("member-name", memberName);

        map.forEach((key, value) -> {
            if (!key.equals("") && !key.equals("undefined")
                    && (!value.equals("") && !value.equals("undefined"))) {
                searchValue[0] = key;
                searchValue[1] = value;
            }
        });

        return searchValue;
    }

    public Map<String, Object> getMember(String memberEmail) {

        return memberDao.selectOneMbrForManagement(memberEmail);
    }

    public Map<String, Object> manageAllMember(String typeAuthReference, int pageLimit, int currentPageBlock, String[] searchValue) {
        if (!typeAuthReference.equals("manager")) return null;

        int currentPage = 0;
        try {
            currentPage = (currentPageBlock - 1) * pageLimit;

        } catch (ArithmeticException e) {
            log.warn("[ArithmeticException]pageLimit: {}", pageLimit);
        }

        List<Map<String, Object>> memberList
                = memberDao.selectAllMember(currentPage, pageLimit, searchValue[0], searchValue[1]);
        int totalCount = memberDao.selectAllMemberCount(searchValue[0], searchValue[1]);

        List<String> memberPageBlockList = new Pagination().getMemberBlockList(pageLimit, currentPageBlock, totalCount, searchValue[0], searchValue[1]);

        Map<String, Object> memberListUnit = new HashMap<String, Object>();
        memberListUnit.put("memberList", memberList);
        memberListUnit.put("memberPageBlockList", memberPageBlockList);

        return memberListUnit;

    }

    public String login(Member member) {

        Map<String, Object> resultMap = memberDao.selectOneMbr(member);

        return setSessionMember(resultMap);
    }

    public String loginForToken(Member member) {

        Map<String, Object> resultMap = memberDao.selectOneMbrForToken(member);

        return setSessionMember(resultMap);
    }

    public String setSessionMember(Map<String, Object> resultMap) {
        try {
            long sessionMemberNo = ((BigInteger) resultMap.get("no")).longValue();
            sessionMember.setNo(sessionMemberNo);

        } catch (Exception e) {
            log.warn("CLASS CAST EXCEPTION: member no->{}", "null");
            return "false";
        }
        sessionMember.setRank((String) resultMap.get("rank"));
        sessionMember.setEmail((String) resultMap.get("email"));
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
        sessionMember.setLoginOAuth(false);
    }

    public void saveForToken(Member member) {
        memberDao.insertMbrForToken(member);
    }

    public String updateMember(Member member) {
        String imgFile = member.getImgFile();
        String imgPath = null;

        // 이미지 소스값이 비어있지않으면
        if (imgFile.contains("<img src=\"data:image/png")) {
            ImgParser imgParser = ImgParser.getImgParser(imgFile);
            while (imgParser.isCuttableImgSrc()) imgParser.addImgList();
            List<String> imgSrcList = imgParser.getImgSrcList();
            imgPath = File.separator + member.getNo();
            for (String imgSrc : imgSrcList) {
                byte[] decodedImgSrc = fileService.decodeBase64(imgSrc);
                String src = fileService.writeFile(decodedImgSrc, imgPath, new SimpleDateFormat("yyyyMMddhhmmss").format(new Date()) + ".png");
                member.setImg(src);

            }
            imgParser.resetImgParser();

            //img파일 저장 및 경로 설정 + result false시 해당 폴더 제거
            if (!memberDao.updateMbrImg(member)) fileService.removeFiles(imgPath);

        }

        return String.valueOf(memberDao.updateMbrDefault(member));
    }

    public boolean checkMember(String pwdKey) {
        boolean result = false;
        int i = memberDao.selectMbr(sessionMember.getNo(), pwdKey);
        if (i > 0) result = true;

        return result;
    }

    public String delete(Member member) {
        return String.valueOf(memberDao.deleteOneMbr(member));
    }

    public String searchEmail(String name) {
        return memberDao.selectEmail(name);
    }

    public boolean searchPwd(Member member) {
        boolean result = false;

        String memberNo = memberDao.selectNo(member.getEmail(), member.getName());
        if (memberNo != null) {
            String pwdToken = mailService.createToken(8);
            mailService.createMainContents(member.getName() + "님<BR>My Blog By Xasquatch에<BR>요청한 임시비밀번호입니다.",
                    "            password: " + pwdToken,
                    "<a href=\"https://myblog.xasquatch.net\" style=\"text-decoration: none; color: darkred; font-weight: bold;\">로그인 하러가기</a>");
            mailService.sendAuthMail(member.getEmail(), member.getName() + "님 My Blog By Xasquatch에 요청한 임시비밀번호입니다");
            member.setNo(Long.valueOf(memberNo));
            member.setPwd(pwdToken);
            result = memberDao.updateMbrDefault(member);
        }

        return result;
    }
}
