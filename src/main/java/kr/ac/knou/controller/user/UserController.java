package kr.ac.knou.controller.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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

import kr.ac.knou.controller.HomeController;
import kr.ac.knou.dto.user.User;
import kr.ac.knou.service.user.UserService;
import kr.ac.knou.util.FileUtil;

@Controller
@RequestMapping("/users")
public class UserController
{
    @Autowired
    private PasswordEncoder passwordEncoder;
    
    @Autowired
    private UserService userService;
    
    private static final Log LOG = LogFactory.getLog(HomeController.class);
    
    @RequestMapping(value="/sign-in", method=RequestMethod.GET)
    public String GetSignIn()
    {
        return "sign/sign-in";
    }
    
    @RequestMapping(value="/sign-in", method=RequestMethod.POST)
    public String PostSignIn(User user, Model model, HttpSession session) throws Exception
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
    
    @RequestMapping(value="/sign-up", method=RequestMethod.GET)
    public String signUp()
    {
        return "sign/sign-up";
    }
    
    @RequestMapping(value="/sign-up", method=RequestMethod.POST)
    public String signUp(User user) throws Exception
    {        
        //Spring security를 통한 비밀번호 암호화
        String encPassword = passwordEncoder.encode(user.getPassword());
        user.setPassword(encPassword);
  
        userService.insertUserAndSendEmail(user);
        
        return "sign/sign-up-finish";
    }
    
    @RequestMapping(value="/sign-out", method=RequestMethod.GET)
    public String signOut(HttpSession session)
    {
        session.invalidate();
        
        return "redirect:/";
    }
    
    @RequestMapping(value="/confirm", method=RequestMethod.GET)
    public String emailConfirm(@RequestParam("email")String email, @RequestParam("key")String key, Model model) throws Exception
    {       
        int id = userService.updateUserAuthStatusForCertifiedId(email, key);

        if(id == 0)
            model.addAttribute("loginComplete", false);
        else
            model.addAttribute("loginComplete", true);
        
        return "sign/sign-in";
    }
    
    @RequestMapping(method=RequestMethod.GET)
    public String readUsers(
            @RequestParam(value="page",required = false) String page_, 
            @RequestParam(value="field",required = false) String field, 
            @RequestParam(value="query",required = false) String query,
            Model model) throws Exception
    {
        field = (field!=null) ? field : "nickname";
        
        query = (query!=null) ? query : "";
        
        int page = (page_ != null && page_.equals("")) ? Integer.valueOf(page_) : 1;
        
        LOG.info("분류:["+field+"], 작성값:["+query+"], 페이지 번호:["+page+"]");
        
        List<User> userList = userService.selectUsers(field, query, page);
        
        model.addAttribute("USERLIST", userList);
        
        return "user/user-list";
    }
     
    @RequestMapping(value="/{id}", method=RequestMethod.GET)
    public String findById(@PathVariable("id")int id, Model model) throws Exception
    {
        LOG.info(id);
        
        User user = userService.selectUserForId(id);
        
        model.addAttribute("USER", user);
        
        return "user/user-detail";
    }
    
    @RequestMapping(value="/{id}/edit", method=RequestMethod.GET)
    public String GetUserEdit(@PathVariable("id")int id, Model model) throws Exception
    {
        User user = userService.selectUserForId(id);
        
        model.addAttribute("USER", user);
        
        return "user/user-edit";
    }
     
    @RequestMapping(value="/{id}", method=RequestMethod.PUT)
    public String PutUserEdit(@PathVariable("id")int id, User user, HttpSession session) throws Exception
    {
        LOG.info(user.toString());
        
        int result = userService.updateUser(user);
        
        if(result == 1)
        {
           session.setAttribute("ACCOUNT",userService.selectUserForId(id));    
        }
        
        return "redirect:/";
    }
    
    @ResponseBody
    @RequestMapping(value="/email-check", method=RequestMethod.POST)
    public boolean emailCheck(@RequestParam(value="email",required = false)String email) throws Exception
    {
        int id = userService.selectUserIdForEmail(email);
        
        LOG.info("result: "+id);
        
        return (id == 0) ? true : false;
    }
    
    @ResponseBody
    @RequestMapping(value="/nickname-check", method=RequestMethod.POST)
    public boolean nicknameCheck(@RequestParam(value="nickname",required = false)String nickname) throws Exception
    {
        int id = userService.selectUserIdForNickname(nickname);
        
        LOG.info("result: "+id);
         
        return (id == 0) ? true : false;
    }
    
    @ResponseBody
    @RequestMapping(value="{id}/image", method=RequestMethod.POST)
    public Map<String, String> userImageUpload( 
            @PathVariable("id")int id,
            @RequestParam(value = "imgFile", required = false)MultipartFile imgFile,
            HttpSession session) throws Exception
    {
        
        //파일 업로드 처리 클래스에게 MultipartFile 타입의 파일처리를 위임
        User user = FileUtil.imageUpload(imgFile);
        
//        //FileUtil 클래스에서 반환값이 null일 경우 바로 false 반환
//        if(user == null)
//            return null;
        
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
}
