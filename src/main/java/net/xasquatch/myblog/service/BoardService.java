package net.xasquatch.myblog.service;

import net.xasquatch.myblog.model.Board;
import net.xasquatch.myblog.model.Member;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.util.HashMap;
import java.util.List;

@Service
public interface BoardService {

    public HashMap<String, Object> viewDetail(Object boardKey);

    public Object createDefaultBoard(String memberNo);

    public boolean createFinish(Board board);

    public boolean uploadImage(MultipartHttpServletRequest request, String memberNo, String boardNo);

    public boolean modify(Board board);

    public boolean delete(Object boardKey);

    public List<HashMap<String, Object>> getBoardList(Member member);
}
