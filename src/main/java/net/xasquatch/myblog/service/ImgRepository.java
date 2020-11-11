package net.xasquatch.myblog.service;

import lombok.*;

@Setter
@Getter
public class ImgRepository {

    private static ImgRepository imgRepository = null;
    private Long no;
    private Long board_no;
    private String name;
    private String directory;

    private ImgRepository(){}

    public static ImgRepository getInstance(){

        if (ImgRepository.imgRepository == null){
            imgRepository = new ImgRepository();
        }
            return imgRepository;
    }

}
