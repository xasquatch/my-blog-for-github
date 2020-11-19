package net.xasquatch.myblog.service;

import net.xasquatch.myblog.model.Member;
import net.xasquatch.myblog.repository.ResourceDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class ResourceService {

    @Autowired
    private ResourceDao resourceDao;

    @Resource(name = "sessionMember")
    private Member sessionMember;

    public boolean create(net.xasquatch.myblog.model.Resource resource){
        
        return false;
    }

}
