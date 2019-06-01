package raky.web.admin.users;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import raky.entity.Users;
import raky.service.UsersService;

import java.util.List;

@Controller
@RequestMapping("/users")
public class UsersController {

    private static final Logger logger = LoggerFactory.getLogger(UsersController.class);

    @Autowired
    private UsersService usersService;

    @RequestMapping(value = "/save",method = RequestMethod.POST)
    public String save(Users users){
        if(users.getId()!=null){
            usersService.update(users);
            return "redirect:";
        }
        usersService.insert(users);
        return "redirect:";

    }

    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    public String delete(Long id){
        usersService.delete(id);
        return "redirect:/list";
    }

    @RequestMapping(value = "/input",method = RequestMethod.GET)
    public String getOne(Long id, ModelMap model){
        logger.info("xxx");
        model.addAttribute("user",usersService.getOne(id));
        return "/index";
    }

    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public String getList(ModelMap model){
        List<Users> usersList = usersService.getList(new Users());
        model.addAttribute("usersList",usersList);
        return "/users/list";
    }

}
