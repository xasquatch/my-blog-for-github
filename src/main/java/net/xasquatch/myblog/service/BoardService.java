package net.xasquatch.myblog.service;

import lombok.extern.slf4j.Slf4j;
import net.xasquatch.myblog.model.Board;
import net.xasquatch.myblog.model.Member;
import net.xasquatch.myblog.repository.BoardDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.*;

@Slf4j
@Service
@PropertySource("/WEB-INF/properties/file-manager.properties")
public class BoardService {

    @Autowired
    private BoardDao boardDao;

    @Resource(name = "sessionMember")
    private Member sessionMember;

    @Autowired
    private FileService fileService;

    @Value("${files.save.directory.blog}")
    String SaveDir;

    @Value("${files.save.contents.name.blog}")
    String ContentsName;

    public String checkBoardFormData(Board board) {
        String[] prohibitedWords = {"<script", "onload="};

        String title = board.getTitle().replaceAll(" ", "");
        String contents = board.getContents().replaceAll(" ", "");
        ;
        String keyword = board.getKeyword().replaceAll(" ", "");
        ;
        String thumbnail = board.getThumbnail().replaceAll(" ", "");
        ;

        if (!thumbnail.contains("<img"))
            board.setThumbnail("<img style=\"max-width: 140px; max-height: 140px;\" src=\"https://myblog.xasquatch.net/img/no_image.png\">");

        Map<String, String> CheckTargetString = new HashMap<String, String>();
        CheckTargetString.put("Title", title);
        CheckTargetString.put("Contents", contents);
        CheckTargetString.put("Keyword", keyword);
        CheckTargetString.put("Thumbnail", thumbnail);
        CheckTargetString.put("msg", "");

        CheckTargetString.forEach((key, value) -> {
            for (String word : prohibitedWords) {
                if (!key.equals("msg") && value.contains(word)) {
                    CheckTargetString.put("msg", "[script Error] 스크립트를 제거해주시기바랍니다.");
                }
            }
        });

        return CheckTargetString.get("msg");
    }

    public String[] parsingSearchValue(String keyword, String title, String contents, String titleOrContents) {
        Map<String, String> map = new HashMap<String, String>();
        String[] searchValue = new String[2];

        map.put("keyword", keyword);
        map.put("title", title);
        map.put("contents", contents);
        map.put("title-or-contents", titleOrContents);

        map.forEach((key, value) -> {
            if (!key.equals("") && !key.equals("undefined")
                    && (!value.equals("") && !value.equals("undefined"))) {
                searchValue[0] = key;
                searchValue[1] = '%' + value + '%';
            }
        });

        return searchValue;
    }

    public boolean isConfirmBoardPwd(Object Boardno, String pwd) {

        return boardDao.selectOneBoardColumnPwd(Boardno, pwd);

    }

    public Map<String, Object> getNoticeList(Object rank, int pageLimit, int currentPageBlock, String[] searchValue) {

        int currentPage = 0;
        try {
            currentPage = (currentPageBlock - 1) * pageLimit;

        } catch (ArithmeticException e) {
            log.warn("[ArithmeticException]pageLimit: {}", pageLimit);
        }

        List<Map<String, Object>> boardList
                = boardDao.selectNoticeList(rank, currentPage, pageLimit, searchValue[0], searchValue[1]);

        int totalCount = boardDao.selectNoticeCount(rank, searchValue[0], searchValue[1]);

        List<String> pageBlockList = new Pagination().getNoticeBlockList(pageLimit, currentPageBlock, totalCount, searchValue[0], searchValue[1]);


        Map<String, Object> data = new HashMap<String, Object>();
        data.put("boardList", boardList);
        data.put("pageBlockList", pageBlockList);

        return data;
    }

    public Map<String, Object> getCommunityList(int pageLimit, int currentPageBlock, String keyword) {

        int currentPage = 0;
        try {
            currentPage = (currentPageBlock - 1) * pageLimit;

        } catch (ArithmeticException e) {
            log.warn("[ArithmeticException]pageLimit: {}", pageLimit);
        }

        List<Map<String, Object>> boardList
                = boardDao.selectBoardList("all", currentPage, pageLimit, "keyword", keyword);

        int totalCount = boardDao.selectBoardCount("all", "keyword", keyword);

        List<String> pageBlockList = new Pagination().getCommunityBlockList(pageLimit, currentPageBlock, totalCount, keyword);

        Map<String, Object> data = new HashMap<String, Object>();
        data.put("boardList", boardList);
        data.put("pageBlockList", pageBlockList);
        data.put("topKeywordList", getTopKeywordList());

        return data;
    }

