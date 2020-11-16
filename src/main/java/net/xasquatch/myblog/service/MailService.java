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

    public String createSessionToken(int size) {
        StringBuilder result = new StringBuilder();
        for (int i = 0; i < 6; i++) {
            long j = Math.round(Math.random() * 10);
            if (!(j >= 10)) result.append(j);
        }
        return result.toString();
    }
    
    public void sendAuthMail(String email) {

        String token = createSessionToken(6);

        MimeMessage mail = mailSender.createMimeMessage();

        sessionMember.setAuthKey(token);
        String mainContents = "<table style=\"width: 500px; margin: 0 auto;\">" +
                "    <thead>" +
                "    <tr>" +
                "        <th colspan=\"2\">" +
                "            <h1>" +
                "                <img src=\"http://myblog.xasquatch.net/img/Xasquatch.png\" style=\"width: 2rem; height: 2rem;\">" +
                "                My Blog By Xasquatch" +
                "            </h1>" +
                "        </th>" +
                "    </tr>" +
                "    </thead>" +
                "    <tbody>" +
                "    <tr>" +
                "        <td style=\"width: 300px;\">" + sessionMember.getName() + "님 My Blog By Xasquatch에 오신것을 환영합니다.</td>" +
                "        <td rowspan=\"2\">" +
                "            <img src=\"http://myblog.xasquatch.net/img/banner/16.gif\" style=\"width: 100%;\">" +
                "        </td>" +
                "    </tr>" +
                "    <tr>" +
                "        <td>" +
                "            Token Number: " + token +
                "        </td>" +
                "    </tr>" +
                "    </tbody>" +
                "    <tfoot>" +
                "        <tr>" +
                "            <td colspan=\"2\" style=\"text-align: center;\">" +
                "                <a href=\"http://myblog.xasquatch.net/user/" + sessionMember.getNo() + "/check-email\" style=\"text-decoration: none; color: darkred; font-weight: bold;\">이메일 인증하러가기</a>" +
                "            </td>" +
                "        </tr>" +
                "    </tfoot>" +
                "</table>";

        MimeMessageHelper messageHelper = null;
        try {
            messageHelper = new MimeMessageHelper(mail, true, "UTF-8");
            messageHelper.setTo(new InternetAddress(email));
            messageHelper.setText(mainContents, true);
            messageHelper.setFrom(new InternetAddress("xasquatch.myblog@gmail.com", "My BLog"));
            messageHelper.setSubject("[My Blog By Xasquatch]이메일 인증 요청");
        } catch (MessagingException | UnsupportedEncodingException e) {
            e.printStackTrace();
        }


        mailSender.send(mail);

    }

}
