package kr.ac.knou.dao.like;

import kr.ac.knou.dto.like.Like;

public interface LikeDAO
{
    public int selectIsLiked(Like like) throws Exception;
}
