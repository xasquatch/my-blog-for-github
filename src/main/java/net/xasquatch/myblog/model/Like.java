package net.xasquatch.myblog.model;

import lombok.*;

@Builder
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Like {
/**
 * database name: lke
 */

    private long no;
    private long mbr_no;
    private long board_no;
    private long comment_no;
    private boolean good;


}
