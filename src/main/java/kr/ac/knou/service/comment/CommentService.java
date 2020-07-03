package kr.ac.knou.service.comment;

import java.util.List;

import kr.ac.knou.dto.comment.Comment;

public interface CommentService
{
    public int getCreateComment(Comment comment) throws Exception;
    
    public int getUpdateComment(int boardId) throws Exception;
    
    public List<Comment> getReadCommentList(int boardId) throws Exception;

    
}
