package net.xasquatch.myblog.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

@Service
@PropertySource("/WEB-INF/properties/file-manager.properties")
public class ImgService {

    @Autowired
    private FileService fileService;

    @Value("${files.save.directory.blog}")
    String SaveDir;

    @Value("${files.save.contents.name.blog}")
    String ContentsName;

    public List<String> uploadImage(MultipartHttpServletRequest request, String memberNo, String boardNo) {
        List<String> resultImgList = new ArrayList<String>();

        List<MultipartFile> multipartFiles = request.getFiles("imgPackage");

        for (MultipartFile multipartFile : multipartFiles) {
            if (multipartFile != null) {

                try {
                    ImgRepository imgRepository = ImgRepository.getInstance();

                    imgRepository.setBoard_no(Long.valueOf(boardNo));

                    String targetName = multipartFile.getOriginalFilename();
                    imgRepository.setName(targetName);

                    String filePath = File.separator + memberNo + SaveDir + File.separator + boardNo;
                    String contextPath = fileService.writeFile(multipartFile.getBytes(), filePath, targetName);
                    imgRepository.setDirectory(contextPath);
                    resultImgList.add(contextPath);
                } catch (Exception e) {
                    e.printStackTrace();
                }


            }
        }


        return resultImgList;
    }

}
