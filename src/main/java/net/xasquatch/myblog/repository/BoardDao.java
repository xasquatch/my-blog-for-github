package net.xasquatch.myblog.repository;

import lombok.extern.slf4j.Slf4j;
import net.xasquatch.myblog.mapper.BoardMapper;
import net.xasquatch.myblog.model.Board;
import net.xasquatch.myblog.model.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

    public List<Map<String, Object>> selectNoticeList(Object rank, Object currentPage, Object pageLimit,
                                                      Object searchTarget, Object searchValue) {

        return boardMapper.selectNoticeList(rank, currentPage, pageLimit, searchTarget, searchValue);
    }

    public int selectNoticeCount(Object rank, String searchTarget, String searchValue) {
        return boardMapper.selectNoticeCount(rank, searchTarget, searchValue);

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

    public int deleteOneBoard(Object boardKey) {
        return boardMapper.deleteOneBoard(boardKey);

    }

    public Map<String, Object> selectOneBoard(Object boardNo) {
        return boardMapper.selectOneBoard(boardNo);
    }

    public boolean selectOneBoardColumnPwd(Object boardno, String pwd) {
        boolean result = false;
        if (boardMapper.selectOneBoardColumnPwd(boardno, pwd) == 1) result = true;

        return result;
    }

    public List<String> selectAllKeywordList() {
        return boardMapper.selectAllKeywordList();

    }
}