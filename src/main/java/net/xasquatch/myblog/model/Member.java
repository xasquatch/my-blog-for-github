package net.xasquatch.myblog.model;

import lombok.*;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Builder
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Component
public class Member {

    public String email;
    public String pwd;
    public String name;
    public String img;
    public MultipartFile imgFile;

}