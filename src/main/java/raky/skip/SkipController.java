package raky.skip;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import raky.entity.Users;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/skip")
public class SkipController {

    @RequestMapping(value = "/main")
    public String index(HttpServletRequest request,Model model){
        Users onlinerUser = (Users)request.getSession().getAttribute("OnlinerUser");
        model.addAttribute("onlinerUser",onlinerUser);

        return "html/main";
    }

    @RequestMapping(value = "/main2")
    public String welcome(){
        return "html/welcome.html";
    }
    @RequestMapping(value = "/main3")
    public String student(){
        return "html/student.html";
    }



}
