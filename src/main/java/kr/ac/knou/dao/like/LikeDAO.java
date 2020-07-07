package kr.ac.knou.dao.like;

import kr.ac.knou.dto.like.Like;

public interface LikeDAO
{
    public int selectLikeIdForBoardIdAndUserId(Like like) throws Exception;
    
    public int selectIsLikedForId(int id) throws Exception;
    
    public int insertLike(Like like) throws Exception;
    
    public int updateLike(Like like) throws Exception;
}
