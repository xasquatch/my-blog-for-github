package net.xasquatch.myblog.model;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.Size;
import java.util.List;

@Builder
@ToString
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Board {

    private Long no;
    private Long mbr_no;

    @Size(max = 25)
    private String keyword;

    @Size(max = 50)
    private String title;
    private String contents;
    private String thumbnailSrcDir;

    private String created_ip;

}
