package kr.ac.knou.controller.comment;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
    public List<Comment> getComment(Comment comment) throws Exception
    {
        LOG.info(comment.toString());
        int createSuccess = commentService.insertCommentAndUpdateBoardCommentCnt(comment);
        
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
}
