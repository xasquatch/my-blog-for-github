package net.xasquatch.myblog.service;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class ImgParser {


    private static ImgParser imgParser = null;
    private String contentsString;
    private List<String> imgSrcList;
    private List<String> imgExtensionList;

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

    public String cutImgSrc() {

        if (!checkImgTag()) return contentsString;

        String imgExtension;
        String srcString;

        String contentsString = this.contentsString;
        int prefix = contentsString.indexOf("<img ");
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

        this.imgExtensionList.add(srcString);
        this.imgSrcList.add(srcString);




        return ;
    }

    public boolean checkImgTag() {

        boolean result = false;
        if (this.contentsString.contains("<img")){
            result = true;
        }

        return result;
    }


}
