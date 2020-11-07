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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service
public class BoardServiceImpl implements BoardService {

    @Autowired
    private BoardDao boardDao;

    @Autowired
    private FileService fileService;

    @Override
    public HashMap<String, Object> viewDetail(Object boardKey) {

        return boardDao.selectOneBoard(boardKey);
    }

    @Override
    public boolean update(Object boardKey) {
        return false;
    }

    @Override
    public boolean delete(Object boardKey) {

        return boardDao.deleteOneBoard(boardKey);
    }

    @Override
    public boolean create(Board board, Member member) {
        boolean result = false;
        boolean[] step = new boolean[2];

        board.setMbr_no(member.getNo());
        result = boardDao.insertOneBoard(board);

        //TODO: 썸네일 파일 생성 후 빈에 등록
        if (ImgParser.checkImgTag(board.getThumbnailSrcDir())) {
            step[0] = true;

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
            step[1] = true;
            ImgParser imgParser = ImgParser.getImgParser(board.getContents());

            while (imgParser.isCuttableImgSrc()) {
                imgParser.addImgList();

            }
            board.setContents(imgParser.getContentsString());

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

            boardDao.updateContents(board);
            result = boardDao.insertImgRepository(imgBeanList);

        }else{
            result = boardDao.updateContents(board);

        }


        if (!result){
            boardDao.deleteOneBoard(board);
            if (step[0])
                fileService.removeFiles();
            if (step[1])
                boardDao.deleteImgRepository(board);

        }

        return result;
    }

    @Override
    public List<HashMap<String, Object>> getBoardList(Member member) {

        return boardDao.SelectBoardList(member);
    }
}
