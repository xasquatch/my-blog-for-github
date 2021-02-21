package net.xasquatch.myblog.mapper.builder;

import org.apache.ibatis.jdbc.SQL;

public class CommentBuilder {

    public static String selectCommentList(Object boardNo) {
        return new SQL() {{
            SELECT("FORMAT(@ROWNUM := @ROWNUM + 1, 0) AS row_number, no, mbr_no, contents, created_ip, created_date, pwd");
            FROM("comment c, (SELECT @ROWNUM := 0) TMP");
            WHERE("board_no = '" + boardNo + "'");
            ORDER_BY("created_date DESC, no DESC");
        }}.toString();

    }

    public static String selectCountComment(Object boardNo, Object currentPage) {
        return new SQL() {{
            SELECT("COUNT(*) AS total_count");
            FROM("COMMENT c, (SELECT @ROWNUM := 0) TMP");
            WHERE("boardNo = " + boardNo);
        }}.toString();

    }

    public static String selectCommentListSubQuery(Object boardNo, Object currentPage) {
        return new SQL() {{
            SELECT("FORMAT(@ROWNUM := @ROWNUM + 1, 0) AS row_number");
            FROM("COMMENT c, (SELECT @ROWNUM := 0) TMP");
            WHERE("boardNo = " + boardNo);
        }}.toString();

    }

}
