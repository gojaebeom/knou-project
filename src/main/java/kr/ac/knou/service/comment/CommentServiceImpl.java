package kr.ac.knou.service.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.knou.dao.comment.CommentDAO;
import kr.ac.knou.dto.comment.Comment;
@Service
public class CommentServiceImpl implements CommentService
{
    
    @Autowired
    CommentDAO commentDAO;
    
    @Override
    public int getCreateComment(Comment comment) throws Exception
    {
        
        return commentDAO.getCreateComment(comment);
    }
    
    @Override
    public int getUpdateComment(int boardId) throws Exception
    {
        // TODO Auto-generated method stub
        return commentDAO.getUpdateComment(boardId);
    }
    
    @Override
    public List<Comment> getReadCommentList(int boardId) throws Exception
    {
        // TODO Auto-generated method stub
        return commentDAO.getReadCommentList(boardId);
    }

    
    
}
