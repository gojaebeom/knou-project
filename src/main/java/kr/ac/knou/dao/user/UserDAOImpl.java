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
    public List<User> selectUsers(String query, int page) throws Exception
    {
        Map<String, Object> map = new HashMap<>();
        map.put("query", "%"+query+"%");
        map.put("page", (page-1)*20);
        
        LOG.info(map.get("page"));
        return sqlSession.selectList("user.selectUsers", map);
    }
    
    @Override
    public int selectUserCount(String query) throws Exception
    {
        query = "%"+query+"%";
        return sqlSession.selectOne("user.selectUserCount", query);
    }
    
    @Override
    public User selectUserForId(int id)
    {
        return sqlSession.selectOne("user.selectUserForId", id);
    }
    
    @Override
    public User selectUserForEmail(User user)
    {       
        return sqlSession.selectOne("user.selectUserForEmail", user);
    }
    
    @Override
    public int selectUserIdForEmail(String email)
    {
        Integer id = sqlSession.selectOne("user.selectUserIdForEmail", email);
           
        return (id != null) ? id : 0;
    }

    @Override
    public int selectUserIdForNickname(String nickname)
    {
        Integer id = sqlSession.selectOne("user.selectUserIdForNickname", nickname);
        
        return (id != null) ? id : 0;
    }

    @Override
    public int selectUserCertifiedId(String email, String key)
    {
        Map<String, String> map = new HashMap<String, String>();     
        
        LOG.info(email+","+key);
        
        map.put("email", email);
        map.put("authKey", key);
        
        Integer id = sqlSession.selectOne("user.selectUserCertifiedId", map);
        
        LOG.info(id);
                
        return (id != null) ? id : 0;
    }
    
    @Override
    public int insertUser(User user)
    {
       return sqlSession.insert("user.insertUser", user);
    }

    @Override
    public int updateUserAuthStatus(int id)
    {
        int result = sqlSession.update("user.updateUserAuthStatus", id);
        
        LOG.info(result);
        
        return result;
    }

       @Override
    public int updateUser(User user)
    {
        return sqlSession.update("user.updateUser", user);
    }

    @Override
    public int updateUserImage(User user) throws Exception
    {
        return sqlSession.update("user.updateUserImage", user);
    }

    @Override
    public int deleteUser(int id) throws Exception
    {
        return sqlSession.delete("user.deleteUser", id);
    }

    
}
