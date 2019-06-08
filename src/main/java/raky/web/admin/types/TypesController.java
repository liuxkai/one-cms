package raky.web.admin.types;

import core.controller.CoreController;
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
public class TypesController extends CoreController {
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
        if(types.getParentCode()==0){
            types.setTypeCode((getTypesListByParentCode(types.getParentCode()).size()+1)*10);
        }else {
            logger.info("parentCode=="+types.getParentCode());
            logger.info("parent=="+types.toString());
            types.setTypeCode(types.getParentCode().intValue()*10+(typesService.getCount(types)+1));
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
    public String getOne(ModelMap model, Long id){
        Types type = typesService.getOne(id);
        model.addAttribute("type",type);
        if(type.getParentCode()!=0){
            List<Types> typesList = typesService.getList(type);
            model.addAttribute("parentTypeList",getTypesListByParentCode(type.getParentCode()));
            model.addAttribute("typesList",typesList);
            return "/types/edit";
        }
        return "/types/edit";
    }
    @RequestMapping(value = "/add",method = RequestMethod.GET)
    public String getType(ModelMap model, Long id){
        Types type = typesService.getOne(id);
        model.addAttribute("parentTypeList",getTypesListByParentCode(0l));
        return "/types/add";
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
        pager.init(requestPage, 7, getTypesListByParentCode(0l).size());
        types.setOffset(pager.getOffset());
        types.setLimit(pager.getLimit());
        types.setParentCode(0l);
        List<Types> typesPageList = typesService.getPageList(types);
        pager.setList(typesPageList);
        model.addAttribute("pager", pager);
        model.addAttribute("types", types);
        return "/types/list";

    }
    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String getTypes(Long parentCode,ModelMap model){
        List<Types> types = getTypesListByParentCode(20l);
        logger.info(types.toString());
        model.addAttribute("types", types);
        return "/index";
    }

}
