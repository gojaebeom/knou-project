package kr.ac.knou.dao.like;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.knou.dto.like.Like;

@Repository
public class LikeDAOImpl implements LikeDAO
{
    @Autowired
    private SqlSession sqlSession;
    
    private static final Log LOG = LogFactory.getLog(LikeDAOImpl.class);
    
    @Override
    public int selectLikeIdForBoardIdAndUserId(Like like) throws Exception
    {
        Integer id = sqlSession.selectOne("like.selectLikeIdForBoardIdAndUserId", like);
        
        LOG.info("게시물 id, 유저 id에 해당하는 like id : "+id);
        
        return (id != null) ? id : 0;
    }
    
    @Override
    public int selectIsLikedForId(int id) throws Exception
    {
        Integer isLiked =  sqlSession.selectOne("like.selectIsLikedForId", id);
        
        LOG.info("isLiked 상태 : " + isLiked);
        
        return (isLiked != null) ? isLiked : 0;
    }
    
    @Override
    public List<Like> selectLikesForBoardId(int boardId) throws Exception
    {
        List<Like> likeList = sqlSession.selectList("like.selectLikesForBoardId",boardId);
        
        for(Like like : likeList)
        {
            LOG.info("게시물 id 에 해당하는 like id : "+like.toString());
        }
        
        return likeList;
    }
    
    @Override
    public int insertLike(Like like) throws Exception
    {
         int result = sqlSession.insert("like.insertLike", like);
         
         LOG.info("like 생성 ~ 성공여부 : " + result);
         
         return result;
    }

    @Override
    public int updateLike(Like like) throws Exception
    {
        LOG.info("like 최종 column들 확인"+like.toString());
        
        int result = sqlSession.update("like.updateLike", like);
        
        LOG.info("isLiked 수정 ~ 성공여부 : " + result);
        
        return result;
    }

    @Override
    public int deleteLike(int id) throws Exception
    {
        LOG.info(id+"번째 like 삭제!");
        return sqlSession.delete("like.deleteLike", id);
    }
}
