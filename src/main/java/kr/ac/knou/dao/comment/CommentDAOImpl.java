package kr.ac.knou.dao.comment;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.knou.dto.comment.Comment;

@Repository
public class CommentDAOImpl implements CommentDAO
{
    @Autowired
    SqlSession sqlSession;
    
    @Override
    public int getCreateComment(Comment comment) throws Exception
    {       
        return sqlSession.insert("comment.createComment", comment);
    }
    
    @Override
    public int getUpdateComment(int boardId) throws Exception
    {
        // TODO Auto-generated method stub
        return sqlSession.update("comment.updateComment", boardId);
    }
    
    @Override
    public List<Comment> getReadCommentList(int boardId) throws Exception
    {
        // TODO Auto-generated method stub
        return sqlSession.selectList("comment.readCommentList",boardId);
    }   
}
