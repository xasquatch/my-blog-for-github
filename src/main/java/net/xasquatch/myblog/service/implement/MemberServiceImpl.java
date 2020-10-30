package net.xasquatch.myblog.service.implement;

import lombok.extern.slf4j.Slf4j;
import net.xasquatch.myblog.model.Member;
import net.xasquatch.myblog.repository.UserDao;
import net.xasquatch.myblog.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Slf4j
@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private UserDao userDao;

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
