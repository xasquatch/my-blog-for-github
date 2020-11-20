package net.xasquatch.myblog.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import lombok.extern.slf4j.Slf4j;
import net.xasquatch.myblog.model.Member;
import net.xasquatch.myblog.repository.ResourceDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Slf4j
@Service
public class ResourceService {

    @Autowired
    private ResourceDao resourceDao;

    @Resource(name = "sessionMember")
    private Member sessionMember;

    public boolean upload(net.xasquatch.myblog.model.Resource resource) {
        boolean result = false;
        resource.setMbr_no(sessionMember.getNo());
        if (resourceDao.insertOne(resource) == 1) result = true;

        return result;
    }

    //리스트 전체를 web api로 세션없이 보여줄 생각은 없음
    public List<net.xasquatch.myblog.model.Resource> viewList(int index) {

        return resourceDao.selectAll(sessionMember.getNo(), index, index + 10);
    }

    public String AdditionalViewList(String lastNumber) {
        String result = "";
        ObjectWriter objectWriter = new ObjectMapper().writerWithDefaultPrettyPrinter();

        try {
            result = objectWriter.writeValueAsString(resourceDao.selectAddAll(sessionMember.getNo(), lastNumber));
        } catch (JsonProcessingException e) {
            log.warn("JsonProcessingException: lastNumber={}",lastNumber);
        }

        return result;
    }
    /*TODO:세션정보 없이 전체 공개*/
    public List<net.xasquatch.myblog.model.Resource> viewAllList(int index) {

        return resourceDao.selectAllNoWhere(index, index + 10);
    }

    public String AdditionalViewAllList(String lastNumber) {
        String result = "";
        ObjectWriter objectWriter = new ObjectMapper().writerWithDefaultPrettyPrinter();

        try {
            result = objectWriter.writeValueAsString(resourceDao.selectAddAllNoWhere(lastNumber));
        } catch (JsonProcessingException e) {
            log.warn("JsonProcessingException: lastNumber={}",lastNumber);
        }

        return result;
    }

    public boolean modify(net.xasquatch.myblog.model.Resource resource){
        boolean result = false;
        resource.setMbr_no(sessionMember.getNo());
        if (resourceDao.updateOne(resource) == 1) result = true;

        return result;
    }

    public boolean delete(net.xasquatch.myblog.model.Resource resource){
        boolean result = false;
        resource.setMbr_no(sessionMember.getNo());
        if (resourceDao.deleteOne(resource) == 1) result = true;

        return result;
    }


}
