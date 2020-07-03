package kr.ac.knou.controller.board;

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

import kr.ac.knou.controller.HomeController;
import kr.ac.knou.dto.board.Board;
import kr.ac.knou.service.board.BoardService;

@Controller
public class BoardController
{
    @Autowired
    private BoardService boardService;
    
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
        
        boardService.getBoardCreate(board);
        
        return "redirect:/";
    }
    
    @RequestMapping(value="/boards", method=RequestMethod.GET)
    public String boardReadList(@RequestParam("page")int page_, 
            @RequestParam("field")String field_, @RequestParam("query")String query_, Model model) throws Exception
    {
        String field = (field_!=null) ? field_ : "title";
        String query = (query_!=null) ? query_ : "";
        int page = (page_ != 0) ? page_ : 1;
        
        LOG.info("분류:["+field+"], 작성값:["+query+"], 페이지 번호:["+page+"]");
       
        List<Board> boardList = boardService.getBoardReadList(field, query, page);
        int total = boardService.getBoardReadCount(field, query);
        
        LOG.info("토탈 :"+total);
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
        Board board = boardService.getBoardReadOne(id);
            boardService.getBoardUpdateHit(id);
        LOG.info(board.toString());
        
        Map<String, Object> map = new HashMap<>();
        map.put("BOARD", board);
        model.addAllAttributes(map);
        
        return "board/board-detail";
    }
}
