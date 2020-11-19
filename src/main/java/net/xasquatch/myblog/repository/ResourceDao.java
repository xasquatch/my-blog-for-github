package net.xasquatch.myblog.repository;

import net.xasquatch.myblog.mapper.ResourceMapper;
import net.xasquatch.myblog.model.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ResourceDao {

    @Autowired
    private ResourceMapper resourceMapper;

    public int insertOne(Resource resource){
        return resourceMapper.insertOne(resource);
    }
}
