package net.xasquatch.myblog.repository;

import net.xasquatch.myblog.mapper.ApiMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ApiDao {

    @Autowired
    private ApiMapper apiMapper;
}
