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

    public static String selectAllMember(String typeAuthReference, String searchTarget, String searchValue) {
        if (!typeAuthReference.equals("manager")) return null;
        return new SQL() {{
            SELECT("m.no AS no, a.rank AS authorization, m.email AS email, " +
                    "m.name AS mbr_nickname, m.img AS img");
            FROM("mbr m");
            LEFT_OUTER_JOIN("authorization a ON m.authorization_no = a.no");
            WHERE("a.rank != 'manager'");
            if (searchTarget != null && !searchTarget.equals("")
                    && searchValue != null && !searchValue.equals("")) {
                AND();
                WHERE(searchTarget + " LIKE %" + searchValue + "%");
            }
            ORDER_BY("m.no DESC");
        }}.toString();
    }

    public static String selectRankFromMbrJoinAuthorization() {
        return new SQL() {{
            SELECT("m.*, a.rank AS rank");
            FROM("mbr m ");
            LEFT_OUTER_JOIN("authorization a ON m.authorization_no = a.no");
        }}.toString();
    }

}
