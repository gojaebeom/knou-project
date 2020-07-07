package kr.ac.knou.dao.comment;

import java.util.List;

import kr.ac.knou.dto.comment.Comment;

public interface CommentDAO
{
    public List<Comment> selectComments(int boardId) throws Exception;
    
    public int selectBoardCountForWriterId(int id) throws Exception;
    
    public int insertComment(Comment comment) throws Exception;
    
    public int deleteComment(int id) throws Exception;

    public List<Comment> selectBoardsForWriterId(int id) throws Exception;

    public int updateComment(Comment comment) throws Exception;

    
}
