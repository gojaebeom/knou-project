package kr.ac.knou.util;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class EmailAuth
{
    public static String SendEmailAndRetrunAuthKey(JavaMailSender mailSender, String sendUser)
    {
        TempKey tempKey = new TempKey();
        String authKey = tempKey.getKey(50, false);
        
        String setFrom = "knou";
        String toMail = sendUser;
        String title = "회원가입 인증 메일 입니다!";
        String content = 
        String.format("해당<a href='http://localhost:8080/users/confirm?email=%s&key=%s'>링크</a> 를 클릭하시면 회원가입이 완료됩니다.",
                                       toMail, authKey);
        try
        {
            MimeMessage message =  mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
            messageHelper.setFrom(setFrom); // 보내는사람 생략하면 정상작동을 안함
            messageHelper.setTo(toMail);    // 받는사람 이메일
            messageHelper.setSubject(title);// 메일제목은 생략이 가능하다
            messageHelper.setText(content, true); // 메일 내용
            mailSender.send(message);
        }
        catch (MessagingException e)
        {
            e.printStackTrace();
        } 
        
        return authKey;
    }
}
