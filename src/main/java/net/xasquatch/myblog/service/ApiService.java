package net.xasquatch.myblog.service;

import net.xasquatch.myblog.repository.ApiDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ApiService {

    @Autowired
    private ApiDao apiDao;



}
