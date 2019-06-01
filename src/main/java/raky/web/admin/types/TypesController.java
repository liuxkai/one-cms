package raky.web.admin.types;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import raky.entity.Types;
import raky.service.TypesService;

import java.util.List;

@RestController
@RequestMapping("/types")
public class TypesController {
    private static final Logger logger = LoggerFactory.getLogger(TypesController.class);

    @Autowired
    private TypesService typesService;

    @RequestMapping(value = "/save",method = RequestMethod.POST)
    public String save(Types types){
        if(types.getId()!=null){
            typesService.update(types);
            return "redirect:";
        }
        typesService.insert(types);
        return "redirect:";

    }

    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    public String delete(Long id){
        typesService.delete(id);
        return "redirect:";
    }

    @RequestMapping(value = "/input",method = RequestMethod.GET)
    public String getOne(Long id, ModelMap model){
        model.addAttribute("type",typesService.getOne(id));
        return "";
    }

    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public String getList(ModelMap model){
        List<Types> typesList = typesService.getList(new Types());
        model.addAttribute("typesList",typesList);
        return "";
    }
}
