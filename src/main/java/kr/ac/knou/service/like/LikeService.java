package kr.ac.knou.service.like;

import java.util.Map;

import kr.ac.knou.dto.like.Like;

public interface LikeService
{
    public int selectIsLiked(Like like) throws Exception;
    
    public Map<String,Integer> likeCycle(Like like) throws Exception;
}
