package kr.ac.knou.dao.like;

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
        // TODO Auto-generated method stub
        Integer id = sqlSession.selectOne("like.selectLikeIdForBoardIdAndUserId", like);
        
        LOG.info("게시물 id, 유저 id에 해당하는 like id : "+id);
        
        return (id != null) ? id : 0;
    }
    
    @Override
    public int selectIsLikedForId(int id) throws Exception
    {
        Integer isLiked =  sqlSession.selectOne("like.selectIsLikedForId", id);
        
        LOG.info("isLiked 상태 : " + isLiked);
        
        return isLiked;
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

    



    
    
}
