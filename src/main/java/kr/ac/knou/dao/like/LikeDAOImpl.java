package kr.ac.knou.dao.like;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.knou.dto.like.Like;

@Repository
public class LikeDAOImpl implements LikeDAO
{
    @Autowired
    private SqlSession sqlSession;
    
    @Override
    public int selectIsLiked(Like like) throws Exception
    {
        return sqlSession.selectOne("like.selectIsLiked", like);
    }
    
}
