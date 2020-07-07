package kr.ac.knou.service.like;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.knou.dao.like.LikeDAO;
import kr.ac.knou.dto.like.Like;

@Service
public class LikeServiceImpl implements LikeService
{
    @Autowired
    LikeDAO likeDAO;
    
    @Override
    public int selectIsLiked(Like like) throws Exception
    {
        // TODO Auto-generated method stub
        return likeDAO.selectIsLiked(like);
    }
    
}
