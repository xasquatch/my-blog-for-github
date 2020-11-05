package net.xasquatch.myblog.repository;

import net.xasquatch.myblog.mapper.BoardMapper;
import net.xasquatch.myblog.model.Board;
import net.xasquatch.myblog.model.ImgRepository;
import net.xasquatch.myblog.model.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDao {

    @Autowired
    BoardMapper boardMapper;

    public boolean InsertOneBoard(Board board, Member member){

        boardMapper.insertOneBoard(board);
//        boardMapper.insertOneBoard(board, member.getNo().toString());


        return board.getNo() != null;
    }

    public boolean insertMbrExceptionImg(Board board, Member member, ImgRepository imgRepository) {

        //TODO: DB저장 후 board.setNo 호출하여 PK 저장
        boardMapper.insertMbrExceptionImg(board);

        return member.getNo() != null;

    }

    public boolean updateMbrImg(Board board, Member member, ImgRepository imgRepository) {
        boolean result = false;

        //TODO: DB저장 후 board.setNo 호출하여 PK 저장
        if (boardMapper.updateMbrImg(board) == 1) result = true;

        return result;
    }

    public boolean deleteOneMbr(Board board, Member member){
        boolean result = false;

        if (boardMapper.deleteOneMbr(board) == 1) result = true;

        return result;
    }



}
