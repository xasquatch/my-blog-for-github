package net.xasquatch.myblog.mapper.builder;

import org.apache.ibatis.jdbc.SQL;

public class ResourceBuilder {

    public static String getResourceList(Object memberNo, Object startLimit, Object endLimit, Object searchValue) {
        return new SQL() {{
            SELECT("no, mbr_no, title, convert(contents USING UTF8) as contents");
            FROM("resource");
            WHERE("mbr_no = '" + memberNo + "' AND (title LIKE '%" + searchValue + "%' OR contents LIKE '%" + searchValue + "%')");
            ORDER_BY("no DESC");
            LIMIT(startLimit + "," + endLimit);
        }}.toString();
    }

    public static String getAddResourceList(Object memberNo, Object lastNumber, Object searchValue) {
        return new SQL() {{
            SELECT("no, mbr_no, title, convert(contents USING UTF8) as contents");
            FROM("resource");
            WHERE("mbr_no = '" + memberNo + "' AND no < " + lastNumber + " AND (title LIKE '%" + searchValue + "%' OR contents LIKE '%" + searchValue + "%')");
            ORDER_BY("no DESC");
            LIMIT(5);
        }}.toString();
    }

}
