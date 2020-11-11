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

    @Resource(name = "sessionMember")
    private Member sessionMember;

    public boolean isExistedEmail(String email) {
        String memberEmail = memberDao.selectOneEmail(email);

        return memberEmail != null;

    }

    public String login(Member member) {

        Map<String, Object> resultMap = memberDao.selectOnMbr(member);

        try {
            long sessionMemberNo = ((BigInteger) resultMap.get("no")).longValue();
            sessionMember.setNo(sessionMemberNo);
        } catch (Exception e) {
            log.warn("CLASS CAST EXCEPTION: member no->{}", "null");
            return "false";
        }
        sessionMember.setEmail((String) resultMap.get("email"));
        sessionMember.setPwd((String) resultMap.get("pwd"));
        sessionMember.setName((String) resultMap.get("name"));
        sessionMember.setImg((String) resultMap.get("img"));


        return String.valueOf(sessionMember.getNo());
    }

    public void reset(Member sessionMember) {
        sessionMember.setNo(null);
        sessionMember.setEmail(null);
        sessionMember.setPwd(null);
        sessionMember.setName(null);
        sessionMember.setImg(null);
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


    public boolean update(Member member) {
        boolean result = false;


        return result;
    }


    public boolean delete(Member member) {
        boolean result = false;
        result = memberDao.deleteOneMbr(member);

        return result;
    }


    public boolean view(Member member) {
        boolean result = false;
        log.debug("view: {}", member.toString());
        return result;
    }
}
