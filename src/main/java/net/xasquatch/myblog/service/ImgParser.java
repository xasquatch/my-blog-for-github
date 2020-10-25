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


    public static void main(String[] args) throws IOException {

        String testString = "<img src=\"data:image/png;base64,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\">";
        ImgParser imgParser = ImgParser.getImgParser(testString);
        String imgString = imgParser.cutImgSrc();
        writeImgFile(imgString, "D:\\0_workspace", "hi", "png");
    }

    private static void writeImgFile(String imgString, String savePath, String saveFileName, String fileExtension) {
        String filePath = savePath + File.separator + saveFileName.concat(".").concat(fileExtension);

        try (BufferedOutputStream bytebuffer = new BufferedOutputStream(new FileOutputStream(filePath));){
            byte[] decodedData = decodeBase64(imgString);

            bytebuffer.write(decodedData);

        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private static byte[] decodeBase64(String imgString) {
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
