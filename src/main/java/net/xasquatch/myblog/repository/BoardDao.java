package net.xasquatch.myblog.repository;

import lombok.extern.slf4j.Slf4j;
import net.xasquatch.myblog.mapper.BoardMapper;
import net.xasquatch.myblog.model.Board;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Repository
public class BoardDao {

    @Autowired
    BoardMapper boardMapper;

    public List<Map<String, Object>> selectBoardList(Object memberNo, Object currentPage, Object pageLimit,
                                                     Object searchTarget, Object searchValue) {

        return boardMapper.selectBoardList(memberNo, currentPage, pageLimit, searchTarget, searchValue);
    }

    public int selectBoardCount(Object memberNo, String searchTarget, String searchValue) {
        return boardMapper.selectBoardCount(memberNo, searchTarget, searchValue);

    }

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

    public void deleteOneBoard(Object boardKey) {
        boardMapper.deleteOneBoard(boardKey);

    }

    public Map<String, Object> selectOneBoard(Object memberNo, Object boardNo) {
        return boardMapper.selectOneBoard(memberNo, boardNo);
    }

}