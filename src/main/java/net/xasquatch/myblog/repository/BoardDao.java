package net.xasquatch.myblog.repository;

import net.xasquatch.myblog.mapper.BoardMapper;
import net.xasquatch.myblog.mapper.ImgRepositoryMapper;
import net.xasquatch.myblog.model.Board;
import net.xasquatch.myblog.model.ImgRepository;
import net.xasquatch.myblog.model.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public class BoardDao {

    @Autowired
    BoardMapper boardMapper;

    @Autowired
    ImgRepositoryMapper imgRepositoryMapper;

    public boolean insertOneBoard(Board board) {
        boolean result = false;

        //TODO: DB저장 후 board.setNo 호출하여 PK 저장
        if (boardMapper.insertBoardExceptionImg(board) == 1) result = true;

        return result;

    }

    public boolean updateThumbnailImg(Board board) {
        boolean result = false;

        if (boardMapper.updateThumbnailImg(board) == 1) result = true;

        return result;

    }

    public boolean updateContents(Board board) {
        boolean result = false;

        if (boardMapper.updateContents(board) == 1) result = true;

        return result;

    }

    public boolean deleteOneBoard(Board board) {
        boolean result = false;

        if (boardMapper.deleteOneBoard(board) == 1) result = true;

        return result;

    }

    public boolean insertImgRepository(List<ImgRepository> imgRepositoryList) {
        boolean result = false;
        int count = 0;

        for (ImgRepository imgRepository : imgRepositoryList) {
            count += imgRepositoryMapper.insertImgRepository(imgRepository);
        }

        if (count != 0) result = true;

        return result;

    }


    public boolean deleteImgRepository(Board board) {
        boolean result = false;

        if (imgRepositoryMapper.deleteImgRepository(board) >= 1) result = true;

        return result;

    }

    public List<HashMap<String, Object>> SelectBoardList(Member member){

        return null;
    }

}
