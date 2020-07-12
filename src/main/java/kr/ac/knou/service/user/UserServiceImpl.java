package kr.ac.knou.service.user;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import kr.ac.knou.dao.user.UserDAO;
import kr.ac.knou.dto.board.Board;
import kr.ac.knou.dto.user.User;
import kr.ac.knou.service.board.BoardService;
import kr.ac.knou.util.EmailAuth;

@Service
public class UserServiceImpl implements UserService
{
    @Autowired
    private JavaMailSender mailSender;   
    
    @Autowired
    private UserDAO userDao;
    
    @Autowired
    private BoardService boardService;
    
    private static final Log LOG = LogFactory.getLog(UserServiceImpl.class);
    
    @Override
    public List<User> selectUsers(String query, int page) throws Exception
    {
        return userDao.selectUsers(query, page);
    }
    
    @Override
    public int selectUserCount(String query) throws Exception
    {
        return userDao.selectUserCount(query);
    } 
    
    @Override
    public User selectUserForId(int id) throws Exception
    {
        return userDao.selectUserForId(id);
    }
    
    @Override
    public User selectUserForEmail(User user) throws Exception
    {
        return userDao.selectUserForEmail(user);
    }

    @Override
    public int selectUserIdForEmail(String email) throws Exception
    {
        return userDao.selectUserIdForEmail(email);
    }

    @Override
    public int selectUserIdForNickname(String nickname) throws Exception
    {
        return userDao.selectUserIdForNickname(nickname);
    }
    
    @Override
    public void insertUserAndSendEmail(User user) throws Exception
    {
       //이메일을 보내는 클래스를 별도로 만들어 보내는 것을 위임하고 생성된 난수키를 리턴받음
       String authKey =EmailAuth.SendEmailAndRetrunAuthKey(mailSender, user.getEmail());
       
       //회원dto에 난수키를 저장하고 회원을 생성하기
       user.setAuthKey(authKey);
       userDao.insertUser(user);     
    }
    
    @Override
    public int updateUserAuthStatusForCertifiedId(String email, String key) throws Exception
    {
       int id = userDao.selectUserCertifiedId(email, key);
       
       if(id == 0) return 0;
       
       userDao.updateUserAuthStatus(id);
       
       return id;
    }

    @Override
    public int updateUser(User user) throws Exception
    {
        return userDao.updateUser(user);
    }
    
    @Override
    public int updateUserImage(User user) throws Exception
    {
        return userDao.updateUserImage(user);
    }

    @Override
    public int deleteUser(int id) throws Exception
    {   
        List<Board> boardList = boardService.selectBoardsForUserId(id);
        for(Board board: boardList)
        {
            boardService.deleteBoard(board.getId());
        }
        
        return userDao.deleteUser(id);
    }

    @Override
    public int forgetPassword(String email) throws Exception
    {
        // TODO 비밀번호 초기화를 위한 메일 발송
        
        /**
         * - 이메일을 보낼때 새로 발급받은 인증키를 보낸다.
         * - 동시에 유저 db에도 발급받은 인증키로 업데이트 해주어야함
         * - 업데이트를 위해 해당 이메일에 대한 id를 찾는다.
         * - 해당 id에 발급받은 인증키로 업데이트
         */
        
        
        String authKey = EmailAuth.SendEmailRemakePassword(mailSender, email);
        
        int id = userDao.selectUserIdForEmail(email);
        
        User user = new User();
        user.setId(id);
        user.setAuthKey(authKey);
        
        LOG.info("인증키 업데이트할 유저 값 : "+ user.toString());
        
        int result = userDao.updateUserAuthKey(user);
        
        LOG.info("인증키 업데이트 성공여부 :" + result);
        
        
        return 0;
    }
    
    @Override
    public int updateUserPassword(User user) throws Exception
    {
        return userDao.updateUserPassword(user);
    }

    

    
}
