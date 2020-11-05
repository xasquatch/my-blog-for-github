package net.xasquatch.myblog.service.implement;

import net.xasquatch.myblog.model.Board;
import net.xasquatch.myblog.model.ImgRepository;
import net.xasquatch.myblog.model.Member;
import net.xasquatch.myblog.repository.BoardDao;
import net.xasquatch.myblog.service.BoardService;
import net.xasquatch.myblog.service.FileService;
import net.xasquatch.myblog.service.ImgParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.text.SimpleDateFormat;
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
    public boolean update(Board board, Member member, ImgRepository imgRepository) {
        return false;
    }

    @Override
    public boolean delete(Board board, Member member) {
        return false;
    }

    @Override
    public boolean create(Board board, Member member, ImgRepository imgRepository) {
        boolean result = false;


        ImgParser imgParser = ImgParser.getImgParser(board.getThumbnailSrcDir());
        System.out.println(imgParser.getContentsString());

        while (imgParser.isCuttableImgSrc()) {
            imgParser.addImgList();

        }

        List<String> imgSrcList = imgParser.getImgSrcList();
        List<String> imgExtensionList = imgParser.getImgExtensionList();

        String path = File.separator + member.getNo() + File.separator + board.getNo() + File.separator + board.getTitle();
        for (int i = 0; i < imgSrcList.size(); i++) {
            byte[] decodedImgSrc = fileService.decodeBase64(imgSrcList.get(i));
            String src = fileService.writeImgFile(decodedImgSrc, path, new SimpleDateFormat("yyyyMMddhhmmss").format(new Date()),
                    imgExtensionList.get(i));
            board.setThumbnailSrcDir(src);
        }


        result = boardDao.InsertOneBoard(board, member);



        return result;
    }
}
