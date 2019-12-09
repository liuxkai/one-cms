package raky.web.admin.ClassData;

import core.controller.CoreController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import raky.entity.ClassDate;

import raky.entity.WebSeo;
import raky.service.ClassDataService;
import raky.util.LayuiUtil;
import raky.util.Pager;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


/**
 * @author atian
 * @version 1.0.0
 * @ClassName ClassDataController.java
 * @Description TODO
 * @createTime 2019年12月09日 21:53:00
 */
@Controller
@RequestMapping("/admin/classData")
public class ClassDataController extends CoreController {
    @Autowired
    private ClassDataService classDataService;
    @Resource
    private Pager<ClassDate> pager;

    @Override
    public void initBinder(WebDataBinder binder) {
        super.initBinder(binder);
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));

    }
    @RequestMapping(value = "/pageList",method = RequestMethod.GET)
    @ResponseBody
    public LayuiUtil getPageList(ModelMap model, ClassDate classDate, Integer page, Integer limit){
        if(page==null){
            page=1;
        }if(limit==null){
            limit=5;
        }
        pager.init(page,limit,classDataService.getCount(classDate));
        classDate.setOffset(pager.getOffset());
        classDate.setLimit(pager.getLimit());
        List<ClassDate> pageList = classDataService.getPageList(classDate);
        LayuiUtil layuiUtil = LayuiUtil.<ClassDate>builder().data(pageList).msg("").code(0).count(Long.valueOf(classDataService.getCount(classDate))).build();
        model.addAttribute("user",classDate);
        return layuiUtil;
    }
    @RequestMapping(value = "/save" )
    @ResponseBody
    public String save(ClassDate classDate, HttpServletRequest request){
        int result ;
        if(classDate.getId()!=null){
            result =  classDataService.update(classDate);
            return String.valueOf(result);
        }
        classDate.setDeleted(0);
        classDate.setLocked(0);
        result = classDataService.insert(classDate);

        return String.valueOf(result);

    }
    @RequestMapping(value = "/delete")
    @ResponseBody
    public String delete(Long id){
        classDataService.delete(id);
        return "1";
    }
    @RequestMapping(value = "/detailed",method = {RequestMethod.POST,RequestMethod.GET})
    public String getDetailed(Long id,Model model){
        model.addAttribute("class",classDataService.getOne(id));
        return "admin/ClassDate/show";
    }
    @RequestMapping("addClass")
    public String addUser(){
        return "/admin/ClassDate/input";
    }
    @RequestMapping("update")
    public String update(Long id, Model model){
        model.addAttribute("class",classDataService.getOne(id));
        return "/admin/ClassDate/input";
    }
}
