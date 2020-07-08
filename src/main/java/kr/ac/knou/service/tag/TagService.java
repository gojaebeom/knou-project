package kr.ac.knou.service.tag;

import java.util.List;

import kr.ac.knou.dto.board.Board;
import kr.ac.knou.dto.tag.Tag;

public interface TagService
{
    public List<Tag> selectTags() throws Exception;
    
    public List<Tag> selectTagsForBoardId(int boardId) throws Exception;
    
    public List<Board> selectBoardsForTagName(String name) throws Exception;
    
    public List<Board> selectBoardsForLikeName(String name) throws Exception;
    
    public void insertTags(List<Tag> tags) throws Exception;
    
    public int updateTag(Tag tags) throws Exception;
    
    public int deleteTag(int id) throws Exception;

   

    
}
