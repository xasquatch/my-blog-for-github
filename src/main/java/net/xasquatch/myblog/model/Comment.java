package net.xasquatch.myblog.model;

import lombok.*;

import javax.validation.constraints.Size;

@Builder
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Comment {

    private Long no;
    private Long board_no;
    private Long mbr_no;

    private String mbr_nickname;

    @Size(min = 3, max = 255)
    private String contents;
    private String created_date;
    private String created_ip;
    private String pwd;

}
