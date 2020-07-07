package kr.ac.knou.dao.comment;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.knou.dto.comment.Comment;

@Repository
public class CommentDAOImpl implements CommentDAO
{
    @Autowired
    private SqlSession sqlSession;
    
    private static final Log LOG = LogFactory.getLog(CommentDAOImpl.class);
    
    @Override
    public List<Comment> selectComments(int boardId) throws Exception
    {
        // TODO Auto-generated method stub
        List<Comment> commentList = sqlSession.selectList("comment.selectComments",boardId);
        
        for(Comment comment :commentList) 
        {
            System.out.println(comment.toString());
        }
        
        return commentList;
    }   
    
    @Override
    public List<Comment> selectBoardsForWriterId(int id)
    {
        List<Comment> commentList = sqlSession.selectList("comment.selectBoardsForWriterId", id);
        for(Comment comm : commentList)
        {
            LOG.info("보드리스트" + comm.getBoard().toString());
        }
        
        return commentList;
    }
    
    @Override
    public int selectBoardCountForWriterId(int id) throws Exception
    {
        return sqlSession.selectOne("comment.selectBoardCountForWriterId", id);
    }
    
    @Override
    public int insertComment(Comment comment) throws Exception
    {       
        return sqlSession.insert("comment.insertComment", comment);
    }

    @Override
    public int deleteComment(int id) throws Exception
    {
        return sqlSession.delete("comment.deleteComment", id);
    }

   

   
}
