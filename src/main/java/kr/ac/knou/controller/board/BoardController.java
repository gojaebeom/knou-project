package kr.ac.knou.controller.board;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ac.knou.controller.HomeController;
import kr.ac.knou.dto.board.Board;
import kr.ac.knou.dto.comment.Comment;
import kr.ac.knou.dto.tag.Tag;
import kr.ac.knou.service.board.BoardService;
import kr.ac.knou.service.comment.CommentService;
import kr.ac.knou.service.tag.TagService;

@Controller
public class BoardController
{
    @Autowired
    private BoardService boardService;
    
    @Autowired
    private CommentService commentService;
    
    @Autowired
    private TagService tagService;
    
    private static final Log LOG = LogFactory.getLog(HomeController.class);
    
    @RequestMapping(value="/boards/form", method=RequestMethod.GET)
    public String insertBoard()
    { 
        return "board/board-form";
    }
    
    @RequestMapping(value="/boards", method=RequestMethod.POST)
    public String insertBoard(Board board, @RequestParam(value="tags",required=false)String[] tags) throws Exception
    {
        LOG.info(board.toString());
        
        int boardId = boardService.insertBoard(board);
        
        List<Tag> tagList = new ArrayList<>();
        
        for(String tag_ : tags)
        {
            Tag tag = new Tag();
            tag.setBoardId(boardId);
            tag.setTagName(tag_);
            tagList.add(tag);
        }
        
        tagService.insertTags(tagList);
        
        return "redirect:/";
    }
    
    @RequestMapping(value="/boards", method=RequestMethod.GET)
    public String selectBoards(
            @RequestParam(value="page",required = false) String page_, 
            @RequestParam(value="query",required = false) String query, 
            Model model) throws Exception
    {   

        query = (query!=null) ? query : "";
        int page = (page_ != null) ? Integer.valueOf(page_) : 1;
        
        LOG.info("작성값:["+query+"], 페이지 번호:["+page+"]");
       
        List<Board> boardList = boardService.selectBoards(query, page);
        
        int total = boardService.selectBoardCount(query);
        
        int lastPage =  (int) Math.ceil(total/5)+1;
        
        LOG.info("토탈/한페이지당 개시물(5):"+lastPage);
        
        Map<String, Object> map = new HashMap<>();
        map.put("TOTAL", total);
        map.put("PAGE", page);
        map.put("QUERY", query);
        map.put("BOARDLIST",boardList);
        map.put("LASTPAGE",lastPage);
        
        model.addAllAttributes(map);
        
        return "board/board-list";
    }
    
    @RequestMapping(value="/boards/{id}", method=RequestMethod.GET)
    public String selectBoardForId(@PathVariable("id")int id, Model model) throws Exception
    {
        Board board = boardService.selectBoardForId(id);
        
        LOG.info(board.toString());
        
        boardService.updateBoardHit(id);
        
        List<Comment> commentList = commentService.selectComments(id);
        
        Map<String, Object> map = new HashMap<>();
        map.put("BOARD", board);
        map.put("COMMENT", commentList);
        
        model.addAllAttributes(map);
        
        return "board/board-detail";
    }
    
    @RequestMapping(value="/boards/{id}/edit", method=RequestMethod.GET)
    public String updateBoardForId(@PathVariable("id")int id, Model model) throws Exception
    {
        Board board = boardService.selectBoardForId(id);
        
        LOG.info(board.toString());
        
        boardService.updateBoardHit(id);
         
        Map<String, Object> map = new HashMap<>();
        map.put("BOARD", board);
        
        model.addAllAttributes(map);
        
        return "board/board-edit";
    }
    
    @RequestMapping(value="/boards/{id}", method=RequestMethod.PUT)
    public String updateBoardForId(
            Board board,
            @RequestParam(value="tags",required=false)String[] tags,
            RedirectAttributes model) throws Exception
    {
        LOG.info("게시물 수정");
        
        LOG.info("수정할 게시물 : "+board.toString());
        
        Tag tag_ = new Tag();

        for(String tag: tags)
        {
            tag_.setBoardId(board.getId());
            tag_.setTagName(tag);
            
            tagService.updateTag(tag_);
        }
 
        
        
        
        boardService.updateBoard(board);
        
        model.addFlashAttribute("BOARD_UPDATE", true);
        return "redirect:/";
    }
    
    @RequestMapping(value="/boards/{id}", method=RequestMethod.DELETE)
    public String deleteBoard(@PathVariable("id")int id) throws Exception
    {
        boardService.deleteBoard(id);
        return "redirect:/";
    }
}
