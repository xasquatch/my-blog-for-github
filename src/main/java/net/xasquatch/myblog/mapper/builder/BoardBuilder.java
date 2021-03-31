package net.xasquatch.myblog.mapper.builder;

import org.apache.ibatis.jdbc.SQL;

public class BoardBuilder {

    public static String selectOneBoard(Object board_no) {
        return new SQL() {{
            SELECT("b.no AS no", "b.mbr_no AS mbr_no", "m.name AS name",
                    "b.keyword AS keyword", "b.title AS title",
                    "convert(b.contents USING UTF8) AS contents",
                    "DATE_FORMAT(b.created_date, '%Y.%m.%d %H:%i:%s') AS created_date",
                    "b.thumbnail AS thumbnail", "IFNULL(l.good, 0) AS 'like'",
                    "REPLACE(b.created_ip, RIGHT(b.created_ip, 4),'.***') AS created_ip");
            FROM("board b");
            LEFT_OUTER_JOIN("mbr m ON b.mbr_no = m.no");
            LEFT_OUTER_JOIN(LikeBuilder.selectSumLke() + " l ON l.board_no = b.no");
            WHERE("b.no = " + board_no);
        }}.toString();
    }

    public static String selectBoardList(Object memberNo, Object currentPage, Object pageLimit,
                                         Object searchTarget, Object searchValue) {
        return new SQL() {{
            SELECT("m.img AS mbr_img_src, m.name AS mbr_nickname, " +
                    // 서브쿼리 메서드 부분
                    "b.row_number AS row_number, " +
                    "b.no AS no, b.title AS title, b.mbr_no AS mbr_no, " +
                    "b.created_date AS created_date, " +
                    "b.thumbnail AS thumbnail, " +
                    "b.good AS 'like'");
            if (memberNo.equals("all")) {
                FROM("(" + selectAllBoardListSubQuery(searchTarget, searchValue) + ")b");

            } else {
                FROM("(" + selectBoardListSubQuery(memberNo, searchTarget, searchValue) + ")b");

            }
            LEFT_OUTER_JOIN("mbr m ON b.mbr_no = m.no");
            LIMIT(currentPage + ", " + pageLimit);
            ORDER_BY("b.created_date DESC", "b.row_number DESC");
        }}.toString();
    }

    public static String selectNoticeList(Object rank, Object currentPage, Object pageLimit,
                                          Object searchTarget, Object searchValue) {

        return new SQL() {{
            SELECT("m.img AS mbr_img_src, m.name AS mbr_nickname, b.*");
            FROM("(" + selectNoticeListSubQuery(rank, searchTarget, searchValue) + ") b");
            LEFT_OUTER_JOIN("mbr m ON b.mbr_no = m.no");
            LIMIT(currentPage + ", " + pageLimit);
            ORDER_BY("b.created_date DESC");
        }}.toString();
    }

    public static String selectNoticeListSubQuery(Object rank, Object searchTarget, Object searchValue) {

        return new SQL() {{
            SELECT("b.no", "b.title", "b.mbr_no",
                    "DATE_FORMAT(b.created_date, '%Y.%m.%d %H:%i:%s') AS created_date",
                    "b.thumbnail, IFNULL(l.good,0) AS good");
            FROM("board b");
            LEFT_OUTER_JOIN("(" + MemberBuilder.selectRankFromMbrJoinAuthorization() + ") m ON b.mbr_no = m.no");
            LEFT_OUTER_JOIN(LikeBuilder.selectSumLke() + " l ON b.no = l.board_no");
            if (searchTarget == null) {
                WHERE("m.rank = '" + rank + "' AND keyword = 'my-blog-notice' AND completed = 'true'");

            } else if (searchTarget.equals("title-or-contents")) {
                WHERE("m.rank = '" + rank + "' AND keyword = 'my-blog-notice' AND completed = 'true'"
                        + " AND (b.title LIKE '%" + searchValue + "%'"
                        + " OR b.contents LIKE '%" + searchValue + "%')");

            } else {
                WHERE("m.rank = '" + rank + "' AND keyword = 'my-blog-notice' AND completed = 'true'"
                        + " AND " + searchTarget + " LIKE '%" + searchValue + "%'");

            }

            ORDER_BY("b.created_date ASC");
        }}.toString();

    }

