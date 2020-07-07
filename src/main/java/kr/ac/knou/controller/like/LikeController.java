package kr.ac.knou.controller.like;

import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.knou.dto.like.Like;
import kr.ac.knou.service.like.LikeService;

@Controller
public class LikeController
{
    
    @Autowired
    LikeService likeService;
    
    private static final Log LOG = LogFactory.getLog(LikeController.class);
    
    @ResponseBody
    @RequestMapping(value="/is-liked", method = RequestMethod.POST)
    public boolean selectIsLikeForAccountId(Like like) throws Exception
    {
        LOG.info("계정 아이디로 일치하는 Like id 찾기 : ");
        LOG.info(like.toString());
        
        int result = likeService.selectIsLiked(like);     
        
        return (result != 0)? true : false;
    }
    
    @ResponseBody
    @RequestMapping(value="/like-status", method = RequestMethod.POST)
    public Map<String,Integer> UpdateLike(Like like) throws Exception
    {
        return likeService.likeCycle(like);
    }
}
