package net.xasquatch.myblog.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;

@PropertySource("/WEB-INF/properties/file/FileManager.properties")
public class FileService {

    @Value("files.save.path")
    String filesSavePath;



}
