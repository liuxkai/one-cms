package raky.web.admin.RotationImage;


import core.controller.CoreController;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import raky.entity.Files;
import raky.entity.RotationImage;
import raky.entity.Student;
import raky.service.FilesService;
import raky.service.RotationImageService;
import raky.util.LayuiUtil;
import raky.util.Pager;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/rotation")
public class RotationImageController extends CoreController {

    @Autowired
    private RotationImageService rotationImageService;
    @Resource
    private Pager<Student> pager;



    @RequestMapping(value = "/pageList", method = RequestMethod.GET)
    @ResponseBody
    public LayuiUtil<RotationImage> getPageList(RotationImage rotationImage, Integer page, Integer limit) {
        if(page==null){
            page=1;
        }if(limit==null){
            limit=10;
        }
        pager.init(page,limit,rotationImageService.getCount(rotationImage));
        rotationImage.setOffset(pager.getOffset());
        rotationImage.setLimit(pager.getLimit());
        List<RotationImage> rotationImagePageList = rotationImageService.getPageList(rotationImage);
        LayuiUtil layui = LayuiUtil.<RotationImage>builder().data(rotationImagePageList).msg("").code(0).count(Long.valueOf(rotationImageService.getCount(rotationImage))).build();
        return layui;
    }


    @RequestMapping(value = "/insert", method = RequestMethod.GET)
    public String insert(Long id, ModelMap model, RotationImage rotationImage) {
        if(id!=null){
            model.addAttribute("rotation", rotationImageService.getOne(id));

            }
        return "/admin/rotationImage/input.html";
    }


    @RequestMapping(value = "/save",method = {RequestMethod.POST,RequestMethod.GET})
    @ResponseBody
    public String save(@RequestParam(value = "file") MultipartFile files[], HttpServletRequest request, RotationImage rotationImage ){
        try {
            List<Map<String, String>> list = upLoad(files, request);
            for(Map map:list){
                Files file=new Files();
                BeanUtils.populate(file,map);
                rotationImage.setImagePath(file.getSavePath());
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        if(rotationImage.getId()==null){
            int insert = rotationImageService.insert(rotationImage);
            return String.valueOf(insert);
        }
        int update = rotationImageService.update(rotationImage);
        return String.valueOf(update);
    }


    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    @ResponseBody
    public String delete(RotationImage rotationImage){
        rotationImage.setDeleted(1);
        int update = rotationImageService.update(rotationImage);  // 实现假删除
        return String.valueOf(update);
    }

    @RequestMapping(value = "/detailed",method = RequestMethod.GET)
    public String getDetailed(Long id,ModelMap model){
        model.addAttribute("rotation",rotationImageService.getOne(id));
        return "/admin/rotationImage/show.html";
    }


}
