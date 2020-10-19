package net.xasquatch.myblog.model;

import lombok.*;
import org.springframework.stereotype.Component;

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

}
