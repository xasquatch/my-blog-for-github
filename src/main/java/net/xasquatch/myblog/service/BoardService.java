package net.xasquatch.myblog.service;

import net.xasquatch.myblog.model.Board;
import net.xasquatch.myblog.model.ImgRepository;
import net.xasquatch.myblog.model.Member;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Service
public interface BoardService {

    public HashMap<String, Object> viewDetail(Object boardKey);

    public boolean update(Object boardKey);

    public boolean delete(Object boardKey);

    public boolean create(Board board, Member member);

    public List<HashMap<String, Object>> getBoardList(Member member);
}
