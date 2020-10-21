package net.xasquatch.myblog.service.implement;

import lombok.extern.slf4j.Slf4j;
import net.xasquatch.myblog.model.Member;
import net.xasquatch.myblog.service.MemberService;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;


@Slf4j
@Service
public class MemberServiceImpl implements MemberService {

    @Override
    public boolean login(Member member) {
        boolean result = false;
        log.info("login: {}", member.toString());
        return result;
    }

    @Override
    public boolean save(Member member) {
        boolean result = false;
        log.info("save: {}", member.toString());
        return result;
    }

    @Override
    public boolean update(Member member){
        boolean result = false;
        MultipartFile file = member.getImgFile();

        log.info("update: {}", member.toString());
        log.info("{}",System.getProperty("user.dir"));
        try {
            InputStream fin = file.getInputStream();
             OutputStream fos = new FileOutputStream(System.getProperty("user.dir")+"/"+member.getName()+new SimpleDateFormat("yyyyMMdd").format(new Date())+".jpg");
            // 복사 파일명

            while (true) {
                int data = fin.read();      //  한 바이트씩 읽는다.
                if (data == -1) {
                    log.info("YES");
                    break;
                }
                fos.write(data);            // 한 바이트씩 쓴다.

            }
        } catch (Exception e) {
            e.printStackTrace();
        }


        return result;
    }


    @Override
    public boolean delete(Member member) {
        boolean result = false;
        log.info("delete: {}", member.toString());
        return result;
    }

    @Override
    public boolean view(Member member) {
        boolean result = false;
        log.info("view: {}", member.toString());
        return result;
    }
}
