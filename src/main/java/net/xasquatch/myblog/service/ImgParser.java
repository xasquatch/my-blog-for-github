package net.xasquatch.myblog.service;

import lombok.Getter;
import lombok.Setter;

import java.io.*;
import java.nio.Buffer;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

@Getter
@Setter
public class ImgParser {


    private static ImgParser imgParser = null;
    private String contentsString;
    private List<String> imgSrcList = new ArrayList<String>();
    private List<String> imgExtensionList = new ArrayList<String>();

    private ImgParser() {
    }

    private ImgParser(String contentsString) {
        this.contentsString = contentsString;
    }

    public static ImgParser getImgParser(String contentsString) {
        if (ImgParser.imgParser == null) {
            ImgParser.imgParser = new ImgParser(contentsString);

        } else {
            ImgParser.imgParser.setContentsString(contentsString);

        }

        return ImgParser.imgParser;
    }

    private void writeImgFile(String imgString, String savePath, String saveFileName, String fileExtension) {
        String filePath = savePath + File.separator + saveFileName.concat(".").concat(fileExtension);

        try (BufferedOutputStream bytebuffer = new BufferedOutputStream(new FileOutputStream(filePath));) {
            byte[] decodedData = decodeBase64(imgString);

            bytebuffer.write(decodedData);

        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private byte[] decodeBase64(String imgString) {
        byte[] contentData = imgString.getBytes();
        return Base64.getDecoder().decode(contentData);
    }

    public String cutImgSrc() {

        if (!checkImgTag()) return contentsString;

        String imgExtension;
        String srcString;

        String contentsString = this.contentsString;
        int prefix = contentsString.indexOf("<img");
        String cutString = contentsString.substring(prefix);

        //---------------------------
        int dataImageStringStartIndex = cutString.indexOf("data:image/");
        int dataImageStringEndIndex = cutString.indexOf(";base64,");

        if (dataImageStringStartIndex == -1) return "no Image";

        //TODO:확장자
        imgExtension = cutString.substring(dataImageStringStartIndex + 11, dataImageStringEndIndex);

        //---------------------------
        int srcStringStartIndex = cutString.indexOf(";base64,");
        int srcStringEndIndex = cutString.indexOf("\">");

        //TODO: 이미지 src data url
        srcString = cutString.substring(srcStringStartIndex + 8, srcStringEndIndex);

        this.imgExtensionList.add(imgExtension);
        this.imgSrcList.add(srcString);


        return srcString;
    }

    public boolean checkImgTag() {

        boolean result = false;
        if (this.contentsString.contains("<img")) {
            result = true;
        }

        return result;
    }


}
