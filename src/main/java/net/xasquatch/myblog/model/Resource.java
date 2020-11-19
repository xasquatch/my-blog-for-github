package net.xasquatch.myblog.model;

import lombok.*;

import javax.validation.constraints.Size;

@Builder
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class Resource {

    private long no;
    private long mbr_no;

    @Size(max = 255)
    private String title;

    @Size(max = 255)
    private String contents;

}
