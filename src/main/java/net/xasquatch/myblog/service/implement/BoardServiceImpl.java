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

        board.setMbr_no(member.getNo());
        result = boardDao.insertOneBoard(board);

        //TODO: 썸네일 파일 생성 후 빈에 등록

        if (ImgParser.checkImgTag(board.getThumbnailSrcDir())) {
            ImgParser imgThumbnailParser = ImgParser.getImgParser(board.getThumbnailSrcDir());

            while (imgThumbnailParser.isCuttableImgSrc()) {
                imgThumbnailParser.addImgList();

            }

            List<String> imgThumbnailSrcList = imgThumbnailParser.getImgSrcList();
            List<String> imgThumbnailExtensionList = imgThumbnailParser.getImgExtensionList();

            String path = File.separator + member.getNo() + File.separator + board.getNo() + "-" + board.getTitle();
            for (int i = 0; i < imgThumbnailSrcList.size(); i++) {
                byte[] decodedImgSrc = fileService.decodeBase64(imgThumbnailSrcList.get(i));
                String src = fileService.writeImgFile(decodedImgSrc, path, "thumbnail",
                        imgThumbnailExtensionList.get(i));
                board.setThumbnailSrcDir(src);
            }
            result = boardDao.updateThumbnailImg(board);

        }


/*TODO:--------------------------------------------------------*/


        //TODO: 다량의 이미지 파일 생성 후 리스트에 등록
        if (ImgParser.checkImgTag(board.getContents())) {
            ImgParser imgParser = ImgParser.getImgParser(board.getThumbnailSrcDir());

            while (imgParser.isCuttableImgSrc()) {
                imgParser.addImgList();

            }

            List<String> imgSrcList = imgParser.getImgSrcList();
            List<String> imgExtensionList = imgParser.getImgExtensionList();
            List<ImgRepository> imgBeanList = new ArrayList<ImgRepository>();

            String imgPath = File.separator + member.getNo() + File.separator + board.getNo() + "-" + board.getTitle();
            for (int i = 0; i < imgSrcList.size(); i++) {
                ImgRepository imgRepository = new ImgRepository();
                imgRepository.setBoard_no(board.getNo());
                imgRepository.setName(String.valueOf(i));

                byte[] decodedImgSrc = fileService.decodeBase64(imgSrcList.get(i));
                String src = fileService.writeImgFile(decodedImgSrc, imgPath, imgRepository.getName(),
                        imgExtensionList.get(i));

                imgRepository.setDirectory(src);

                imgBeanList.add(imgRepository);

            }

            result = boardDao.insertImgRepository(imgBeanList);

        }

        return result;
    }
}
