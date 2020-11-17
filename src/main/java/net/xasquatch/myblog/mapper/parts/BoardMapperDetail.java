package net.xasquatch.myblog.mapper.parts;

import org.apache.ibatis.jdbc.SQL;

public class BoardMapperDetail {

    public String selectBoardListIfWhere(Object member_no, Object currentPage, Object lastPage, Object keywords, Object title, Object contents, Object titleAndContents) {
        String rowNumJoinSql = new SQL() {{
            SELECT("@ROWNUM := @ROWNUM + 1 AS rowno, board.*");
            FROM("board board, (SELECT @ROWNUM := 0 ) TMP ");
            WHERE("member_no = " + member_no + " AND completed = 'true' ");
            ORDER_BY("board.no ASC ");
        }}.toString();

        return new SQL() {{
            SELECT("*");
            FROM(rowNumJoinSql, "SUB");
            if (keywords != null) WHERE("SUB.keyword like " + keywords);
            if (title != null) WHERE("SUB.title like " + title);
            if (contents != null) WHERE("SUB.title like " + contents);
            if (titleAndContents != null){
                WHERE("SUB.title like " + titleAndContents);
                OR();
                WHERE("SUB.title like " + titleAndContents);
            }
            ORDER_BY("SUB.rowno DESC");
            LIMIT(currentPage.toString());
            OFFSET(lastPage.toString());


        }}.toString();
    }


}
