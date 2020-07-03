package kr.ac.knou.controller.user;

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

import kr.ac.knou.controller.HomeController;
import kr.ac.knou.dto.user.User;
import kr.ac.knou.service.user.UserService;

@Controller
public class UserController
{
    @Autowired
    private PasswordEncoder passwordEncoder;
    
    @Autowired
    private UserService userService;
    
    private static final Log LOG = LogFactory.getLog(HomeController.class);
    
    @RequestMapping(value="/sign-in", method=RequestMethod.GET)
    public String signIn()
    {
        return "sign/sign-in";
    }
    
    @RequestMapping(value="/sign-in", method=RequestMethod.POST)
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
        

        User signUser = userService.signIn(user);

        if(signUser == null)
        {
            model.addAttribute("massage", "존재하지 않는 계정입니다.");
            return "sign/sign-in";
        }
        
        boolean signInCheck = passwordEncoder.matches(user.getPassword(), signUser.getPassword());
        
        if(!signInCheck) 
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
  
        userService.signUp(user);
        
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
        int id = userService.getEmailConfirm(email, key);

        if(id == 0)
            model.addAttribute("loginComplete", false);
        else
            model.addAttribute("loginComplete", true);
        
        return "sign/sign-in";
    }
     
    @RequestMapping(value="/users/{id}", method=RequestMethod.GET)
    public String findById(@PathVariable("id")int id, Model model) throws Exception
    {
        LOG.info(id);
        User user = userService.getFindById(id);
        model.addAttribute("USER", user);
        
        return "user/user-detail";
    }
    
    @RequestMapping(value="/users/{id}/edit", method=RequestMethod.GET)
    public String findByIdEdit(@PathVariable("id")int id, Model model) throws Exception
    {
        User user = userService.getFindById(id);
        model.addAttribute("USER", user);
        
        return "user/user-edit";
    }
     
    @RequestMapping(value="/users/{id}", method=RequestMethod.PUT)
    public String findByIdEdit(@PathVariable("id")int id, User user, HttpSession session) throws Exception
    {
        LOG.info(user.toString());
        int check = userService.getUserEdit(user);
        if(check == 1)
        {
           session.setAttribute("ACCOUNT",userService.getFindById(id));    
        }
        
        return "redirect:/";
    }
    
    @ResponseBody
    @RequestMapping(value="/email-check")
    public boolean emailCheck(@RequestParam("email")String email) throws Exception
    {
        int checkNum = userService.getEmailCheck(email);
        
        if(checkNum != 0)
            return false;
 
        return true;
    }
    
    @ResponseBody
    @RequestMapping(value="/nickname-check")
    public boolean nicknameCheck(@RequestParam("nickname")String nickname) throws Exception
    {
        int checkNum = userService.getNicknameCheck(nickname);
        
        if(checkNum != 0)
            return false;
 
        return true;
    }
}
