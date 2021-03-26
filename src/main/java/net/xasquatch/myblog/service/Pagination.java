package net.xasquatch.myblog.service;

import java.util.ArrayList;
import java.util.List;

public class Pagination {

    private int[] calculationToPage(int pageLimit, int currentPageBlock, int totalCount) {

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

        return new int[]{prevPageBlock, nextPageBlock, endPageBlock};
    }

    public List<String> getCommentsBlockListOfBoard(Object boardNo, int pageLimit, int currentPageBlock, int totalCount) {

        int[] pageBlocks = calculationToPage(pageLimit, currentPageBlock, totalCount);

        int prevPageBlock = pageBlocks[0];
        int nextPageBlock = pageBlocks[1];
        int endPageBlock = pageBlocks[2];

        List<String> blockList = new ArrayList<String>();
        for (int i = prevPageBlock; i <= nextPageBlock; i++) {
            if (i != 0) {
                if (i == currentPageBlock) {
                    blockList.add("<a class='myblog-page-block current-page'>" + i + "</a>");

                } else if (i == prevPageBlock) {
                    blockList.add("<a class='myblog-page-block' href='/boards/" + boardNo + "/comments?"
                            + "page-limit=" + pageLimit + "&"
                            + "current-page-block=" + i + "'>prev</a>");

                } else if (i == nextPageBlock && i != endPageBlock) {
                    blockList.add("<a class='myblog-page-block' href='/boards/" + boardNo + "/comments?"
                            + "page-limit=" + pageLimit + "&"
                            + "current-page-block=" + i + "'>next</a>");

                } else {
                    blockList.add("<a class='myblog-page-block' href='/boards/" + boardNo + "/comments?"
                            + "page-limit=" + pageLimit + "&"
                            + "current-page-block=" + i + "'>" + i + "</a>");

                }
            }
        }
        return blockList;
    }


    public List<String> getBoardBlockList(Object memberNo, int pageLimit, int currentPageBlock, int totalCount, String searchTarget, String searchValue) {

        int[] pageBlocks = calculationToPage(pageLimit, currentPageBlock, totalCount);

        int prevPageBlock = pageBlocks[0];
        int nextPageBlock = pageBlocks[1];
        int endPageBlock = pageBlocks[2];

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
                    blockList.add("<a class='myblog-page-block current-page'>" + i + "</a>");

                } else if (i == prevPageBlock) {
                    blockList.add("<a class='myblog-page-block' href='/boards?"
                            + "memberNo=" + memberNo + "&"
                            + "page-limit=" + pageLimit + "&"
                            + "current-page-block=" + i + "&"
                            + searchTarget + "=" + searchValue + "'>prev</a>");

                } else if (i == nextPageBlock && i != endPageBlock) {
                    blockList.add("<a class='myblog-page-block' href='/boards?"
                            + "memberNo=" + memberNo + "&"
                            + "page-limit=" + pageLimit + "&"
                            + "current-page-block=" + i + "&"
                            + searchTarget + "=" + searchValue + "'>next</a>");

                } else {
                    blockList.add("<a class='myblog-page-block' href='/boards?"
                            + "memberNo=" + memberNo + "&"
                            + "page-limit=" + pageLimit + "&"
                            + "current-page-block=" + i + "&"
                            + searchTarget + "=" + searchValue + "'>" + i + "</a>");

                }
            }
        }
        return blockList;
    }

    public List<String> getNoticeBlockList(int pageLimit, int currentPageBlock, int totalCount, String searchTarget, String searchValue) {

        int[] pageBlocks = calculationToPage(pageLimit, currentPageBlock, totalCount);

        int prevPageBlock = pageBlocks[0];
        int nextPageBlock = pageBlocks[1];
        int endPageBlock = pageBlocks[2];

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
                    blockList.add("<a class='myblog-page-block current-page'>" + i + "</a>");

                } else if (i == prevPageBlock) {
                    blockList.add("<a class='myblog-page-block' href='/notice?"
                            + "page-limit=" + pageLimit + "&"
                            + "current-page-block=" + i + "&"
                            + searchTarget + "=" + searchValue + "'>prev</a>");

                } else if (i == nextPageBlock && i != endPageBlock) {
                    blockList.add("<a class='myblog-page-block' href='/notice?"
                            + "page-limit=" + pageLimit + "&"
                            + "current-page-block=" + i + "&"
                            + searchTarget + "=" + searchValue + "'>next</a>");

                } else {
                    blockList.add("<a class='myblog-page-block' href='/notice?"
                            + "page-limit=" + pageLimit + "&"
                            + "current-page-block=" + i + "&"
                            + searchTarget + "=" + searchValue + "'>" + i + "</a>");

                }
            }
        }
        return blockList;
    }

    public List<String> getBoardBlockListForAPI(Object memberNo, int pageLimit, int currentPageBlock, int totalCount, String searchTarget, String searchValue) {

        int[] pageBlocks = calculationToPage(pageLimit, currentPageBlock, totalCount);

        int prevPageBlock = pageBlocks[0];
        int nextPageBlock = pageBlocks[1];
        int endPageBlock = pageBlocks[2];

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
                    blockList.add("<a class='myblog-page-block current-page'>" + i + "</a>");

                } else if (i == prevPageBlock) {
                    blockList.add("<a class='myblog-page-block' href='/api/members/" + memberNo + "/boards?"
                            + "page-limit=" + pageLimit + "&"
                            + "current-page-block=" + i + "&"
                            + searchTarget + "=" + searchValue + "'>prev</a>");

                } else if (i == nextPageBlock && i != endPageBlock) {
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
}
