package kr.ac.knou.service.tag;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.knou.dao.tag.TagDAO;
import kr.ac.knou.dto.tag.Tag;

@Service
public class TagServiceImpl implements TagService
{
    @Autowired
    private TagDAO tagDAO;
    
    @Override
    public List<Tag> selectTags() throws Exception
    {
        return tagDAO.selectTags();
    }    
    
    @Override
    public List<Tag> selectTagsForBoardId(int boardId) throws Exception
    {
        // TODO Auto-generated method stub
        return tagDAO.selectTagsForBoardId(boardId);
    }
    
    @Override
    public void insertTags(List<Tag> tags) throws Exception
    {
        tagDAO.insertTags(tags);
    }

    @Override
    public int updateTag(Tag tags) throws Exception
    {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public int deleteTag(int id) throws Exception
    {
        // TODO Auto-generated method stub
        return tagDAO.deleteTag(id);
    }

    
}
