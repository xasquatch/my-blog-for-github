package net.xasquatch.myblog.mapper.builder;

import net.xasquatch.myblog.model.Member;
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
            if (searchTarget == null) {
                WHERE("a.rank != 'manager' AND m.name != 'GUEST'");

            } else if (searchTarget.equals("member-number")) {
                WHERE("a.rank != 'manager' AND m.name != 'GUEST' AND m.no LIKE '%" + searchValue + "%'");

            } else if (searchTarget.equals("member-name")) {
                WHERE("a.rank != 'manager' AND m.name != 'GUEST' AND m.name LIKE '%" + searchValue + "%'");

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
            if (searchTarget == null) {
                WHERE("a.rank != 'manager' AND m.name != 'GUEST'");

            } else if (searchTarget.equals("member-number")) {
                WHERE("a.rank != 'manager' AND m.name != 'GUEST' AND m.no LIKE '%" + searchValue + "%'");

            } else if (searchTarget.equals("member-name")) {
                WHERE("a.rank != 'manager' AND m.name != 'GUEST' AND m.name LIKE '%" + searchValue + "%'");

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

    public static String updateMbrWithAuthorization(Member member) {
        return new SQL() {{
            String authorization_no;
            switch (member.getRank()) {
                case "regular":
                    authorization_no = "2";
                    break;
                default:
                    authorization_no = "9";
                    break;
            }

            UPDATE("mbr");
            if (member.getPwd() == null || member.getPwd().equals("")) {
                SET("authorization_no = '" + authorization_no + "'," +
                        "email = '" + member.getEmail() + "'," +
                        "name = '" + member.getName() + "'");

            } else {
                SET("authorization_no = '" + authorization_no + "', " +
                        "email = '" + member.getEmail() + "', " +
                        "pwd = '" + member.getPwd() + "', " +
                        "name = '" + member.getName() + "'");

            }
            WHERE("no = '" + member.getNo() + "'");
        }}.toString();
    }
}
