package kr.ac.knou.controller.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ac.knou.controller.HomeController;
import kr.ac.knou.dto.user.User;
import kr.ac.knou.service.board.BoardService;
import kr.ac.knou.service.comment.CommentService;
import kr.ac.knou.service.user.UserService;
import kr.ac.knou.util.EmailAuth;
import kr.ac.knou.util.FileUtil;

@Controller
public class UserController
{
    @Autowired
    private PasswordEncoder passwordEncoder;
    
    @Autowired
    private UserService userService;
    
    @Autowired
    private BoardService boardService;
    
    @Autowired
    private CommentService commentService;
    
    private static final Log LOG = LogFactory.getLog(HomeController.class);
    
    @RequestMapping(value="/users/sign-in", method=RequestMethod.GET)
    public String signIn()
    {
        return "sign/sign-in";
    }
    
    @RequestMapping(value="/users/sign-in", method=RequestMethod.POST)
    public String signIn(User user, Model model, HttpSession session) throws Exception
    {
        model.addAttribute("signInfo", user);
        
        if(user.getEmail().equals(""))
        {
            model.addAttribute("massage", "아이디를 입력해 주세요.");
            return "sign/sign-in";
        }else if(user.getPassword().equals(""))
        {
            model.addAttribute("massage", "비밀번호를 입력해 주세요.");
            return "sign/sign-in";
        }
        
        User signUser = userService.selectUserForEmail(user);

        if(signUser == null)
        {
            model.addAttribute("massage", "존재하지 않는 계정입니다.");
            return "sign/sign-in";
        }
        
        boolean result = passwordEncoder.matches(user.getPassword(), signUser.getPassword());
        
        if(!result) 
        {
            model.addAttribute("massage", "비밀번호가 일치하지 않습니다.");
            return "sign/sign-in";
        }else if(signUser.getAuthStatus() == 0)
        {
            model.addAttribute("massage", "이메일 인증이 완료되지 않은 계정입니다. 인증을 완료해 주세요.");
            return "sign/sign-in";
        }
        
        session.setAttribute("ACCOUNT", signUser);
        
        return "redirect:/";
    }
    
    @RequestMapping(value="/users/sign-up", method=RequestMethod.GET)
    public String signUp()
    {
        return "sign/sign-up";
    }
    
    @RequestMapping(value="/users/sign-up", method=RequestMethod.POST)
    public String signUp(User user) throws Exception
    {        
        //Spring security를 통한 비밀번호 암호화
        String encPassword = passwordEncoder.encode(user.getPassword());
        user.setPassword(encPassword);
  
        userService.insertUserAndSendEmail(user);
        
        return "sign/sign-up-finish";
    }
    
    @RequestMapping(value="/users/sign-out", method=RequestMethod.GET)
    public String signOut(HttpSession session)
    {
        session.invalidate();
        
        return "redirect:/";
    }
    
    @RequestMapping(value="/users/confirm", method=RequestMethod.GET)
    public String updateUserAuthStatus(@RequestParam("email")String email, @RequestParam("key")String key, Model model) throws Exception
    {       
        int id = userService.updateUserAuthStatusForCertifiedId(email, key);

        if(id == 0)
            model.addAttribute("AUTH_KEY", false);
        else
            model.addAttribute("AUTH_KEY", true);
        
        return "sign/sign-in";
    }
    
    @RequestMapping(value="/users",method=RequestMethod.GET)
    public String selectUsers(
            @RequestParam(value="page",required = false) String page_, 
            @RequestParam(value="query",required = false) String query,
            Model model) throws Exception
    {  
        query = (query!=null) ? query : "";
        
        int page = (page_ != null) ? Integer.valueOf(page_) : 1;
        
        LOG.info("분류[defulat nickname], 작성값:["+query+"], 페이지 번호:["+page+"]");
        
        List<User> userList = userService.selectUsers(query, page);
        
        int total = userService.selectUserCount(query);
        
        int lastPage =  (int) Math.ceil(total/20)+1;
        
        Map<String, Object> map = new HashMap<>();
        map.put("TOTAL", total);
        map.put("PAGE", page);
        map.put("QUERY", query);
        map.put("USERLIST", userList);
        map.put("LASTPAGE", lastPage);
        
        
        model.addAllAttributes(map);
        
        return "user/user-list";
    }
     
    @RequestMapping(value="/users/{id}", method=RequestMethod.GET)
    public String selectUserForId(@PathVariable("id")int id, Model model) throws Exception
    {
        LOG.info(id);
        
        Map<String, Object> map = new HashMap<>();
        
        map.put("USER", userService.selectUserForId(id));

        map.put("QUESTIONLIST", boardService.selectBoardsForUserId(id));
        
        map.put("ANSWERLIST", commentService.selectBoardsForWriterId(id));

        model.addAllAttributes(map);
        
        return "user/user-detail";
    }
    
    @RequestMapping(value="/users/{id}/questions", method=RequestMethod.GET)
    public String selectUserForId_Questions(
            @PathVariable("id")int id,
            @RequestParam(value="page",required=false)String page_,
            Model model) throws Exception
    {
        int page = (page_ != null) ? Integer.valueOf(page_) : 1;

        Map<String, Object> map = new HashMap<>();
        
        map.put("USER", userService.selectUserForId(id));

        map.put("QUESTIONLIST", boardService.selectBoardsForUserId(id, page));
        
        int total = boardService.selectBoardCountForUserId(id);
        
        map.put("TOTAL", total);
        
        map.put("LASTPAGE", (int)Math.ceil(total/5)+1);
        
        map.put("PAGE", page);

        model.addAllAttributes(map);
        
        return "user/user-detail-question";
    }
    
