package net.xasquatch.myblog.mapper;

import net.xasquatch.myblog.model.Resource;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ResourceMapper {

    @Insert("INSERT INTO resource(mbr_no, title, contents) VALUES(#{mbr_no}, #{title}, #{contents})")
    int insertOne(Resource resource);

    @Select("SELECT no, mbr_no, title, convert(contents USING UTF8) as contents FROM resource WHERE mbr_no = #{arg0} ORDER BY no DESC LIMIT #{arg1}, #{arg2}")
    List<Resource> selectAll(Object mbr_no, Object startLimit, Object endLimit);

    @Select("SELECT no, mbr_no, title, convert(contents USING UTF8) as contents FROM resource WHERE mbr_no = #{arg0} AND no < #{arg1} ORDER BY no DESC LIMIT 0, 10")
    List<Resource> selectAddAll(Object mbr_no, Object lastNumber);
}
