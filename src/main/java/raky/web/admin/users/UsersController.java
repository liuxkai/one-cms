package raky.web.admin.users;

import core.controller.CoreController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import raky.entity.Types;
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
            return "redirect:/users/pageList";
        }
        usersService.insert(users);
        return "redirect:/users/pageList";

    }

    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    public String delete(Long id){
        usersService.delete(id);
        return "redirect:/users/list";
    }

    @RequestMapping(value = "/input",method = RequestMethod.GET)
    public String getOne(Long id, ModelMap model){
        List<Types> typesList1 =getTypesListByParentCode(10l);
        List<Types> typesList2 =getTypesListByParentCode(60l);
        model.addAttribute("typesList1",typesList1);
        model.addAttribute("typesList2",typesList2);
        if(id!=null){
            model.addAttribute("user",usersService.getOne(id));
            return "/users/edit";
        }
        return "/users/edit";
    }
    @RequestMapping(value = "/detailed",method = RequestMethod.GET)
    public String getDetailed(Long id,ModelMap model){
        List<Types> typesList1 =getTypesListByParentCode(10l);
        List<Types> typesList2 =getTypesListByParentCode(60l);
        model.addAttribute("typesList1",typesList1);
        model.addAttribute("typesList2",typesList2);
        model.addAttribute("user",usersService.getOne(id));
        return "/users/show";
    }

    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public String getList(ModelMap model){
        List<Users> usersList = usersService.getList(new Users());
        model.addAttribute("usersList",usersList);
        return "/users/list";
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
