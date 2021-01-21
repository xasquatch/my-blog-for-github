package net.xasquatch.myblog.mapper.builder;

import org.apache.ibatis.jdbc.SQL;

public class MemberBuilder {

    public static String updateRank(Long no, String email) {
        return new SQL() {{
            UPDATE("mbr");
            SET("authorization_no = 2");
            WHERE("no = " + no + " AND email = '" + email + "'");
        }}.toString();

    }

    public static String selectRank(Long no, String email) {
        return new SQL() {{
            SELECT("rank");
            FROM("MBR m ");
            LEFT_OUTER_JOIN("authorization a ON m.authorization_no = a.no");
            WHERE("m.no=" + no + " AND m.email='" + email + "'");
        }}.toString();
    }


    public static String selectRankFromMbrJoinAuthorization(){
        return new SQL(){{
            SELECT("m.*, a.rank AS rank");
            FROM("mbr m ");
            LEFT_OUTER_JOIN("authorization a ON m.authorization_no = a.no");
        }}.toString();
    }

}
