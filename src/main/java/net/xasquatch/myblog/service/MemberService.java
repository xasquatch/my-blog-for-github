package net.xasquatch.myblog.service;

import net.xasquatch.myblog.model.Member;
import org.springframework.stereotype.Service;

@Service
public interface MemberService {

    public boolean save(Member member);
    public boolean view(Member member);


}
