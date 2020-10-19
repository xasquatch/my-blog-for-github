package net.xasquatch.myblog.service.implement;

import lombok.extern.slf4j.Slf4j;
import net.xasquatch.myblog.model.Member;
import net.xasquatch.myblog.service.MemberService;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class MemberServiceImpl implements MemberService {

    @Override
    public boolean save(Member member) {
        log.info("save: {}","save");
        return false;
    }

    @Override
    public boolean view(Member member) {
        log.info("view: {}","view");
        return false;
    }
}
