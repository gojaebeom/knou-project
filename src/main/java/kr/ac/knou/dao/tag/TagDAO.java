package kr.ac.knou.dao.tag;

import java.util.List;

import kr.ac.knou.dto.tag.Tag;

public interface TagDAO 
{
    public List<Tag> selectTags() throws Exception;
    
    public List<Tag> selectTagsForTagName(String tagName) throws Exception;
    
    public List<Tag> selectTagsForLikeName(String tagName) throws Exception;
    
    public List<Tag> selectTagsForBoardId(int boardId) throws Exception;
    
    public int selectTagCountForBoardIdAndTagName(Tag tag) throws Exception;
    
    public int selectTagCount() throws Exception;
    
    public void insertTags(List<Tag> tags) throws Exception;
    
    public void insertTag(Tag tag) throws Exception;
    
    public int deleteTag(int id) throws Exception;
    
}
