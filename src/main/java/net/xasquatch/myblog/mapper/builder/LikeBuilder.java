package net.xasquatch.myblog.mapper.builder;

import org.apache.ibatis.jdbc.SQL;

public class LikeBuilder {

    /**
     * @param likeTarget 분기점
     * @param likeNo     WHERE 조건절
     * @return
     */
    public static String selectOneLke(String likeTarget, Object likeNo) {
        return new SQL() {{
            if (likeTarget.toUpperCase().equals("BOARD")) {
                SELECT("l.no AS no, " +
                        "l.mbr_no AS mbr_no, " +
                        "l.board_no AS board_no, " +
                        "l.good AS like, " +
                        "b.title AS board_title, " +
                        "b.thumbnail AS board_thumbnail");
                FROM(selectSumLke() + " l ON");
                JOIN("board b");

            } else if (likeTarget.toUpperCase().equals("COMMENT")) {
                SELECT("l.no AS no, " +
                        "l.mbr_no AS mbr_no, " +
                        "l.comment_no AS comment_no, " +
                        "l.good AS like, " +
                        "c.contents AS comment_contents, " +
                        "c.board_no AS comment_board_no");
                FROM(selectSumLke() + " l ON");
                JOIN("comment c");
            }
            WHERE("no= " + likeNo);
        }}.toString();

    }

    public static String selectOneLkeNo(String likeTarget, Object targetNo, Object memberNo) {
        return new SQL() {{
            if (likeTarget.toUpperCase().equals("BOARD")) {
                SELECT("l.no AS no");
                FROM("lke l");
                RIGHT_OUTER_JOIN("board b ON l.board_no = b.no");
                WHERE("l.board_no = " + targetNo + " AND l.mbr_no= " + memberNo);

            } else if (likeTarget.toUpperCase().equals("COMMENT")) {
                SELECT("l.no AS no");
                FROM("lke l");
                RIGHT_OUTER_JOIN("comment c ON l.comment_no = c.no");
                WHERE("l.comment_no = " + targetNo + " AND l.mbr_no= " + memberNo);
            }
        }}.toString();

    }


    /**
     * @param likeTarget 분기점 생성
     * @param targetNo   조건절에서 분기된 해당 테이블 외래키값으로 삽입할 파라미터
     * @param memberNo   멤버테이블 파라미터
     * @param goodValue  1 혹은 -1 예정 삽입
     * @return
     */
    public static String insertOneLke(String likeTarget, String targetNo, String memberNo, String goodValue) {
        return new SQL() {{
            INSERT_INTO("lke");
            if (likeTarget.toUpperCase().equals("BOARD")) {
                INTO_COLUMNS("mbr_no", "board_no", "good");

            } else if (likeTarget.toUpperCase().equals("COMMENT")) {
                INTO_COLUMNS("mbr_no", "comment_no", "good");

            }
            INTO_VALUES(memberNo, targetNo, goodValue);
        }}.toString();
    }

    public static String selectSumLke() {
        return '(' + new SQL() {{
            SELECT("no", "mbr_no", "comment_no", "board_no", "SUM(good) AS good");
            FROM("lke");

        }}.toString() + ')';

    }

}

