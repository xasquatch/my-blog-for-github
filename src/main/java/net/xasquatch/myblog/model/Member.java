package net.xasquatch.myblog.model;

import lombok.*;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.io.Serializable;

@Builder
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Member implements Serializable {

    private static final long serialVersionUID = 6319981641880667305L;

    private Long no;

    private String rank;

    @NotNull
    @Size(min = 10, max = 50)
    @Pattern(regexp = "^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}")
    private String email;

    @NotNull
    @Size(min = 8, max = 20)
    @Pattern(regexp = "^[A-Za-z0-9]{8,20}")
    private String pwd;

    @NotNull
    @Size(min = 3, max = 20)
    @Pattern(regexp = "^[A-Za-z0-9가-힣 ]{3,50}")
    private String name;

    private String img;
    private String imgFile;

    @NotNull
    private boolean membersAgreement;

    @NotNull
    private boolean collectionAndUse;

    private boolean checkSession;
    private boolean loginOAuth;

    private String authKey;
}
