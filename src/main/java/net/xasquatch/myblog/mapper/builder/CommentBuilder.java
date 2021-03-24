package net.xasquatch.myblog.mapper.builder;

import org.apache.ibatis.jdbc.SQL;

public class CommentBuilder {

    public static String selectCommentList(Object boardNo) {
        return new SQL() {{
            SELECT("no, mbr_no, convert(contents USING UTF8) AS contents," +
                    "REPLACE(created_ip, RIGHT(created_ip, 4),'.***') AS created_ip," +
                    "DATE_FORMAT(created_date, '%Y.%m.%d %H:%i:%s') AS created_date," +
                    "board_no, mbr_name, img, IFNULL(good, 0) AS 'like'");
            FROM("(" + selectCommentListSubQuery(boardNo) + ") c");
            ORDER_BY("no DESC");
        }}.toString();

    }

    public static String selectCountComment(Object boardNo, Object currentPage) {
        return new SQL() {{
            SELECT("COUNT(*) AS total_count");
            FROM("COMMENT c, (SELECT @ROWNUM := 0) TMP");
            WHERE("boardNo = " + boardNo);
        }}.toString();

    }

    public static String selectCommentListSubQuery(Object boardNo) {
        return new SQL() {{
            SELECT("c.no AS no, c.mbr_no AS mbr_no, " +
                    "m.name AS mbr_name, m.img AS img, " +
                    "c.contents AS contents, c.created_ip AS created_ip, " +
                    "c.created_date AS created_date, " +
                    "c.board_no AS board_no, " +
                    "l.good AS good");
            FROM("comment c");
            LEFT_OUTER_JOIN("mbr m ON c.mbr_no = m.no");
            LEFT_OUTER_JOIN(LikeBuilder.selectSumLke() + " l ON c.no = l.comment_no");
            WHERE("c.board_no = '" + boardNo + "'");
        }}.toString();

    }

}