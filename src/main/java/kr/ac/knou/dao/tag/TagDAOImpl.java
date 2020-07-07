package kr.ac.knou.dao.tag;

import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.knou.controller.HomeController;
import kr.ac.knou.dto.tag.Tag;

@Repository
public class TagDAOImpl implements TagDAO
{
    @Autowired
    private SqlSession sqlSession;
    
    private static final Log LOG = LogFactory.getLog(HomeController.class);
    
    @Override
    public List<Tag> selectTags() throws Exception
    {                
        return sqlSession.selectList("selectTags");
    }
    
    @Override
    public List<Tag> selectTagsForBoardId(int boardId)
    {
        // TODO Auto-generated method stub
        return sqlSession.selectList("tag.selectTagsForBoardId", boardId);
    }

    @Override
    public void insertTags(List<Tag> tags)
    {
        for(Tag tag : tags)
        {
            LOG.info(tag.toString());
        }
        
        sqlSession.insert("tag.insertTags", tags);
    }

    @Override
    public int deleteTag(int id) throws Exception
    {
        return sqlSession.delete("tag.deleteTag", id);
    }  
}
