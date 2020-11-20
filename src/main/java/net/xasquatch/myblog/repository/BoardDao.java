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

    public List<HashMap<String, Object>> SelectBoardList(String memberKey, int pageLimit, int currentPageBlock, String searchRange, String searchValue) {
        Long memberNo = Long.parseLong(memberKey);
        int block = 0;
        try {
            block = (currentPageBlock - 1) * pageLimit;

        } catch (ArithmeticException e) {
            log.warn("[ArithmeticException]pageLimit: {}", pageLimit);
        }

        List<HashMap<String, Object>> resultListMap;
        try{


        switch (searchRange) {
            case "keyword":
                resultListMap = boardMapper.selectBoardListWhereLikeKeyword(memberNo, block, pageLimit, searchValue);

                break;
            case "title":
                resultListMap = boardMapper.selectBoardListWhereLikeTitle(memberNo, block, pageLimit, searchValue);

                break;
            case "contents":
                resultListMap = boardMapper.selectBoardListWhereLikeContents(memberNo, block, pageLimit, searchValue);

                break;
            case "titleAndContents":
                resultListMap = boardMapper.selectBoardListWhereLikeTitleAndContents(memberNo, block, pageLimit, searchValue);

                break;
            default:
                resultListMap = boardMapper.selectBoardList(memberNo, block, pageLimit);
                break;
        }
        }catch (NullPointerException e){
            log.debug("selectBoardList: {}","selectBoardList");
            resultListMap = boardMapper.selectBoardList(memberNo, block, pageLimit);
        }

        return resultListMap;
    }

    public int selectBoardListCount(Object memberKey) {
        return boardMapper.selectBoardListCount(memberKey);
    }
    public List<HashMap<String, Object>> SelectAllBoardList(int pageLimit, int currentPageBlock, String searchRange, String searchValue) {
        int block = 0;
        try {
            block = (currentPageBlock - 1) * pageLimit;

        } catch (ArithmeticException e) {
            log.warn("[ArithmeticException]pageLimit: {}", pageLimit);
        }

        List<HashMap<String, Object>> resultListMap;
        try{


        switch (searchRange) {
            case "keyword":
                resultListMap = boardMapper.selectAllBoardListWhereLikeKeyword(block, pageLimit, searchValue);

                break;
            case "title":
                resultListMap = boardMapper.selectAllBoardListWhereLikeTitle(block, pageLimit, searchValue);

                break;
            case "contents":
                resultListMap = boardMapper.selectAllBoardListWhereLikeContents(block, pageLimit, searchValue);

                break;
            case "titleAndContents":
                resultListMap = boardMapper.selectAllBoardListWhereLikeTitleAndContents(block, pageLimit, searchValue);

                break;
            default:
                resultListMap = boardMapper.selectAllBoardList(block, pageLimit);
                break;
        }
        }catch (NullPointerException e){
            log.debug("selectBoardList: {}","selectBoardList");
            resultListMap = boardMapper.selectAllBoardList(block, pageLimit);
        }

        return resultListMap;
    }

    public int selectAllBoardListCount() {
        return boardMapper.selectAllBoardListCount();
    }

    public HashMap<String, Object> selectOneBoard(Object boardKey) {

        return boardMapper.selectOneBoard(boardKey);
    }

}