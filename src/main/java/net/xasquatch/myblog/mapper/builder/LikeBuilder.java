package net.xasquatch.myblog.mapper.builder;

import org.apache.ibatis.jdbc.SQL;

public class LikeBuilder {

    public static String selectOneLike(Object likeNo, Object memberNo) {
        return new SQL() {{
            SELECT("no, mbr_no, board_no, comment_no, good");
            FROM("lke");
            WHERE("no= " + likeNo + " AND mbr_no = " + memberNo);
        }}.toString();

    }

    public static String insertOneLike(String likeTarget, String targetNo, String memberNo, String goodValue) {
        return new SQL() {{
            INSERT_INTO("lke");
            if (likeTarget.toUpperCase().equals("BOARD")) {
                INTO_COLUMNS("mbr_no", "board_no", "good");

            } else if (likeTarget.toUpperCase().equals("COMMENT")) {
                INTO_COLUMNS("mbr_no", "comment_no", "good");

            }
            INTO_VALUES(memberNo, targetNo, goodValue);
        }}.toString();
    }

}

