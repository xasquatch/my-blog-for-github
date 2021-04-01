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

    public static String selectAllMember(int currentPage, int pageLimit, String searchTarget, String searchValue) {
        return new SQL() {{
            SELECT("m.no AS no, a.rank AS authorization, m.email AS email, " +
                    "m.name AS mbr_nickname, m.img AS img");
            FROM("mbr m");
            LEFT_OUTER_JOIN("authorization a ON m.authorization_no = a.no");
            WHERE("a.rank != 'manager' AND m.name != 'GUEST'");
            if (searchTarget.equals("member-number")) {
                WHERE("m.no LIKE '%" + searchValue + "%'");

            } else if (searchTarget.equals("member-name")) {
                WHERE("m.name LIKE '%" + searchValue + "%'");

            }
            LIMIT(currentPage + ", " + pageLimit);
            ORDER_BY("m.no DESC");
        }}.toString();
    }

    public static String selectAllMemberCount(String searchTarget, String searchValue) {
        return new SQL() {{
            SELECT("COUNT(m.no)");
            FROM("mbr m");
            LEFT_OUTER_JOIN("authorization a ON m.authorization_no = a.no");
            if (searchTarget.equals("member-number")) {
                WHERE("a.rank != 'manager' AND m.name != 'GUEST' AND m.no LIKE '%" + searchValue + "%'");

            } else if (searchTarget.equals("member-name")) {
                WHERE("a.rank != 'manager' AND m.name != 'GUEST' AND m.name LIKE '%" + searchValue + "%'");

            } else {
                WHERE("a.rank != 'manager' AND m.name != 'GUEST'");

            }
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
