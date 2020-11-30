package net.xasquatch.myblog.mapper;

import net.xasquatch.myblog.mapper.builder.ResourceBuilder;
import net.xasquatch.myblog.model.Resource;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface ResourceMapper {

    @Insert("INSERT INTO resource(mbr_no, title, contents) VALUES(#{mbr_no}, #{title}, #{contents})")
    int insertOne(Resource resource);

    @Update("UPDATE resource SET title = #{title}, contents = #{contents} WHERE no = #{no} AND mbr_no = #{mbr_no}")
    int updateOne(Resource resource);

    @Delete("DELETE FROM resource WHERE no = #{no} AND mbr_no = #{mbr_no}")
    int deleteOne(Resource resource);

    @SelectProvider(type = ResourceBuilder.class, method = "getResourceList")
    List<Resource> selectAll(Object memberNo, Object startLimit, Object endLimit, Object searchValue);

    @SelectProvider(type = ResourceBuilder.class, method = "getAddResourceList")
    List<Resource> selectAddAll(Object memberNo, Object lastNumber, Object searchValue);

}
