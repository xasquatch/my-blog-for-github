package net.xasquatch.myblog.model;

import lombok.*;

import javax.validation.constraints.Size;

@Builder
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Board {

    private Long no;
    private Long mbr_no;
    private String mbr_nickname;

    @Size(max = 255)
    private String keyword;

    @Size(min = 2, max = 255)
    private String title;

    @Size(min = 20, max = 10000)
    private String contents;
    private String thumbnail;
    private String created_date;
    private String created_ip;
    private String pwd;
}
