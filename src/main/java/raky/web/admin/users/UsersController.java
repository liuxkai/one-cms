package raky.web.admin.users;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import raky.entity.Users;
import raky.service.UsersService;

import java.util.List;

@RestController
@RequestMapping("/users")
public class UsersController {

    private static final Logger logger = LoggerFactory.getLogger(UsersController.class);

    @Autowired
    private UsersService usersService;

    @RequestMapping(value = "/insert",method = RequestMethod.POST)
    public String insert(@RequestParam(value = "user_name",required = true)String user_name,
                         @RequestParam(value = "pass_word" ,required = true)String pass_word){
        Users users = new Users();
        users.setUser_name(user_name);
        users.setPass_word(pass_word);

        int result = usersService.insert(users);
        if(result == 1){
            return "success";
        }else {
            return "failure";
        }
    }

    @RequestMapping(value = "/update/{id}",method = RequestMethod.POST) //RequestMethod.PUT
    public String update(@PathVariable("id")int id , @RequestParam(value = "user_name",required = true)String user_name,
                         @RequestParam(value = "pass_word" ,required = true)String pass_word){
        Users users = new Users();
        users.setId(id);
        users.setUser_name(user_name);
        users.setPass_word(pass_word);

        int result = usersService.update(users);
        if(result == 1){
            return "success";
        }else {
            return "failure";
        }

    }

    @RequestMapping(value = "/delete/{id}",method = RequestMethod.GET)
    public int delete(@PathVariable("id") int id){
        return usersService.delete(id);
    }

    @RequestMapping(value = "/edit/{id}",method = RequestMethod.GET)
    public Users getOne(@PathVariable("id") int id){
        return usersService.getOne(id);
    }

    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public String getList(){
        List<Users> usersList = usersService.getList(new Users());
        logger.info("list ====> {}",usersList.size());
        return "success";
    }
}
