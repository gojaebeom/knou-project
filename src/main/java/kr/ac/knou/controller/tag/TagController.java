package kr.ac.knou.controller.tag;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.knou.dto.board.Board;
import kr.ac.knou.service.tag.TagService;
import kr.ac.knou.util.TIME_MAXIMUM;

@Controller
public class TagController
{
    @Autowired
    private TagService tagService;
    
    private static final Log LOG = LogFactory.getLog(TagController.class);
        
    @RequestMapping(value="/tags",method=RequestMethod.GET)
    public String selectTagForLikeName(
            @RequestParam(value="like",required = false)String name,
            Model model) throws Exception
    {

        LOG.info("검색한 태그 자동완성네임 : "+name);
        
        if(name != null&&!name.equals(""))
        {
            List<Board> boardList = tagService.selectBoardsForLikeName(name);
                        
            model.addAttribute("BOARDLIST",boardList);
            model.addAttribute("TOTAL", boardList.size());
            model.addAttribute("TAGNAME", name); 
        }
        
        model.addAttribute("TAGLIST", tagService.selectTags());
        
        
        return "tag/tag-list";
    }
    
    @RequestMapping(value="/tags/{name}",method=RequestMethod.GET)
    public String selectTagForTagName(
            @PathVariable(value="name",required = false)String name,
            Model model) throws Exception
    {
        LOG.info("검색한 태그네임 : "+name);
        
        if(name != null&&!name.equals(""))
        {
            List<Board> boardList = tagService.selectBoardsForTagName(name);
                       
            model.addAttribute("BOARDLIST",boardList);
            model.addAttribute("TOTAL", boardList.size());
            model.addAttribute("TAGNAME", name); 
        }
        
        model.addAttribute("TAGLIST", tagService.selectTags());
        
        return "tag/tag-name-list";
    }
    
    @ResponseBody
    @RequestMapping(value="/tags/{id}",method=RequestMethod.DELETE)
    public boolean deleteTag(@PathVariable("id")int id) throws Exception
    {
        LOG.info("삭제할 태그 id : "+id);
        
        tagService.deleteTag(id);
        
        return true;
    }
}
