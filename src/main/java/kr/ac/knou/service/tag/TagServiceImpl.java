package kr.ac.knou.service.tag;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.knou.dao.tag.TagDAO;
import kr.ac.knou.dto.board.Board;
import kr.ac.knou.dto.tag.Tag;
import kr.ac.knou.service.board.BoardService;

@Service
public class TagServiceImpl implements TagService
{
    
    
    @Autowired
    private TagDAO tagDAO;
    
    @Autowired
    private BoardService boardService;
    
    private static final Log LOG = LogFactory.getLog(TagServiceImpl.class);
    
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
    public List<Board> selectBoardsForTagName(String name) throws Exception
    {
       
        List<Tag> tagList = tagDAO.selectTagsForTagName(name);
        
        List<Board> boardList = new ArrayList<>();
        
        for(Tag tag : tagList)
        {
           Board board = boardService.selectBoardForId(tag.getBoardId());
           
           boardList.add(board);
           
           LOG.info("-----------------"+board.toString());
        }
        
        return boardList;
    }
    
    @Override
    public List<Board> selectBoardsForLikeName(String name) throws Exception
    {
        List<Tag> tagList = tagDAO.selectTagsForLikeName(name);
        
        List<Board> boardList = new ArrayList<>();
        
        for(Tag tag : tagList)
        {
           Board board = boardService.selectBoardForId(tag.getBoardId());
           
           boardList.add(board);
           
           LOG.info("---------------------------------------------------------------"+board.toString());
        }
        
        
        
        return boardList;
    }
    
    @Override
    public void insertTags(List<Tag> tags) throws Exception
    {
        tagDAO.insertTags(tags);
    }

    @Override
    public int updateTag(Tag tag) throws Exception
    {
        LOG.info("태그명:"+tag.toString());
        
        int result = tagDAO.selectTagCountForBoardIdAndTagName(tag);
        
        if(result != 0)
        {
            LOG.info("이미 존재하는 태그");
            return 0;
        }
        else
        {
            LOG.info("새로 생성할 태그!");
            tagDAO.insertTag(tag);
        }
        return 1;
    }

    @Override
    public int deleteTag(int id) throws Exception
    {
        // TODO Auto-generated method stub
        return tagDAO.deleteTag(id);
    }

    

    

    
}
