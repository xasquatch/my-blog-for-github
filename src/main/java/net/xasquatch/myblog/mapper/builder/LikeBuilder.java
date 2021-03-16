package net.xasquatch.myblog.mapper.builder;

import org.apache.ibatis.jdbc.SQL;

public class LikeBuilder {

    public static String getLikeForBoard(){
        return new SQL() {{
            

        }}.toString();

    }

}