    public static String selectAllBoardListSubQuery(Object searchTarget, Object searchValue) {

        return new SQL() {{
            SELECT("FORMAT(@ROWNUM := @ROWNUM + 1, 0) AS row_number",
                    "b.no", "b.title", "b.mbr_no",
                    "DATE_FORMAT(b.created_date, '%Y.%m.%d %H:%i:%s') AS created_date",
                    "b.thumbnail, IFNULL(l.good,0) AS good");
            FROM("board b");
            LEFT_OUTER_JOIN(LikeBuilder.selectSumLke() + " l ON b.no = l.board_no, (SELECT @ROWNUM := 0 ) TMP");
            if (searchTarget == null) {
                WHERE("b.completed = 'true'");

            } else if (searchTarget.equals("title-or-contents")) {
                WHERE("b.completed = 'true'"
                        + " AND (b.title LIKE '%" + searchValue + "%'"
                        + " OR b.contents LIKE '%" + searchValue + "%')");

            } else {
                WHERE("b.completed = 'true'"
                        + " AND " + searchTarget + " LIKE '%" + searchValue + "%'");

            }

            ORDER_BY("b.created_date ASC");
        }}.toString();

    }

    public static String selectBoardListSubQuery(Object memberNo, Object searchTarget, Object searchValue) {
        return new SQL() {{
            SELECT("FORMAT(@ROWNUM := @ROWNUM + 1, 0) AS row_number",
                    "b.no", "b.title", "b.mbr_no",
                    "DATE_FORMAT(b.created_date, '%Y.%m.%d %H:%i:%s') AS created_date",
                    "b.thumbnail, IFNULL(l.good,0) AS good");
            FROM("board b");
            LEFT_OUTER_JOIN(LikeBuilder.selectSumLke() + " l ON b.no = l.board_no, (SELECT @ROWNUM := 0 ) TMP");
            if (searchTarget == null) {
                WHERE("b.mbr_no = " + memberNo + " AND completed = 'true'");

            } else if (searchTarget.equals("title-or-contents")) {
                WHERE("b.mbr_no = " + memberNo
                        + " AND b.completed = 'true'"
                        + " AND (b.title LIKE '%" + searchValue + "%'"
                        + " OR b.contents LIKE '%" + searchValue + "%')");

            } else {
                WHERE("b.mbr_no = " + memberNo
                        + " AND b.completed = 'true'"
                        + " AND " + searchTarget + " LIKE '%" + searchValue + "%'");

            }

            ORDER_BY("b.created_date ASC");
        }}.toString();

    }

    public static String selectBoardCount(Object memberNo, String searchTarget, String searchValue) {
        if (memberNo.equals("all")) {
            return selectAllBoardCount(searchTarget, searchValue);

        } else {
            return selectMemberBoardCount(memberNo, searchTarget, searchValue);
        }

    }

    public static String selectNoticeCount(Object rank, String searchTarget, String searchValue) {

        return new SQL() {{
            SELECT("COUNT(*) AS total_count");
            FROM("board b");
            LEFT_OUTER_JOIN("(" + MemberBuilder.selectRankFromMbrJoinAuthorization() + ") m ON b.mbr_no = m.no");
            if (searchTarget == null) {
                WHERE("m.rank = '" + rank + "' AND keyword = 'my-blog-notice' AND completed = 'true'");

            } else if (searchTarget.equals("title-or-contents")) {
                WHERE("m.rank = '" + rank + "' AND keyword = 'my-blog-notice' AND completed = 'true' AND (title LIKE '%" + searchValue + "%' OR contents LIKE '%" + searchValue + "%')");

            } else {
                WHERE("m.rank = '" + rank + "' AND keyword = 'my-blog-notice' AND completed = 'true' AND " + searchTarget + " LIKE '%" + searchValue + "%'");

            }
        }}.toString();

    }


    public static String selectMemberBoardCount(Object memberNo, String searchTarget, String searchValue) {
        return new SQL() {{
            SELECT("COUNT(*) AS total_count");
            FROM("board");
            if (searchTarget == null) {
                WHERE("mbr_no = " + memberNo + " AND completed = 'true'");

            } else if (searchTarget.equals("title-or-contents")) {
                WHERE("mbr_no = " + memberNo + " AND completed = 'true' AND (title LIKE '%" + searchValue + "%' OR contents LIKE '%" + searchValue + "%')");

            } else {
                WHERE("mbr_no = " + memberNo + " AND completed = 'true' AND " + searchTarget + " LIKE '%" + searchValue + "%'");

            }
        }}.toString();
    }


    public static String selectAllBoardCount(String searchTarget, String searchValue) {
        return new SQL() {{
            SELECT("COUNT(*) AS total_count");
            FROM("board");
            if (searchTarget == null) {
                WHERE("completed = 'true'");

            } else if (searchTarget.equals("title-or-contents")) {
                WHERE("completed = 'true' AND (title LIKE '%" + searchValue + "%' OR contents LIKE '%" + searchValue + "%')");

            } else {
                WHERE("completed = 'true' AND " + searchTarget + " LIKE '%" + searchValue + "%'");

            }
        }}.toString();
    }


}
