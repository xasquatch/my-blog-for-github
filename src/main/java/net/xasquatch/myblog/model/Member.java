package net.xasquatch.myblog.model;

import lombok.Builder;
import org.springframework.stereotype.Component;

@Builder
public class Member {

    public String email;
    public String pwd;
    public String name;
    public String img;

}
