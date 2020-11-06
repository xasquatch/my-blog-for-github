package net.xasquatch.myblog.model;

import lombok.*;

@Builder
@ToString
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class ImgRepository {

    private Long no;
    private Long board_no;
    private String name;
    private String directory;

}
