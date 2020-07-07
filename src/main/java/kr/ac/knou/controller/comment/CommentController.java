package kr.ac.knou.controller.comment;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mysql.cj.result.IntegerValueFactory;

import kr.ac.knou.dto.comment.Comment;
import kr.ac.knou.service.comment.CommentService;

@Controller
public class CommentController
{
    private static final Log LOG = LogFactory.getLog(CommentController.class);
    
    @Autowired
    CommentService commentService;
    
    @ResponseBody
    @RequestMapping(value="/comments", method=RequestMethod.POST)
    public List<Comment> selectComments(Comment comment) throws Exception
    {
        LOG.info(comment.toString());
        int createSuccess = commentService.insertComment(comment);
        
        if(createSuccess == 0)
        {
            LOG.info(createSuccess);
            return null;
        }
    
        List<Comment> commentList = commentService.selectComments(comment.getBoardId());
        
        for(Comment comm : commentList)
        {
            LOG.info(comm.toString());
        }
        
        return commentList;
    }
    
    @ResponseBody
    @RequestMapping(value="/comments/{id}", method=RequestMethod.PUT)
    public boolean updateComment(@RequestBody Comment comment) throws Exception
    {
        LOG.info("댓글 수정 컨트롤러");
        LOG.info(comment.toString());
        commentService.updateComment(comment);
        
        
       return true;
    }
    
    @ResponseBody
    @RequestMapping(value="/comments/{id}", method=RequestMethod.DELETE)
    public boolean deleteComment(@RequestBody Comment comment) throws Exception
    {
        LOG.info("댓글 삭제 컨트롤러");
        LOG.info(comment.toString());
        commentService.deleteComment(comment);
        
        
       return true;
    }
}
