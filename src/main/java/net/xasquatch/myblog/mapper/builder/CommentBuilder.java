package net.xasquatch.myblog.mapper.builder;

import org.apache.ibatis.jdbc.SQL;

public class CommentBuilder {

    public static String selectCommentList(Object boardNo) {
        return new SQL() {{
            SELECT("row_number, no, mbr_no, " +
                    "convert(contents USING UTF8) AS contents," +
                    "REPLACE(created_ip, RIGHT(created_ip, 4),'.***') AS created_ip," +
                    "DATE_FORMAT(created_date, '%Y.%m.%d %H:%i:%s') AS created_date," +
                    "board_no, mbr_name, img");
            FROM("(" + selectCommentListSubQuery(boardNo) + ") c, (SELECT @ROWNUM := 0) TMP");
            ORDER_BY("length(row_number) DESC, row_number DESC");
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
            SELECT("FORMAT(@ROWNUM := @ROWNUM + 1, 0) AS row_number, " +
                    "c.no AS no, c.mbr_no AS mbr_no, " +
                    "m.name AS mbr_name, m.img AS img, " +
                    "c.contents AS contents, c.created_ip AS created_ip, " +
                    "c.created_date AS created_date, " +
                    "c.board_no AS board_no");
            FROM("comment c");
            JOIN("mbr m ON c.mbr_no = m.no");
            WHERE("c.board_no = '" + boardNo + "'");
        }}.toString();

    }

}