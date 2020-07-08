package kr.ac.knou.service.board;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.knou.dao.board.BoardDAO;
import kr.ac.knou.dao.board.BoardDAOImpl;
import kr.ac.knou.dto.board.Board;
import kr.ac.knou.dto.comment.Comment;
import kr.ac.knou.dto.like.Like;
import kr.ac.knou.dto.tag.Tag;
import kr.ac.knou.service.comment.CommentService;
import kr.ac.knou.service.like.LikeService;
import kr.ac.knou.service.tag.TagService;

@Service
public class BoardServiceImpl implements BoardService
{
    @Autowired
    private BoardDAO boardDAO;
    
    @Autowired
    private TagService tagService;
    
    @Autowired
    private CommentService commentService;
    
    @Autowired
    private LikeService likeService;
    
    private static final Log LOG = LogFactory.getLog(BoardDAOImpl.class);

    @Override
    public List<Board> selectBoards() throws Exception
    {        
        return selectBoards("title","",1);
    }

    @Override
    public List<Board> selectBoards(String field, String query, int page) throws Exception
    {
        List<Board> boardList = boardDAO.selectBoards(field, query, page);
        
        List<Board> boardListAddTag = new ArrayList<>();
        
        for(Board board : boardList)
        {            
            List<Tag> tagList = tagService.selectTagsForBoardId(board.getId());
            
            board.setTagList(tagList);

            boardListAddTag.add(board);
        }
        
        return boardListAddTag;
    }
    
    @Override
    public List<Board> selectBoardsForUserId(int userId) throws Exception
    {
        return boardDAO.selectBoardsForUserId(userId);
    }  
    
    @Override
    public List<Board> selectBoardsForUserId(int userId, int page) throws Exception
    {
        return boardDAO.selectBoardsForUserId(userId, page);
    }

    @Override
    public int selectBoardCount(String field, String query) throws Exception
    {
        return boardDAO.selectBoardCount(field, query);
    }
    
    @Override
    public int selectBoardCountForUserId(int id) throws Exception
    {
        return boardDAO.selectBoardCountForUserId(id);
    }


    @Override
    public Board selectBoardForId(int id) throws Exception
    {
         Board board = boardDAO.selectBoardForId(id);
         
         List<Tag> tagList = tagService.selectTagsForBoardId(board.getId());
         
         board.setTagList(tagList);
         
         return board;
    }
    
    @Override
    public int insertBoard(Board board) throws Exception
    {
        int result = boardDAO.insertBoard(board);
        
        return (result != 0)? boardDAO.selectLastInsertId() : 0;
    }

    @Override
    public void updateBoardHit(int id) throws Exception
    {
        boardDAO.updateBoardHit(id);
    }
    
    @Override
    public int updateBoardCommentCnt(int id) throws Exception
    {
        return boardDAO.updateBoardCommentCnt(id);
    }
    
    @Override
    public int updateBoardLikeCnt(int id) throws Exception
    {
         boardDAO.updateBoardLikeCnt(id);
         
         Board board = boardDAO.selectBoardForId(id);
         
         return board.getLikeCnt();
    }

    @Override
    public int updateBoard(Board board) throws Exception
    {
        return boardDAO.updateBoard(board);
    }

    @Override
    public int deleteBoard(int id) throws Exception
    {
        LOG.info("게시물 아이디"+id);
        
        //게시물과 관련된 댓글들 삭제
        List<Comment> commentList =  commentService.selectComments(id);
        
        for(Comment comment : commentList)
        {
            LOG.info("삭제할 코맨트 아이디 : "+comment.getId());
            commentService.deleteComment(comment);
        }
        
        //게시물과 관련된 태그들 삭제
        List<Tag> tagList = tagService.selectTagsForBoardId(id);
        
        for(Tag tag : tagList)
        {
            tagService.deleteTag(tag.getId());
        }
        
        //게시물과 관련된 like들 삭제
        List<Like> likeList = likeService.selectLikesForBoardId(id);
        
        for(Like like : likeList)
        {
            likeService.deleteLike(like.getId());
        }
        
        //그 후 게시물 삭제
        return boardDAO.deleteBoard(id);
    }

   

    

    
}
