package raky.skip;


import core.controller.CoreController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import raky.entity.Types;
import raky.entity.Users;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.TreeSet;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/skip")
public class SkipController extends CoreController {

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

    @RequestMapping(value = "/editor")
    public String editor(){
        return "html/editor.html";
    }

    @RequestMapping(value = "/userList")
    public String userList(){
        return "users/user.html";
    }

    @RequestMapping(value = "/courseList")
    public String courseList(ModelMap model){
        List<Types> typesList =getTypesListByParentCode(40l);
        model.addAttribute("typesList",typesList);
        return "course/list.html";
    }

    @RequestMapping(value = "/teacherList")
    public String teacherList(ModelMap model){
        List<Types> typesList =getTypesListByParentCode(60l);
        model.addAttribute("typesList",typesList);
        return "teacher/list.html";
    }

    @RequestMapping(value = "/newsList")
    public String newsList(ModelMap model){
        List<Types> typesList =getTypesListByParentCode(20l);
        model.addAttribute("typesList",typesList);
        return "news/list.html";
    }

}
