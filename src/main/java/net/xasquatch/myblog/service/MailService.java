package net.xasquatch.myblog.service;

import net.xasquatch.myblog.model.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.UnsupportedEncodingException;

@Service
public class MailService {

    @Resource(name = "sessionMember")
    private Member sessionMember;

    @Autowired
    private JavaMailSenderImpl mailSender;

    private String mainContents;
    private String token;

    public String createToken(int size) {
        StringBuilder result = new StringBuilder();
        for (int i = 0; i < size; i++) {
            long j = Math.round(Math.random() * 10);
            if (!(j >= 10)) result.append(j);
        }
        this.token = result.toString();
        return result.toString();
    }

    public String createMainContents(String tbody1tr, String tbody2tr, String tfoot1tr) {
        this.mainContents = "<fieldset style=\"border: 1px solid; width: 500px; margin: 0 auto;\">" +
                "<table>" +
                "    <thead>" +
                "    <tr>" +
                "        <th colspan=\"2\">" +
                "            <h1>" +
                "                <img src=\"https://myblog.xasquatch.net/img/Xasquatch.png\" style=\"border: 0px; width: 2rem; height: 2rem;\">" +
                "                My Blog By Xasquatch" +
                "            </h1>" +
                "        </th>" +
                "    </tr>" +
                "    </thead>" +
                "    <tbody style=\"text-align: center;\">" +
                "    <tr>" +
                "        <td style=\"width: 300px;\">" + tbody1tr + "</td>" +
                "        <td rowspan=\"2\">" +
                "            <img src=\"https://myblog.xasquatch.net/img/banner/16.gif\" style=\"width: 100%;\">" +
                "        </td>" +
                "    </tr>" +
                "    <tr>" +
                "        <td>" + tbody2tr +
                "        </td>" +
                "    </tr>" +
                "    </tbody>" +
                "    <tfoot>" +
                "        <tr>" +
                "            <td colspan=\"2\" style=\"text-align: center;\">" + tfoot1tr +
                "            </td>" +
                "        </tr>" +
                "    </tfoot>" +
                "</table>" +
                "</fieldset>";
        return this.mainContents;
    }

    public void sendAuthMail(String email, String title) {

        String token = createToken(6);
        String mainContents = null;
        MimeMessage mail = mailSender.createMimeMessage();

        sessionMember.setAuthKey(token);
        try {
            if (this.mainContents.contains("Token Number")) {
                mainContents = createMainContents(sessionMember.getName() + "님<BR>My Blog By Xasquatch에<BR>오신것을 환영합니다.",
                        "            Token Number: " + token,
                        "<a href=\"https://myblog.xasquatch.net/members/" + sessionMember.getNo() + "/check-email\" style=\"text-decoration: none; color: darkred; font-weight: bold;\">이메일 다시 인증하러가기</a>");

            } else {
                mainContents = this.mainContents;

            }
        } catch (NullPointerException e) {
            mainContents = createMainContents(sessionMember.getName() + "님<BR>My Blog By Xasquatch에<BR>오신것을 환영합니다.",
                    "            Token Number: " + token,
                    "<a href=\"https://myblog.xasquatch.net/members/" + sessionMember.getNo() + "/check-email\" style=\"text-decoration: none; color: darkred; font-weight: bold;\">이메일 다시 인증하러가기</a>");

        }

        MimeMessageHelper messageHelper = null;
        try {
            messageHelper = new MimeMessageHelper(mail, true, "UTF-8");
            messageHelper.setTo(new InternetAddress(email));
            messageHelper.setText(mainContents, true);
            messageHelper.setFrom(new InternetAddress("xasquatch.myblog@gmail.com", "My BLog"));
            messageHelper.setSubject(title);
        } catch (MessagingException | UnsupportedEncodingException e) {
            e.printStackTrace();
        }


        mailSender.send(mail);

    }


}
