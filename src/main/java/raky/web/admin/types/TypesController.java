package raky.web.admin.types;

import core.controller.CoreController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import raky.entity.Types;
import raky.service.TypesService;
import raky.util.Pager;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/admin/types")
public class TypesController extends CoreController {
    private static final Logger logger = LoggerFactory.getLogger(TypesController.class);

    @Autowired
    private TypesService typesService;
    @Resource
    private Pager<Types> pager;
    @RequestMapping(value = "/save",method = RequestMethod.POST)
    public String save(Types types){
        if(types.getId()!=null){
            Long typeCode=((getTypesListByParentCode(types.getParentCode()).size()+1)*3)+types.getParentCode()*10;
            types.setTypeCode(typeCode.intValue());
            typesService.update(types);

            return "redirect:/admin/types/pageList";
        }
        if(types.getParentCode()==0){
            types.setTypeCode((getTypesListByParentCode(types.getParentCode()).size()+1)*10);
        }else {
            logger.info("parentCode=="+types.getParentCode());
            logger.info("parent=="+types.toString());
            types.setTypeCode(types.getParentCode().intValue()*10+((typesService.getCount(types)+1))*3);
        }
        typesService.insert(types);
        return "redirect:/admin/types/pageList";

    }

    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    public String delete(Long id){
        typesService.delete(id);
        return "redirect:/admin/types/list";
    }

    @RequestMapping(value = "/change",method = RequestMethod.POST)
    @ResponseBody
    public String change(Types types){
        int result = typesService.update(types);
        if(result==1){
            return "success";
        }
        return "";
    }

    @RequestMapping(value = "/input",method = RequestMethod.GET)
    public String getOne(ModelMap model, Long id){
        Types type = typesService.getOne(id);
        model.addAttribute("type",type);
        if(type.getParentCode()!=0){
            model.addAttribute("parentTypeList",getTypesListByParentCode(0l));
            return "/admin/types/edit";
        }
        return "/admin/types/edit";
    }
    @RequestMapping(value = "/add",method = RequestMethod.GET)
    public String getType(ModelMap model){
        model.addAttribute("parentTypeList",getTypesListByParentCode(0l));
        return "/admin/types/add";
    }

    @RequestMapping(value = "/detailed",method = RequestMethod.GET)
    public String getDetailed(Long id,ModelMap model){
        model.addAttribute("type",typesService.getOne(id));
        return "/admin/types/show";
    }

    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public String getList(ModelMap model){
        List<Types> typesList = typesService.getList(new Types());
        model.addAttribute("typesList",typesList);
        return "/admin/types/list";
    }
    @RequestMapping(value = "/pageList", method = RequestMethod.GET)
    public String getPageList(ModelMap model, Types types, Integer requestPage,Integer pageSize) {
        if(requestPage==null){
            requestPage=1;
        }if(pageSize==null){
            pageSize=5;
        }
        pager.init(requestPage, pageSize, getTypesListByParentCode(0l).size());
        types.setOffset(pager.getOffset());
        types.setLimit(pager.getLimit());
        types.setParentCode(0l);
        List<Types> typesPageList = typesService.getPageList(types);
        pager.setList(typesPageList);
        pager.setUrl("/types/pageList");
        model.addAttribute("pager", pager);
        model.addAttribute("types", types);
        return "/admin/types/list";

    }
    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String getTypes(Long parentCode,ModelMap model){
        List<Types> types = getTypesListByParentCode(20l);
        logger.info(types.toString());
        model.addAttribute("types", types);
        return "/index";
    }

}
