package net.xasquatch.myblog.mapper;

import net.xasquatch.myblog.model.Board;
import net.xasquatch.myblog.model.Member;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface BoardMapper {
/*
    @Insert("INSERT INTO board(member_no, keyword, title, contents, created_ip, thumbnail) VALUES(#{member.no}, #{board.keyword}, #{board.title}, #{board.contents}, #{board.created_ip}, #{board.thumbnail})")
    void insertOneBoard(Board board, Member member);

    @Select("SELECT no FROM board WHERE no = #{no}")
    String selectOneEmail(Long no);*/
}
