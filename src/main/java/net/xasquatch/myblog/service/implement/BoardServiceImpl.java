package net.xasquatch.myblog.service.implement;

import net.xasquatch.myblog.model.Board;
import net.xasquatch.myblog.model.Member;
import net.xasquatch.myblog.repository.BoardDao;
import net.xasquatch.myblog.service.BoardService;
import net.xasquatch.myblog.service.FileService;
import net.xasquatch.myblog.service.ImgParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class BoardServiceImpl implements BoardService {

    @Autowired
    private BoardDao boardDao;

    @Autowired
    private FileService fileService;

    @Override
    public boolean viewDetail(Board board) {
        return false;
    }

    @Override
    public boolean update(Board board, Member member) {
        return false;
    }

    @Override
    public boolean delete(Board board, Member member) {
        return false;
    }

    @Override
    public boolean create(Board board, Member member) {
        boolean result = false;

        ImgParser imgParser = ImgParser.getImgParser(board.getContents());
        System.out.println(imgParser.getContentsString());

        while (imgParser.isCuttableImgSrc()) {
            imgParser.addImgList();

        }

        List<String> imgSrcList = imgParser.getImgSrcList();
        List<String> imgExtensionList = imgParser.getImgExtensionList();
        List<String> imgSrcDir = new ArrayList<String>();
        String path = member.getNo() + File.pathSeparator + board.getTitle() + File.pathSeparator;
        for (int i = 0; i < imgSrcList.size(); i++) {
            byte[] decodedImgSrc = fileService.decodeBase64(imgSrcList.get(i));
            String src = fileService.writeImgFile(decodedImgSrc,path + new SimpleDateFormat("yyyyMMddhhmmss").format(new Date()),
                    imgExtensionList.get(i));
            imgSrcDir.add(src);
        }

//        board.setImgSrcDir(imgSrcDir);

        result = boardDao.InsertOneBoard(board, member);

        if (!result) {
            new File(path).delete();
        }


        return result;
    }
}
