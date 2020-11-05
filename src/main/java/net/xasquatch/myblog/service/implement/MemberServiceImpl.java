package net.xasquatch.myblog.service.implement;

import lombok.extern.slf4j.Slf4j;
import net.xasquatch.myblog.model.Member;
import net.xasquatch.myblog.repository.UserDao;
import net.xasquatch.myblog.service.FileService;
import net.xasquatch.myblog.service.ImgParser;
import net.xasquatch.myblog.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


@Slf4j
@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private FileService fileService;

    @Override
    public boolean isExistedEmail(String email) {
        String userEmail = userDao.selectOneEmail(email);

        return userEmail != null;

    }

    @Override
    public boolean login(Member member) {
        boolean result = false;
        log.debug("login: {}", member.toString());
        return result;
    }

    //TODO:img파일 저장 및 경로 설정 + result false시 해당 폴더 제거 구현 필요
    @Override
    public boolean save(Member member) {
        boolean result = false;

        ImgParser imgParser = ImgParser.getImgParser(member.getImgFile());

        while (imgParser.isCuttableImgSrc()) {
            imgParser.addImgList();

        }

        List<String> imgSrcList = imgParser.getImgSrcList();
        List<String> imgExtensionList = imgParser.getImgExtensionList();
        for (int i = 0; i < imgSrcList.size(); i++) {
            byte[] decodedImgSrc = fileService.decodeBase64(imgSrcList.get(i));
            String src = fileService.writeImgFile(decodedImgSrc,
                    new SimpleDateFormat("yyyyMMddhhmmss").format(new Date()),
                    imgExtensionList.get(i));
            member.setImg(src);
        }


        result = userDao.insertOneMbr(member);

        return result;
    }


    @Override
    public boolean update(Member member) {
        boolean result = false;


        return result;
    }


    @Override
    public boolean delete(Member member) {
        boolean result = false;
        log.debug("delete: {}", member.toString());
        return result;
    }

    @Override
    public boolean view(Member member) {
        boolean result = false;
        log.debug("view: {}", member.toString());
        return result;
    }
}
