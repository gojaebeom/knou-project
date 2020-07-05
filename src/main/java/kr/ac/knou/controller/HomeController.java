package kr.ac.knou.controller;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.ac.knou.dto.board.Board;
import kr.ac.knou.service.board.BoardService;

@Controller
public class HomeController
{
    private static final Log LOG = LogFactory.getLog(HomeController.class);
    
    @Autowired
    BoardService boardService;
    
    @RequestMapping(value="/", method=RequestMethod.GET)
    public String home(Model model) throws Exception
    {
        LOG.info("request home!");
        
        List<Board> boardList = boardService.selectBoards();
        
        model.addAttribute("BoardList", boardList);
       
        return "home";
    }
}
