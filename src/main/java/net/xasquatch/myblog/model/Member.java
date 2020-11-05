package net.xasquatch.myblog.model;

import lombok.*;
import org.springframework.stereotype.Component;

import javax.validation.constraints.AssertTrue;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Builder
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Component
public class Member {

    @NotNull
    @Size(min = 10, max = 40)
    @Pattern(regexp = "^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}")
    private String email;

    @NotNull
    @Size(min = 8, max = 20)
    @Pattern(regexp = "^[A-Za-z0-9]{8,20}")
    private String pwd;

    @NotNull
    @Size(min = 3, max = 20)
    @Pattern(regexp = "^[A-Za-z0-9가-힣]{3,20}")
    private String name;

    private String img;
    private String imgFile;

    @NotNull
    private boolean membersAgreement;

    @NotNull
    private boolean collectionAndUse;
}
