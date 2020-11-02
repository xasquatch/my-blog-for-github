package net.xasquatch.myblog.service;

import net.xasquatch.myblog.model.Member;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Service
public interface MemberService {

    public boolean isExistedEmail(String email);

    public boolean save(Member member);

    public boolean view(Member member);

    public boolean update(Member member);

    public boolean delete(Member member);

    public boolean login(Member member);

}
