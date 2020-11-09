package net.xasquatch.myblog.repository;

import net.xasquatch.myblog.mapper.BoardMapper;
import net.xasquatch.myblog.model.Board;
import net.xasquatch.myblog.model.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class BoardDao {

    @Autowired
    BoardMapper boardMapper;

    public void deleteUnfinishedBoard(Map<String, Object> memberMap) {
        boardMapper.deleteUnfinishedBoard(memberMap);

    }

    public boolean insertDefaultBoard(Map<String, Object> memberMap) {
        boolean result = false;

        //TODO: DB저장 후 board.setNo 호출하여 PK 저장
        if (boardMapper.insertDefaultBoard(memberMap) == 1) result = true;

        return result;

    }

    public boolean updateBoard(Board board) {
        boolean result = false;
        if (boardMapper.updateBoard(board) == 1) result = true;

        return result;

    }


    public boolean deleteOneBoard(Object boardKey) {
        boolean result = false;
        if (boardMapper.deleteOneBoard(boardKey) == 1){
            result = true;

        }

        return result;

    }

    public List<HashMap<String, Object>> SelectBoardList(Member member) {

        Long memberKey = member.getNo();

        return boardMapper.selectBoardList(memberKey);
    }

    public HashMap<String, Object> selectOneBoard(Object boardKey) {

        return boardMapper.selectOneBoard(boardKey);
    }

}