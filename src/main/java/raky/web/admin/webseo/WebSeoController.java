package raky.web.admin.webseo;

import core.controller.CoreController;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import raky.entity.Files;
import raky.entity.Types;
import raky.entity.Users;
import raky.entity.WebSeo;
import raky.service.WebSeoService;
import raky.util.LayuiUtil;
import raky.util.Pager;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author atian
 * @version 1.0.0
 * @ClassName WebSeoController.java
 * @Description TODO
 * @createTime 2019年12月09日 18:18:00
 */
@Controller
@RequestMapping("/admin/webseo")
public class WebSeoController extends CoreController {
    @Autowired
    private WebSeoService webSeoService;
    @Resource
    private Pager<WebSeo> pager;

    @RequestMapping(value = "/pageList",method = RequestMethod.GET)
    @ResponseBody
    public LayuiUtil getPageList(ModelMap model, WebSeo webSeo, Integer page, Integer limit){
        if(page==null){
            page=1;
        }if(limit==null){
            limit=5;
        }
        pager.init(page,limit,webSeoService.getCount(webSeo));
        webSeo.setOffset(pager.getOffset());
        webSeo.setLimit(pager.getLimit());
        List<WebSeo> usersPageList = webSeoService.getPageList(webSeo);
        LayuiUtil layuiUtil = LayuiUtil.<WebSeo>builder().data(usersPageList).msg("").code(0).count(Long.valueOf(webSeoService.getCount(webSeo))).build();
        model.addAttribute("user",webSeo);
        return layuiUtil;
    }
    @RequestMapping(value = "/save" )
    @ResponseBody
    public String save(WebSeo webSeo, HttpServletRequest request){
        int result ;
        if(webSeo.getId()!=null){
            result =  webSeoService.update(webSeo);
            return String.valueOf(result);
        }
        webSeo.setDeleted(0);
        webSeo.setLocked(0);
        result = webSeoService.insert(webSeo);

        return String.valueOf(result);

    }
    @RequestMapping(value = "/delete")
    @ResponseBody
    public String delete(Long id){
        webSeoService.delete(id);
        return "1";
    }
    @RequestMapping(value = "/detailed",method = {RequestMethod.POST,RequestMethod.GET})
    public String getDetailed(Long id,Model model){
        model.addAttribute("web",webSeoService.getOne(id));
        return "admin/webseo/show";
    }
    @RequestMapping("addUser")
    public String addUser(){
        return "/admin/webseo/input";
    }
    @RequestMapping("update")
    public String update(Long id, Model model){
        model.addAttribute("webSeo",webSeoService.getOne(id));
        return "/admin/webseo/input";
    }
}
