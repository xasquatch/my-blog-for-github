package net.xasquatch.myblog.service;

import lombok.*;
import org.springframework.stereotype.Component;

@Builder
@ToString
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Component
public class Pagination {

    private int currentPageBlock;
    private int PageLimit;

    public Object lastPageBlock(){

        return null;
    }


}
