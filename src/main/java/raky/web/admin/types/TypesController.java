package raky.web.admin.types;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import raky.entity.Types;
import raky.service.TypesService;
import raky.util.Pager;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/types")
public class TypesController {
    private static final Logger logger = LoggerFactory.getLogger(TypesController.class);

    @Autowired
    private TypesService typesService;
    @Resource
    private Pager<Types> pager;
    @RequestMapping(value = "/save",method = RequestMethod.POST)
    public String save(Types types){
        if(types.getId()!=null){
            typesService.update(types);
            return "redirect:/types/pageList";
        }
        typesService.insert(types);
        return "redirect:/types/pageList";

    }

    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    public String delete(Long id){
        typesService.delete(id);
        return "redirect:/types/list";
    }

    @RequestMapping(value = "/input",method = RequestMethod.GET)
    public String getOne(ModelMap model, Types types){
        logger.info(typesService.getOne(types.getId()).toString());
        model.addAttribute("type",typesService.getOne(types.getId()));
        types.setId(0l);
        model.addAttribute("parentType",typesService.getList(types));
        return "/types/edit";
    }
    @RequestMapping(value = "/detailed",method = RequestMethod.GET)
    public String getDetailed(Long id,ModelMap model){
        model.addAttribute("type",typesService.getOne(id));
        return "/types/show";
    }

    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public String getList(ModelMap model){
        List<Types> typesList = typesService.getList(new Types());
        model.addAttribute("typesList",typesList);
        return "/types/list";
    }
    @RequestMapping(value = "/pageList", method = RequestMethod.GET)
    public String getPageList(ModelMap model, Types types, Integer requestPage) {
        if (requestPage == null) {
            requestPage = 1;
        }
        pager.init(requestPage, 2, typesService.getCount(types));
        types.setOffset(pager.getOffset());
        types.setLimit(pager.getLimit());
        List<Types> typesPageList = typesService.getPageList(types);
        pager.setList(typesPageList);
        model.addAttribute("pager", pager);
        model.addAttribute("types", types);
        return "/types/list";

    }
}
