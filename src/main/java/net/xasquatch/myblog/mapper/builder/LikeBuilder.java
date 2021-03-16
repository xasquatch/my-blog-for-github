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

    public static String insertOneLike() {
        return new SQL(){{
            INSERT_INTO("lke");
            /*TODO:분기점*/
            VALUES("");
        }}.toString();
    }


}
