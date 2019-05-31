package raky.web.admin.users;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import raky.entity.Users;
import raky.service.UsersService;

import java.util.List;

@RestController
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

    @RequestMapping(value = "/delete/{id}",method = RequestMethod.GET)
    public String delete(@PathVariable("id") Long id){
        usersService.delete(id);
        return "redirect:";
    }

    @RequestMapping(value = "/input",method = RequestMethod.GET)
    public ModelAndView getOne(Long id, ModelMap model){
        model.put("user",usersService.getOne(id));
        return new ModelAndView("",model);
    }

    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public ModelAndView getList(ModelMap model){
        List<Users> usersList = usersService.getList(new Users());
        return new ModelAndView("",model);
    }


//    @RequestMapping(value = "/update/{id}",method = RequestMethod.POST) //RequestMethod.PUT
//    public String update(@PathVariable("id")Long id , @RequestParam(value = "user_name",required = true)String user_name,
//                         @RequestParam(value = "pass_word" ,required = true)String pass_word){
//
//        return null;
//    }
}
