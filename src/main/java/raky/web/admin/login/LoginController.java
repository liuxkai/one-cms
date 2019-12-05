package raky.web.admin.login;

import core.controller.CoreController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import raky.entity.Types;
import raky.entity.Users;
import raky.service.UsersService;
import raky.util.GetIp;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("login")
public class LoginController extends CoreController {
    @Autowired
    private UsersService usersService;

    @RequestMapping("UserLogin")
    public String login(Users user, HttpServletRequest httpServletRequest, String vrifyCode,Model model){
        //获取session中的谷歌验证码内容
        System.out.println(user.getUserName());
        System.out.println(user.getPassWord());
        String captchaId = (String) httpServletRequest.getSession().getAttribute("vrifyCode");
        String parameter = httpServletRequest.getParameter("vrifyCode");
        System.out.println(captchaId);
        System.out.println(parameter);
        Users OnlinerUser;
        /*ModelAndView modelAndView = new ModelAndView();*/
        int result = 0;
        if (!captchaId.equals(parameter)) {
           httpServletRequest.getSession().getServletContext().setAttribute("info","验证码不正确");
           /*modelAndView.setViewName("redirect:/tologin");*/
           return "redirect:/tologin";
        } else {
            OnlinerUser = usersService.findOne(user);
            if (OnlinerUser !=null){
                Integer loginCount = OnlinerUser.getLoginCount();
                OnlinerUser.setLoginCount(loginCount+1);
                String ipAddr = GetIp.getIpAddr(httpServletRequest);
                System.out.println(ipAddr);
                OnlinerUser.setLastLoginIp(ipAddr);
                OnlinerUser.setLastLoginTime(new Date());
                 result = usersService.update(OnlinerUser);
            }
            System.out.println(result);
            if (result !=1){
                httpServletRequest.getSession().getServletContext().setAttribute("info","用户名或者密码不正确");
                /*modelAndView.setViewName("redirect:/tologin");*/
                return "redirect:/tologin";
            }
//            modelAndView.addObject("OnlineUser",OnlinerUser);
            httpServletRequest.getSession().getServletContext().setAttribute("OnlineUsername",OnlinerUser.getUserName());
           /* model.addAttribute("OnlinerUser",OnlinerUser);*/
            httpServletRequest.getSession().setAttribute("OnlinerUser",OnlinerUser);
            /*modelAndView.setViewName("/skip/main");*/
            return "redirect:/skip/main";
        }



    }
    @RequestMapping("list")
    public String getList(){
        return "users/user";
    }

    @RequestMapping("save")
    public String getList1(){
        return "users/UserAdd";
    }
    @RequestMapping("add")
    public String add(ModelMap model){
        System.out.println("********");
        List<Types> typesList1 =getTypesListByParentCode(10L);
        List<Types> typesList2 =getTypesListByParentCode(60L);
        model.addAttribute("typesList1",typesList1);
        model.addAttribute("typesList2",typesList2);
        return "users/UserAdd";
    }
    @RequestMapping("update")
    public String update(ModelMap model,Long id){
        System.out.println(id);
        Users user = usersService.getOne(id);
        List<Types> typesList1 =getTypesListByParentCode(10L);
        List<Types> typesList2 =getTypesListByParentCode(60L);
        model.addAttribute("typesList1",typesList1);
        model.addAttribute("typesList2",typesList2);
        model.addAttribute("user",user);
        return "users/UserAdd";
    }

}
