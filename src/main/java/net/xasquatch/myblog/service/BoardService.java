package net.xasquatch.myblog.service;

import net.xasquatch.myblog.model.Board;
import net.xasquatch.myblog.model.ImgRepository;
import net.xasquatch.myblog.model.Member;
import org.springframework.stereotype.Service;

@Service
public interface BoardService {

    public boolean viewDetail(Board board);

    public boolean update(Board board, Member member);

    public boolean delete(Board board, Member member);

    public boolean create(Board board, Member member);


}
