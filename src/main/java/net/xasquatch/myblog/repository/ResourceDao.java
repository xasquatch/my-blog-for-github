package net.xasquatch.myblog.repository;

import net.xasquatch.myblog.mapper.ResourceMapper;
import net.xasquatch.myblog.model.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ResourceDao {

    @Autowired
    private ResourceMapper resourceMapper;

    public int insertOne(Resource resource) {
        return resourceMapper.insertOne(resource);
    }

    public int updateOne(Resource resource){
        return resourceMapper.updateOne(resource);
    }

    public int deleteOne(Resource resource){
        return resourceMapper.deleteOne(resource);
    }

    public List<Resource> selectAll(Object mbr_no, Object startLimit, Object endLimit) {
        return resourceMapper.selectAll(mbr_no, startLimit, endLimit);
    }

    public List<Resource> selectAddAll(Object mbr_no, Object lastNumber) {
        return resourceMapper.selectAddAll(mbr_no, lastNumber);
    }

    public List<Resource> selectAllNoWhere(Object startLimit, Object endLimit) {
        return resourceMapper.selectAllNoWhere(startLimit, endLimit);
    }

    public List<Resource> selectAddAllNoWhere(Object lastNumber) {
        return resourceMapper.selectAddAllNoWhere(lastNumber);
    }

}
