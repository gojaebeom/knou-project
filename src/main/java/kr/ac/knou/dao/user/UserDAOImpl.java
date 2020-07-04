package kr.ac.knou.dao.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.knou.dao.board.BoardDAOImpl;
import kr.ac.knou.dto.user.User;

@Repository
public class UserDAOImpl implements UserDAO
{
    @Autowired
    private SqlSession sqlSession;
    
    private static final Log LOG = LogFactory.getLog(BoardDAOImpl.class);

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

    @Override
    public List<User> getReadUsers(String field, String query, int page)
            throws Exception
    {
        Map<String, Object> map = new HashMap<>();
        map.put("field", field);
        map.put("query", "%"+query+"%");
        map.put("page", (page-1)*20);
        
        LOG.info(map.get("page"));
        return sqlSession.selectList("user.readUsers", map);
    }
    
}
