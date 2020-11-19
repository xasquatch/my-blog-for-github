package net.xasquatch.myblog.mapper;

import net.xasquatch.myblog.model.Resource;
import org.apache.ibatis.annotations.Insert;

public interface ResourceMapper {

    @Insert("INSERT INTO resource(mbr_no, title, contents) VALUES(#{mbr_no}, #{title}, #{contents})")
    int insertOne(Resource resource);
}
