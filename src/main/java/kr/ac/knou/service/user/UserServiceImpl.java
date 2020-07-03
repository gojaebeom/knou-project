package kr.ac.knou.service.user;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import kr.ac.knou.dao.user.UserDAO;
import kr.ac.knou.dto.user.TempKey;
import kr.ac.knou.dto.user.User;

@Service
public class UserServiceImpl implements UserService
{
    @Autowired
    private JavaMailSender mailSender;   
    
    @Autowired
    private UserDAO userDao;

    @Override
    public int getEmailCheck(String email) throws Exception
    {
        return userDao.getEmailCheck(email);
    }

    @Override
    public int getNicknameCheck(String nickname) throws Exception
    {
        return userDao.getNicknameCheck(nickname);
    }

    @Override
    public void signUp(User user) throws Exception
    {
       
       TempKey tempKey = new TempKey();
       String authKey = tempKey.getKey(50, false);
       
       user.setAuthKey(authKey);
       //insert 이후 해당 컬럼의 id 값을 반환
       userDao.signUp(user);
       
       String setFrom = "qa-site";
       String toMail = user.getEmail();
       String title = "회원가입 인증 메일 입니다!";
       String content = 
       String.format("해당<a href='http://localhost:8080/confirm?email=%s&key=%s'>링크</a> 를 클릭하시면 회원가입이 완료됩니다.",
                                      user.getEmail(), authKey);
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
        
    }

    @Override
    public int getEmailConfirm(String email, String key) throws Exception
    {
       int id = userDao.getEmailConfirm(email, key);
       if(id == 0)
           return 0;
       
       return userDao.getAuthStatusUpdate(id);
    }

    @Override
    public User signIn(User user) throws Exception
    {
        return userDao.signIn(user);
    }

    @Override
    public User getFindById(int id) throws Exception
    {
        return userDao.getFindById(id);
    }

    @Override
    public int getUserEdit(User user) throws Exception
    {
        return userDao.getUserEdit(user);
    }
    
}