    @RequestMapping(value="/users/{id}/answers", method=RequestMethod.GET)
    public String selectUserForId_Answers(
            @PathVariable("id")int id,
            @RequestParam(value="page",required=false)String page_,
            Model model) throws Exception
    {
        int page = (page_ != null) ? Integer.valueOf(page_) : 1;
        
        Map<String, Object> map = new HashMap<>();
        
        map.put("USER", userService.selectUserForId(id));

        map.put("ANSWERLIST", commentService.selectBoardsForWriterId(id));
        
        int total = commentService.selectBoardCountForWriterId(id);
        
        map.put("TOTAL", total);
        
        map.put("LASTPAGE", (int)Math.ceil(total/5)+1);
        
        map.put("PAGE", page);

        model.addAllAttributes(map);
        
        return "user/user-detail-answer";
    }
    
    @RequestMapping(value="/users/{id}/edit", method=RequestMethod.GET)
    public String updateUser(@PathVariable("id")int id, Model model) throws Exception
    {
        User user = userService.selectUserForId(id);
        
        model.addAttribute("USER", user);
        
        return "user/user-edit";
    }
     
    @RequestMapping(value="/users/{id}", method=RequestMethod.PUT)
    public String updateUser(@PathVariable("id")int id, User user, HttpSession session ,RedirectAttributes model) throws Exception
    {
        LOG.info(user.toString());
        
        int result = userService.updateUser(user);
        
        if(result == 1)
        {
           session.setAttribute("ACCOUNT",userService.selectUserForId(id));    
        }
        
        model.addFlashAttribute("USER_UPDATE", true);
        return "redirect:/";
    }
    
    @RequestMapping(value="/users/{id}", method=RequestMethod.DELETE)
    public String deleteUser(@PathVariable("id")int id, HttpSession session, RedirectAttributes model) throws Exception
    {
        userService.deleteUser(id);
        
        session.invalidate();
        
        model.addFlashAttribute("USER_DELETE", true);
        
        return "redirect:/";
    }
    
    @ResponseBody
    @RequestMapping(value="/users/email-check", method=RequestMethod.POST)
    public boolean selectUserIdForEmail(@RequestParam(value="email",required = false)String email) throws Exception
    {
        int id = userService.selectUserIdForEmail(email);
        
        LOG.info("result: "+id);
        
        return (id == 0) ? true : false;
    }
    
    @ResponseBody
    @RequestMapping(value="/users/nickname-check", method=RequestMethod.POST)
    public boolean selectUserIdForNickname(
            @RequestParam(value="accountNickname",required=false)String accountNickname,
            @RequestParam(value="nickname",required = false)String nickname
            ) throws Exception
    {
        if(accountNickname != null && !accountNickname.equals(""))
        {
            if(accountNickname.equals(nickname))
               return true;
        }
        
        int id = userService.selectUserIdForNickname(nickname);
        
        LOG.info("result: "+id);
         
        return (id == 0) ? true : false;
    }
    
    @ResponseBody
    @RequestMapping(value="/users/{id}/image", method=RequestMethod.POST)
    public Map<String, String> updateUserImage( 
            @PathVariable("id")int id,
            @RequestParam(value = "imgFile", required = false)MultipartFile imgFile,
            HttpSession session) throws Exception
    {
        //파일 업로드 처리 클래스에게 MultipartFile 타입의 파일처리를 위임
        User user = FileUtil.imageUpload(imgFile);
        
        //FileUtil 클래스에서 UUID 이미지 이름값은 얻어왔지만 id를 설정안해 id 값도 받아서 서비스로 보낸다.
        user.setId(id);
        
        userService.updateUserImage(user);
        
        user = userService.selectUserForId(id);
        
        LOG.info(user.toString());
        
        Map<String, String> map = new HashMap<>();
        map.put("image", user.getImage());
        
        session.setAttribute("ACCOUNT", user);

        return map;
    }
    
    
    @RequestMapping(value="/users/forget-password", method=RequestMethod.GET)
    public String selectforgetPassword()
    {
        /**
         * 1. 비밀번호 찾기 버튼 클릭시 해당 컨트롤러가 받음
         * 2. 비밀번호 찾기 페이지로 이동시킴
         */
        
        return "/sign/forget-password";
    }
    
    @RequestMapping(value="/users/forget-password", method=RequestMethod.POST)
    public String selectforgetPassword(@RequestParam("email")String email) throws Exception
    {
        /**
         * 1. 비밀번호 찾기 페이지에서 submit 시 받는 컨트롤러 
         */
        userService.forgetPassword(email);

        return "redirect:/";
    }
    
    @RequestMapping(value="/users/remake-password", method=RequestMethod.GET)
    public String updatePassword(
            @RequestParam("email")String email, 
            @RequestParam("key")String key, 
            RedirectAttributes redirectModel,
            Model model) throws Exception
    {
        int id = userService.updateUserAuthStatusForCertifiedId(email, key);

        if(id == 0)
        {
            redirectModel.addFlashAttribute("AUTH_KEY", false);
            return "redirect:/";
        }
        
        model.addAttribute("ID", id);

        return "/sign/remake-password";
    }
    
    @RequestMapping(value="/users/remake-password", method=RequestMethod.POST)
    public String updatePassword(User user, RedirectAttributes model) throws Exception
    {
        LOG.info("비밀번호 변경할 회원 정보 : "+ user.toString());
        
       //Spring security를 통한 비밀번호 암호화
       String encPassword = passwordEncoder.encode(user.getPassword());
       user.setPassword(encPassword);
       
       userService.updateUserPassword(user);
       
       model.addFlashAttribute("PASSWORD_UPDATE", true);
        
       return "redirect:/";
    }
   
}
