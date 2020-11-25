package net.xasquatch.myblog.service;

import lombok.*;

import java.util.ArrayList;
import java.util.List;

@ToString
@Builder
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Pagination {

    private int currentPageBlock;
    private int pageLimit;
    private int totalCount;
    private int totalPageBlock;
    private int startPageBlock = 1;
    private int endPageBlock = 5;
    private int prevPageBlock;
    private int nextPageBlock;

    public List<String> getBlockList(long memberNo, int pageLimit, int currentPageBlock, int totalCount, String searchTarget, String searchValue) {

        int totalPageBlock = (totalCount / pageLimit);
        int startPageBlock = 1;
        int endPageBlock = 5;
        if (totalCount % pageLimit > 0)
            totalPageBlock += 1;

        if (currentPageBlock % 5 == 1) {
            startPageBlock = currentPageBlock;

        } else if (currentPageBlock % 5 == 0) {
            startPageBlock = currentPageBlock - 4;

        } else {
            startPageBlock = ((currentPageBlock / 5) * 5) + 1;

        }

        endPageBlock = startPageBlock + 4; // 4 = 5-1
        if (endPageBlock > totalPageBlock)
            endPageBlock = totalPageBlock;

        int prevPageBlock = startPageBlock - 1;

        int nextPageBlock = endPageBlock + 1;
        if (nextPageBlock > totalPageBlock)
            nextPageBlock = totalPageBlock;

        if (searchTarget == null) {
            searchTarget = "";
            searchValue = "";

        } else if (searchValue != null) {
            searchValue = searchValue.replaceAll("%", "");

        }

        List<String> blockList = new ArrayList<String>();
        for (int i = prevPageBlock; i <= nextPageBlock; i++) {
            if (i != 0) {
                if (i == currentPageBlock) {
                    blockList.add("<a class='myblog-page-block'>" + i + "</a>");

                } else if (i == prevPageBlock) {
                    blockList.add("<a class='myblog-page-block' href='/api/members/" + memberNo + "/boards?"
                            + "page-limit=" + pageLimit + "&"
                            + "current-page-block=" + i + "&"
                            + searchTarget + "=" + searchValue + "'>prev</a>");

                } else if (i == nextPageBlock) {
                    blockList.add("<a class='myblog-page-block' href='/api/members/" + memberNo + "/boards?"
                            + "page-limit=" + pageLimit + "&"
                            + "current-page-block=" + i + "&"
                            + searchTarget + "=" + searchValue + "'>next</a>");

                } else {
                    blockList.add("<a class='myblog-page-block' href='/api/members/" + memberNo + "/boards?"
                            + "page-limit=" + pageLimit + "&"
                            + "current-page-block=" + i + "&"
                            + searchTarget + "=" + searchValue + "'>" + i + "</a>");

                }
            }
        }

        return blockList;
    }

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
