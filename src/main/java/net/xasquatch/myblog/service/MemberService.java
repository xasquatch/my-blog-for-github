package net.xasquatch.myblog.service;

import lombok.extern.slf4j.Slf4j;
import net.xasquatch.myblog.model.Member;
import net.xasquatch.myblog.repository.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


@Slf4j
@Service
public class MemberService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private FileService fileService;

    
    public boolean isExistedEmail(String email) {
        String userEmail = userDao.selectOneEmail(email);

        return userEmail != null;

    }

    
    public boolean login(Member member) {
        boolean result = false;
        log.debug("login: {}", member.toString());
        return result;
    }

    //TODO:img파일 저장 및 경로 설정 + result false시 해당 폴더 제거 구현 필요
    
    public boolean save(Member member) {
        boolean result = false;

        ImgParser imgParser = ImgParser.getImgParser(member.getImgFile());

        while (imgParser.isCuttableImgSrc()) {
            imgParser.addImgList();

        }
        result = userDao.insertMbrExceptionImg(member);


        List<String> imgSrcList = imgParser.getImgSrcList();
        String path = File.separator + member.getNo();
        for (int i = 0; i < imgSrcList.size(); i++) {
            byte[] decodedImgSrc = fileService.decodeBase64(imgSrcList.get(i));
            String src = fileService.writeFile(decodedImgSrc, path , new SimpleDateFormat("yyyyMMddhhmmss").format(new Date()) + ".png");
            member.setImg(src);

        }

        if (!userDao.updateMbrImg(member)){
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
        result = userDao.deleteOneMbr(member);

        return result;
    }

    
    public boolean view(Member member) {
        boolean result = false;
        log.debug("view: {}", member.toString());
        return result;
    }
}
