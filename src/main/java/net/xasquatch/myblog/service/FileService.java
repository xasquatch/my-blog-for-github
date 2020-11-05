package net.xasquatch.myblog.service;

import lombok.Getter;
import lombok.Setter;
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
@Getter
@Setter
public class FileService {

    @Value("${files.save.path}")
    private String filesSavePath;
    private String addSavePath;

    public byte[] decodeBase64(String imgString) {
        byte[] contentData = imgString.getBytes();
        return Base64.getDecoder().decode(contentData);
    }

    public String writeImgFile(byte[] imgByteArray, String path, String saveFileName, String fileExtension) {
        this.addSavePath = path;
        File filedir = new File(this.filesSavePath + this.addSavePath);
        String filePath = this.filesSavePath + this.addSavePath + File.separator + saveFileName.concat(".").concat(fileExtension);
        filedir.mkdirs();

        try (BufferedOutputStream bytebuffer = new BufferedOutputStream(new FileOutputStream(filePath));) {

            bytebuffer.write(imgByteArray);

        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }

        return filePath.toString();

    }

    public void removeFiles() {
        File f = new File(this.filesSavePath + this.addSavePath);

        if (f.exists() && f.isDirectory()) {
            File[] files = f.listFiles();

            for (File fs : files) {
                fs.delete();
            }

        }
    }

}
