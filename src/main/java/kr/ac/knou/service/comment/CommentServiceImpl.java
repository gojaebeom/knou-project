package kr.ac.knou.service.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.knou.dao.comment.CommentDAO;
import kr.ac.knou.dto.comment.Comment;
import kr.ac.knou.service.board.BoardService;
@Service
public class CommentServiceImpl implements CommentService
{
    
    @Autowired
    CommentDAO commentDAO;
    
    @Autowired
    BoardService boardService;
    
    @Override
    public List<Comment> selectComments(int boardId) throws Exception
    {
        // TODO Auto-generated method stub
        return commentDAO.selectComments(boardId);
    }
    
    @Override
    public List<Comment> selectBoardsForWriterId(int id) throws Exception
    {
        // TODO Auto-generated method stub
        return commentDAO.selectBoardsForWriterId(id);
    }  
    
    @Override
    public int selectBoardCountForWriterId(int id) throws Exception
    {
        // TODO Auto-generated method stub
        return commentDAO.selectBoardCountForWriterId(id);
    }
    
    @Override
    public int insertCommentAndUpdateBoardCommentCnt(Comment comment) throws Exception
    {
        //먼저 댓글 생성
        commentDAO.insertComment(comment);
        // 이후 생성된 댓글의 boardId 를 통해 board 테이블의 댓글 수 업데이트
        return  boardService.updateBoardCommentCnt(comment.getBoardId());
    }

    @Override
    public int deleteComment(int id) throws Exception
    {
        return commentDAO.deleteComment(id);
    }

    

    
}
