package raky.skip;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/skip")
public class SkipController {

    @RequestMapping(value = "/main")
    public String index(){
        return "html/main.html";
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
