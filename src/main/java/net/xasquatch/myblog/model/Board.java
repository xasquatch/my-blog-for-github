package net.xasquatch.myblog.model;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.Size;
import java.util.List;

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

    @Size(max = 255)
    private String title;
    private String contents;
    private String thumbnail;
    private String created_date;
    private String created_ip;

}
