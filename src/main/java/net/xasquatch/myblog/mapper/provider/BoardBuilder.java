package net.xasquatch.myblog.mapper.provider;

import org.apache.ibatis.jdbc.SQL;

public class BoardBuilder {

    public static String selectBoardList(Object memberNo, Object currentPage, Object lastPage,
                                         Object searchTarget, Object searchValue) {

        return new SQL() {{
            SELECT("@ROWNUM := @ROWNUM + 1 AS row_number",
                    "b.no", "b.title",
                    "DATE_FORMAT(b.created_date, '%Y.%m.%d %H:%i:%s') AS created_date",
                    "b.thumbnail");
            FROM("board b", "(SELECT @ROWNUM := 0 ) TMP");
            if (searchTarget != null) {
                WHERE("member_no = " + memberNo
                        + " AND completed = 'true' AND "
                        + searchTarget + " LIKE '" + searchValue + "'");
            } else {
                WHERE("member_no = " + memberNo + " AND completed = 'true'");
            }
            ORDER_BY("b.created_date DESC");
            LIMIT(currentPage + ", " + lastPage);
        }}.toString();
    }

}
