package net.xasquatch.myblog.mapper.builder;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.jdbc.SQL;

public class BoardBuilder {

    public static String selectBoardList(Object memberNo, Object currentPage, Object lastPage,
                                         Object searchTarget, Object searchValue) {

        return new SQL() {{
            SELECT("*");
            FROM("(" + selectBoardListSubQuery(memberNo, searchTarget, searchValue) + ")t");
            ORDER_BY("row_number DESC");
            LIMIT(currentPage + ", " + lastPage);
        }}.toString();
    }

    public static String selectBoardListSubQuery(Object memberNo, Object searchTarget, Object searchValue) {

        return new SQL() {{
            SELECT("@ROWNUM := @ROWNUM + 1 AS row_number",
                    "b.no", "b.title", "b.mbr_no",
                    "DATE_FORMAT(b.created_date, '%Y.%m.%d %H:%i:%s') AS created_date",
                    "b.thumbnail");
            FROM("board b", "(SELECT @ROWNUM := 0 ) TMP");

            if (searchTarget == null) {
                WHERE("mbr_no = " + memberNo + " AND completed = 'true'");

            } else if (searchTarget.equals("titleOrContents")) {
                WHERE("mbr_no = " + memberNo
                        + " AND completed = 'true'"
                        + " AND (b.title LIKE '" + searchValue + "'"
                        + " OR b.contents LIKE '" + searchValue + "')");

            } else {
                WHERE("mbr_no = " + memberNo
                        + " AND completed = 'true'"
                        + " AND " + searchTarget + " LIKE '" + searchValue + "'");

            }

            ORDER_BY("b.created_date ASC");
        }}.toString();

    }

    public static String selectBoardCount(Object memberNo, String searchTarget, String searchValue) {
        return new SQL() {{
            SELECT("COUNT(*) AS total_count");
            FROM("board");
            if (searchValue.equals("")){
                WHERE("mbr_no = " + memberNo + " AND completed = 'true'");

            } else if (searchTarget.equals("titleOrContents")) {
                WHERE("mbr_no = " + memberNo + " AND completed = 'true' AND (title LIKE '" + searchValue + "' OR contents '" + searchValue + "')");

            }else{
                WHERE("mbr_no = " + memberNo + " AND completed = 'true' AND " + searchTarget + " LIKE '" + searchValue + "'");

            }
        }}.toString();
    }


}
