package kr.ac.knou.dao.user;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.knou.dto.user.User;

@Repository
public class UserDAOImpl implements UserDAO
{
    @Autowired
    SqlSession sqlSession;

    @Override
    public int getEmailCheck(String email)
    {
        return sqlSession.selectOne("user.emailCheck", email);
    }

    @Override
    public int getNicknameCheck(String nickname)
    {
        return sqlSession.selectOne("user.nicknameCheck", nickname);
    }

    @Override
    public int signUp(User user)
    {
       return sqlSession.insert("user.signUp", user);
    }

    @Override
    public int getEmailConfirm(String email, String key)
    {
        Map<String, String> map = new HashMap<String, String>();
        
        map.put("email", email);
        map.put("authKey", key);
        int check = sqlSession.selectOne("user.emailConfirm", map);
        if(check == 0)
            return 0;
        
        int id = sqlSession.selectOne("user.emailConfirmResult", map);
        
        return id;
    }

    @Override
    public int getAuthStatusUpdate(int id)
    {
        return sqlSession.update("user.authStatusUpdate", id);
    }

    @Override
    public User signIn(User user)
    {       
        return sqlSession.selectOne("user.signIn", user);
    }

    @Override
    public User getFindById(int id)
    {
        return sqlSession.selectOne("user.findById", id);
    }

    @Override
    public int getUserEdit(User user)
    {
        return sqlSession.update("user.userEdit", user);
    }
    
}
