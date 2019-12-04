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

    @RequestMapping(value = "/courseList")
    public String courseList(ModelMap model){
        List<Types> typesList =getTypesListByParentCode(40l);
        //集合去重
        List<Types> unique = typesList.stream().collect(
                Collectors.collectingAndThen(
                        Collectors.toCollection(() -> new TreeSet<>(Comparator.comparing(Types::getTypeName))), ArrayList::new)
        );
        model.addAttribute("typesList",unique);
        return "course/list.html";
    }



}
