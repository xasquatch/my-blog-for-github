package net.xasquatch.myblog.service;

import lombok.*;

import java.util.List;

@Builder
@ToString
@Getter
public class Pagination {

    private int currentPageBlock;
    private int pageLimit;
    private int totalCount;
    private int totalPageBlock;
    private int startPageBlock = 1;
    private int endPageBlock = 5;
    private int prevPageBlock;
    private int nextPageBlock;

    public void setPageBlogList() {
        this.totalPageBlock = (this.totalCount / this.pageLimit);
        if (this.totalCount % this.pageLimit > 0)
            this.totalPageBlock++;

        if (this.currentPageBlock % 5 == 1) {
            this.startPageBlock = this.currentPageBlock;

        } else if (this.currentPageBlock % 5 == 0) {
            this.startPageBlock = this.currentPageBlock - 4;

        } else {
            this.startPageBlock = ((currentPageBlock / 5) * 5) + 1;

        }

        this.endPageBlock = this.startPageBlock + 4; // 4 = 5-1
        if (this.endPageBlock > this.totalPageBlock)
            this.endPageBlock = this.totalPageBlock;

        this.prevPageBlock = this.startPageBlock - 1;

        this.nextPageBlock = this.endPageBlock + 1;
        if (this.nextPageBlock > this.totalPageBlock)
            this.nextPageBlock = this.totalPageBlock;

    }

}
