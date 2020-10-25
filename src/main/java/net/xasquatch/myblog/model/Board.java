package net.xasquatch.myblog.model;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;

@Builder
@ToString
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Board {

    private String keyword;
    private String title;
    private String contents;
    private String thumbnailSrcDir;
//    private MultipartFile thumbnailFile;
    private String[] imgSrcDir;
//    private MultipartFile[] imgFiles;


}
