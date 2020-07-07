package kr.ac.knou.service.user;

import java.util.List;

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
    
    @Override
    public List<User> selectUsers(String field, String query, int page) throws Exception
    {
        return userDao.selectUsers(field, query, page);
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
       
       return userDao.updateUserAuthStatus(id);
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
}
