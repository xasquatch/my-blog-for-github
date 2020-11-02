package net.xasquatch.myblog.service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Base64;

@Component
@Slf4j
@PropertySource("/WEB-INF/properties/file/FileManager.properties")
public class FileService {

    @Value("${files.save.path}")
    private String filesSavePath;

    public byte[] decodeBase64(String imgString) {
        byte[] contentData = imgString.getBytes();
        return Base64.getDecoder().decode(contentData);
    }

    public String writeImgFile(byte[] imgByteArray, String saveFileName, String fileExtension) {
        String filePath = this.filesSavePath + File.separator + saveFileName.concat(".").concat(fileExtension);
        log.debug(saveFileName);
        try (BufferedOutputStream bytebuffer = new BufferedOutputStream(new FileOutputStream(filePath));) {

            bytebuffer.write(imgByteArray);

        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }

        return filePath;

    }


}