    private Map<String, Integer> getTopKeywordList() {

        List<String> topKeywordListString = boardDao.selectAllKeywordList();
        StringBuilder parsedKeywordString = new StringBuilder();
        for (String keywords : topKeywordListString) {
            if (parsedKeywordString.toString().equals("")) {
                parsedKeywordString.append(keywords);
            } else {
                parsedKeywordString.append(",").append(keywords);
            }
        }

        Map<String, Integer> topKeywordMap = new HashMap<String, Integer>();
        String[] keywordArray = parsedKeywordString.toString().split(",");
        for (String keyword : keywordArray) {
            try {
                Integer population = topKeywordMap.get(keyword);
                population += 1;
                topKeywordMap.put(keyword, population);
            } catch (NullPointerException e) {
                topKeywordMap.put(keyword, 1);
            }
        }

        List<Map.Entry<String, Integer>> listEntries = new ArrayList<Map.Entry<String, Integer>>(topKeywordMap.entrySet());

        listEntries.sort(new Comparator<Map.Entry<String, Integer>>() {
            public int compare(Map.Entry<String, Integer> obj1, Map.Entry<String, Integer> obj2) {
                return obj2.getValue().compareTo(obj1.getValue());
            }
        });

        int count = 0;
        Map<String, Integer> top10KeywordList = new HashMap<String, Integer>();
        for (Map.Entry<String, Integer> entry : listEntries) {
            if (count >= 10) break;

            count++;

            if (entry.getKey().equals("null")) {
                count--;

            } else {
                top10KeywordList.put(entry.getKey(), entry.getValue());

            }

        }

        return top10KeywordList;
    }

    public Map<String, Object> getBoardList(Object typeAuthReference, int pageLimit, int currentPageBlock, String[] searchValue) {

        int currentPage = 0;
        try {
            currentPage = (currentPageBlock - 1) * pageLimit;

        } catch (ArithmeticException e) {
            log.warn("[ArithmeticException]pageLimit: {}", pageLimit);
        }

        Object memberNo = typeAuthReference.equals("all-management") ? "all" : typeAuthReference;

        List<Map<String, Object>> boardList
                = boardDao.selectBoardList(memberNo, currentPage, pageLimit, searchValue[0], searchValue[1]);

        int totalCount = boardDao.selectBoardCount(memberNo, searchValue[0], searchValue[1]);

        List<String> pageBlockList;
        if (typeAuthReference.equals("all-management")) {
            pageBlockList = new Pagination().manageBoardBlockList(pageLimit, currentPageBlock, totalCount, searchValue[0], searchValue[1]);

        } else if (typeAuthReference.equals("all")) {
            pageBlockList = new Pagination().getBoardBlockList("all", pageLimit, currentPageBlock, totalCount, searchValue[0], searchValue[1]);

        } else {
            pageBlockList = new Pagination().getBoardBlockList(typeAuthReference, pageLimit, currentPageBlock, totalCount, searchValue[0], searchValue[1]);

        }

        Map<String, Object> data = new HashMap<String, Object>();
        data.put("boardList", boardList);
        data.put("pageBlockList", pageBlockList);

        return data;
    }

    public Object createDefaultBoard(String memberNo) {
        Map<String, Object> memberMap = new HashMap<String, Object>();
        memberMap.put("mbr_no", memberNo);
        boardDao.deleteUnfinishedBoard(memberMap);
        if (boardDao.insertDefaultBoard(memberMap)) {
            String path = File.separator + memberNo + SaveDir + File.separator + memberMap.get("no");
            fileService.removeFiles(path);
            return memberMap.get("no");

        } else {
            return false;

        }

    }

    public boolean createFinish(Board board) {
        if (board.getTitle().equals("") || board.getTitle() == null) board.setTitle("[Empty Title]");
        if (board.getThumbnail().trim().equals("") || board.getThumbnail() == null)
            board.setThumbnail("<img style=\"max-width: 140px; max-height: 140px;\" src=\"https://myblog.xasquatch.net/img/no_image.png\"/>");
        String pwd = board.getPwd();
        if (pwd == null || pwd.equals("") || pwd.equals("null"))
            board.setPwd("0000");

        byte[] bytes = (board.getTitle() + System.lineSeparator() + board.getCreated_ip() + System.lineSeparator() + board.getContents()).getBytes();

        fileService.writeFile(bytes, File.separator + board.getMbr_no() + SaveDir + File.separator + board.getNo(), ContentsName + "-origin");
        return boardDao.updateBoard(board);

    }

    public boolean modify(Board board) {
        SimpleDateFormat format = new SimpleDateFormat("-yyyyMMddhhmmss");
        String pwd = board.getPwd();
        if (pwd == null || pwd.equals("") || pwd.equals("null"))
            board.setPwd("0000");

        byte[] bytes = (board.getTitle() + System.lineSeparator() + board.getCreated_ip() + System.lineSeparator() + board.getContents()).getBytes();

        fileService.writeFile(bytes, File.separator + board.getMbr_no() + SaveDir + File.separator + board.getNo(), ContentsName + format.format(new Date()));
        return boardDao.updateBoard(board);

    }

    public Map<String, Object> viewDetail(Object boardNo) {
        return boardDao.selectOneBoard(boardNo);

    }

    public boolean delete(Object boardKey) {
        boolean result = false;
        if (boardDao.deleteOneBoard(boardKey) == 1)
            result = true;
        return result;
    }

}