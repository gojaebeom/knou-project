package kr.ac.knou.service.like;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.knou.dao.like.LikeDAO;
import kr.ac.knou.dto.like.Like;
import kr.ac.knou.service.board.BoardService;

@Service
public class LikeServiceImpl implements LikeService
{
    @Autowired
    private LikeDAO likeDAO;
    
    @Autowired
    private BoardService boardService;
    
    @Override
    public List<Like> selectLikesForBoardId(int boardId) throws Exception
    {
        return likeDAO.selectLikesForBoardId(boardId);
    }
    
    @Override
    public int selectIsLiked(Like like) throws Exception
    {
        int id = likeDAO.selectLikeIdForBoardIdAndUserId(like);
        
        if(id == 0)
            return 0;
        
        return likeDAO.selectIsLikedForId(id);
    }
    
    @Override
    public Map<String,Integer> likeCycle(Like like) throws Exception
    {
        int id = likeDAO.selectLikeIdForBoardIdAndUserId(like);
        
        Map<String, Integer> map = new HashMap<>();
        
        if(id == 0)
        {
            likeDAO.insertLike(like);
            
            int likeCnt = boardService.updateBoardLikeCnt(like.getBoardId());
            
//            System.out.println("-------------------------------"+likeCnt);
            
            map.put("isLiked", 1);
            map.put("likeCnt", likeCnt);
            
            return map;
        }
        
        int isLiked = likeDAO.selectIsLikedForId(id);
        
        if(isLiked == 0)
        {
            map.put("isLiked", 1);
            like.setIsLiked(1);   
        }     
        else
        {
            map.put("isLiked", 0);
            like.setIsLiked(0);
        }
            
        like.setId(id);
        likeDAO.updateLike(like);
        System.out.println("-------------------------------"+like.getBoardId());
        int likeCnt = boardService.updateBoardLikeCnt(like.getBoardId());
        System.out.println("-------------------------------"+likeCnt);
        map.put("likeCnt", likeCnt);
        
        return map;
    }

    @Override
    public int deleteLike(int id) throws Exception
    {
        return likeDAO.deleteLike(id);
    }
}
