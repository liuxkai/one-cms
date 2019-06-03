package raky.web.admin.users;

import core.controller.CoreController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import raky.entity.Users;
import raky.service.UsersService;
import raky.util.Pager;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/users")
public class UsersController extends CoreController {

    private static final Logger logger = LoggerFactory.getLogger(UsersController.class);

    @Autowired
    private UsersService usersService;
    @Resource
    private Pager<Users> pager;

    @RequestMapping(value = "/save",method = RequestMethod.POST)
    public String save(Users users){
        if(users.getId()!=null){
            usersService.update(users);
            return "redirect:/users/list";
        }
        usersService.insert(users);
        return "redirect:/users/list";

    }

    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    public String delete(Long id){
        usersService.delete(id);
        return "redirect:/users/list";
    }

    @RequestMapping(value = "/input",method = RequestMethod.GET)
    public String getOne(Long id, ModelMap model){
        logger.info("xxx");
        model.addAttribute("user",usersService.getOne(id));
        return "/admin/users/edit";
    }

    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public String getList(ModelMap model){
        List<Users> usersList = usersService.getList(new Users());
        model.addAttribute("usersList",usersList);
        return "/site/index";
    }
    @RequestMapping(value = "/pageList",method = RequestMethod.GET)
    public String getPageList(ModelMap model,Users users,Integer requestPage){
        if(requestPage==null){
            requestPage=1;
        }
        pager.init(requestPage,2,usersService.getCount(users));
        users.setOffset(pager.getOffset());
        users.setLimit(pager.getLimit());
        List<Users> usersPageList = usersService.getPageList(users);
        pager.setList(usersPageList);
        model.addAttribute("pager",pager);
        model.addAttribute("users",users);
        return "/users/list";
    }

}
