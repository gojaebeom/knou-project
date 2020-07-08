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
    public List<Tag> selectTagsForTagName(String tagName) throws Exception
    {
        List<Tag> tagList = sqlSession.selectList("tag.selectTagsForTagName", tagName);
        
        for(Tag tag : tagList)
        {
            LOG.info("가져온 태그 정보 : "+tag.toString());
        }
        
        return tagList;
    }
    
    @Override
    public List<Tag> selectTagsForLikeName(String tagName) throws Exception
    {
        List<Tag> tagList = sqlSession.selectList("tag.selectTagsForLikeName", tagName);
        
        for(Tag tag : tagList)
        {
            LOG.info("가져온 태그 정보 : "+tag.toString());
        }
        
        return tagList;
    }
    
    @Override
    public int selectTagCountForBoardIdAndTagName(Tag tag) throws Exception
    {
        int result = sqlSession.selectOne("tag.selectTagCountForBoardIdAndTagName",tag);
        System.out.println("존재하는 값: "+result);
        return result;
    }  
    
    @Override
    public int selectTagCount() throws Exception
    {
        int total =  sqlSession.selectOne("tag.selectTagCountForTagName");
        LOG.info("태그 총 개수:"+total);
        return 0;
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
    public void insertTag(Tag tag) throws Exception
    {
        sqlSession.insert("tag.insertTag", tag);
    }

    @Override
    public int deleteTag(int id) throws Exception
    {
        return sqlSession.delete("tag.deleteTag", id);
    }

    

    

   
}
