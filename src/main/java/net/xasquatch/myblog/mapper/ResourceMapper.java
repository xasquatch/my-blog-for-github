package net.xasquatch.myblog.mapper;

import net.xasquatch.myblog.model.Resource;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface ResourceMapper {

    @Insert("INSERT INTO resource(mbr_no, title, contents) VALUES(#{mbr_no}, #{title}, #{contents})")
    int insertOne(Resource resource);

    @Update("UPDATE resource SET title = #{title}, contents = #{contents} WHERE no = #{no} AND mbr_no = #{mbr_no}")
    int updateOne(Resource resource);

    @Delete("DELETE FROM resource WHERE no = #{no} AND mbr_no = #{mbr_no}")
    int deleteOne(Resource resource);

    @Select("SELECT no, mbr_no, title, convert(contents USING UTF8) as contents FROM resource WHERE mbr_no = #{arg0} ORDER BY no DESC LIMIT #{arg1}, #{arg2}")
    List<Resource> selectAll(Object mbr_no, Object startLimit, Object endLimit);

    @Select("SELECT no, mbr_no, title, convert(contents USING UTF8) as contents FROM resource WHERE mbr_no = #{arg0} AND no < #{arg1} ORDER BY no DESC LIMIT 0, 10")
    List<Resource> selectAddAll(Object mbr_no, Object lastNumber);

    /*------TODO:전체 조회----------*/
    @Select("SELECT no, mbr_no, title, convert(contents USING UTF8) as contents FROM resource ORDER BY no DESC LIMIT #{arg0}, #{arg1}")
    List<Resource> selectAllNoWhere(Object startLimit, Object endLimit);

    @Select("SELECT no, mbr_no, title, convert(contents USING UTF8) as contents FROM resource WHERE no < #{arg0} ORDER BY no DESC LIMIT 0, 10")
    List<Resource> selectAddAllNoWhere(Object lastNumber);
}
