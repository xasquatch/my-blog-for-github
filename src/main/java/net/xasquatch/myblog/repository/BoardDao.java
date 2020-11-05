package net.xasquatch.myblog.repository;

import net.xasquatch.myblog.mapper.BoardMapper;
import net.xasquatch.myblog.model.Board;
import net.xasquatch.myblog.model.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDao {

    @Autowired
    BoardMapper boardMapper;

    public boolean InsertOneBoard(Board board, Member member){
        boolean result = false;

//TODO:임시
        member.setNo(1L);

//        boardMapper.insertOneBoard(board, member);



        return result;
    }

}
