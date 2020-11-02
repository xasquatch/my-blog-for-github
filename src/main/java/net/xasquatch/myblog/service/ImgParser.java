package net.xasquatch.myblog.service;

import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
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

//---------------------------------------------------------------------//

    public boolean isCuttableImgSrc() {

        if (!checkImgTag()) return false;

        String contentsString = this.contentsString;
        int prefix = contentsString.indexOf("<img");
        String cutString = contentsString.substring(prefix);

        //---------------------------
        int dataImageStringStartIndex = cutString.indexOf("data:image/");
        int dataImageStringEndIndex = cutString.indexOf(";base64,");
        int srcStringEndIndex = cutString.indexOf("\">");

        return dataImageStringStartIndex != -1 && dataImageStringEndIndex != -1 && srcStringEndIndex != -1;
    }

    public void addImgList() {
        String imgExtension;
        String srcString;

        String contentsString = this.contentsString;
        int prefix = contentsString.indexOf("<img");
        String cutString = contentsString.substring(prefix);

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

        this.contentsString = contentsString.substring(cutString.length());

    }

    private boolean checkImgTag() {

        boolean result = false;
        if (this.contentsString.contains("<img")) {
            result = true;
        }

        return result;
    }


}
