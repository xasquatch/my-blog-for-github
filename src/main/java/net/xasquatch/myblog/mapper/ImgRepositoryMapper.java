package net.xasquatch.myblog.mapper;

import net.xasquatch.myblog.model.Board;
import net.xasquatch.myblog.model.ImgRepository;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.HashMap;
import java.util.List;

public interface ImgRepositoryMapper {

    @Insert("INSERT INTO img_repository(board_no, name, directory) VALUES(#{board_no}, #{name}, #{directory})")
    int insertImgRepository(ImgRepository imgRepository);

    @Delete("DELETE FROM img_repository WHERE board_no = #{no}")
    int deleteImgRepository(Board board);

    @Select("SELECT name, directory FROM img_repository WHERE board_no = #{arg0}")
    List<HashMap<String, Object>> selectImgSrc(Object boardKey);

}
