package net.xasquatch.myblog.mapper.builder;

import org.apache.ibatis.jdbc.SQL;

public class CommentBuilder {

    public static String selectCommentList(Object boardNo, Object currentPage){

        return new SQL(){{
            SELECT("");
        }}.toString();
    }

    public static String selectCountComment(Object boardNo, Object currentPage){

        return new SQL(){{
            SELECT("COUNT(*) AS total_count");
            FROM("COMMENT");
        }}.toString();
    }

    public static String selectCommentListSubQuery(Object boardNo, Object currentPage){

        return new SQL(){{
            SELECT("FORMAT(@ROWNUM := @ROWNUM + 1, 0) AS row_number");
        }}.toString();


    }
}
