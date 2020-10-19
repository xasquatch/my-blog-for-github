package net.xasquatch.myblog.service.implement;

import lombok.extern.slf4j.Slf4j;
import net.xasquatch.myblog.model.Member;
import net.xasquatch.myblog.service.MemberService;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

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
    public boolean update(Member member, MultipartFile file){
        boolean result = false;
        log.info("update: {}", member.toString());

        try (InputStream fin = file.getInputStream();
             OutputStream fos = new FileOutputStream("copy.jpg")) {
            // 복사 파일명

            while (true) {
                int data = fin.read();      //  한 바이트씩 읽는다.
                if (data == -1) {
                    System.out.println("파일 끝");
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
