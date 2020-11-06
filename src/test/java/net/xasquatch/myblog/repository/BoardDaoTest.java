package net.xasquatch.myblog.repository;

import net.xasquatch.myblog.model.Board;
import net.xasquatch.myblog.model.Member;
import org.junit.Assert;
import org.junit.Test;

public class BoardDaoTest {

    private BoardDao boardDao = new BoardDao();

    @Test
    public void test1(){

        Board board = Board.builder()
                .keyword("키워드")
                .title("타이틀")
                .contents("컨텐츠")
                .created_ip("아이피")
                .thumbnailSrcDir("썸네일")
                .mbr_no(2L)
                .build();


        Assert.assertTrue(boardDao.insertOneBoard(board));
    }


}