package kr.ac.knou.service.like;

import kr.ac.knou.dto.like.Like;

public interface LikeService
{
    public int selectIsLiked(Like like) throws Exception;
}
