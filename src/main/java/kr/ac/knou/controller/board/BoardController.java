package kr.ac.knou.controller.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.knou.controller.HomeController;
import kr.ac.knou.dto.board.Board;
import kr.ac.knou.dto.comment.Comment;
import kr.ac.knou.service.board.BoardService;
import kr.ac.knou.service.comment.CommentService;

@Controller
public class BoardController
{
    @Autowired
    private BoardService boardService;
    
    @Autowired
    private CommentService commentService;
    
    private static final Log LOG = LogFactory.getLog(HomeController.class);
    
    @RequestMapping(value="/boards/form", method=RequestMethod.GET)
    public String boardCreate()
    { 
        return "board/board-form";
    }
    
    @RequestMapping(value="/boards", method=RequestMethod.POST)
    public String boardCreate(Board board) throws Exception
    {
        LOG.info(board.toString());
        
        boardService.insertBoard(board);
        
        return "redirect:/";
    }
    
    @RequestMapping(value="/boards", method=RequestMethod.GET)
    public String boardList(
            @RequestParam(value="page",required = false) String page_, 
            @RequestParam(value="field",required = false) String field, 
            @RequestParam(value="query",required = false) String query, 
            Model model) throws Exception
    {   
        field = (field!=null) ? field : "title";
        query = (query!=null) ? query : "";
        int page = (page_ != null) ? Integer.valueOf(page_) : 1;
        
        LOG.info("분류:["+field+"], 작성값:["+query+"], 페이지 번호:["+page+"]");
       
        List<Board> boardList = boardService.selectBoards(field, query, page);
        
        int total = boardService.selectBoardCount(field, query);
        
        int lastPage =  (int) Math.ceil(total/5)+1;
        
        LOG.info("토탈/한페이지당 개시물(5):"+lastPage);
        
        Map<String, Object> map = new HashMap<>();
        map.put("PAGE", page);
        map.put("FIELD", field);
        map.put("QUERY", query);
        map.put("BOARDLIST",boardList);
        map.put("LASTPAGE",lastPage);
        
        model.addAllAttributes(map);
        
        return "board/board-list";
    }
    
    @RequestMapping(value="/boards/{id}", method=RequestMethod.GET)
    public String boardReadOne(@PathVariable("id")int id, Model model) throws Exception
    {
        Board board = boardService.selectBoardForId(id); LOG.info(board.toString());
        
        boardService.updateBoardHit(id);
        
        List<Comment> commentList = commentService.getReadCommentList(id);
        
        Map<String, Object> map = new HashMap<>();
        map.put("BOARD", board);
        map.put("COMMENT", commentList);
        
        model.addAllAttributes(map);
        
        return "board/board-detail";
    }
}
