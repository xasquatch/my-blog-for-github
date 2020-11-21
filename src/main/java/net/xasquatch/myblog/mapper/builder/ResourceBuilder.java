package net.xasquatch.myblog.mapper.builder;

import org.apache.ibatis.jdbc.SQL;

public class ResourceBuilder {

    public static String getResourceList(Object memberNo, Object resourceNo, Object searchValue){
        return new SQL(){{
            SELECT("");
            FROM("");

        }}.toString();

    }

}
