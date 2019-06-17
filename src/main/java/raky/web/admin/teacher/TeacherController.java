package raky.web.admin.teacher;

import core.controller.CoreController;
import org.apache.commons.beanutils.BeanUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import raky.entity.Files;
import raky.entity.Teacher;
import raky.entity.Types;
import raky.service.FilesService;
import raky.service.TeacherService;
import raky.util.Pager;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/teacher")
public class TeacherController extends CoreController {
    private static final Logger logger = LoggerFactory.getLogger(TeacherController.class);

    @Resource
    private FilesService filesService;
    @Autowired
    private TeacherService teacherService;
    @Resource
    private Pager<Teacher> pager;

    @RequestMapping(value = "/save",method = RequestMethod.POST)
    public String save(@RequestParam("file") MultipartFile files[], HttpServletRequest request, Teacher teacher){
        List<Files> filesList=new ArrayList<>();
        List<Map<String,String>> list = upLoad(files, request);
        for (Map<String,String> map:list){
            try {
                Files file=new Files();
                BeanUtils.populate(file,map);
                filesList.add(file);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        teacher.setFilesList(filesList);
        if(teacher.getId()!=null){
            teacherService.update(teacher);
            return "redirect:/teacher/pageList";
        }
        teacherService.insert(teacher);
        return "redirect:/teacher/pageList";

    }

    @RequestMapping(value = "/change",method = RequestMethod.POST)
    @ResponseBody
    public String change(Teacher teacher){
        logger.info(teacher.toString());
        int result = teacherService.update(teacher);
        if(result==1){
            return "success";
        }
        return "";
    }

    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    public String delete(Long id){
        teacherService.delete(id);
        return "redirect:/teacher/list";
    }

    @RequestMapping(value = "/input",method = RequestMethod.GET)
    public String getOne(Long id, ModelMap model){
        Files files=new Files();
        files.setLinkId(id);
        files.setLinkTable("教师管理表");
        List<Types> typesList =getTypesListByParentCode(60l);
        model.addAttribute("typesList",typesList);
        if(id!=null){
            model.addAttribute("teacher",teacherService.getOne(id));
            model.addAttribute("filesList",filesService.getList(files));
            return "/teacher/edit";
        }
        return "/teacher/edit";
    }
    @RequestMapping(value = "/detailed",method = RequestMethod.GET)
    public String getDetailed(Long id,ModelMap model){
        List<Types> typesList =getTypesListByParentCode(60l);
        model.addAttribute("typesList",typesList);
        model.addAttribute("teacher",teacherService.getOne(id));
        return "/teacher/show";
    }
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public String getList(ModelMap model){
        List<Teacher> teacherList = teacherService.getList(new Teacher());
        model.addAttribute("teacherList",teacherList);
        return "/teacher/list";
    }
    @RequestMapping(value = "/pageList", method = RequestMethod.GET)
    public String getPageList(ModelMap model, Teacher teacher, Integer requestPage,Integer pageSize) {
        if(requestPage==null){
            requestPage=1;
        }if(pageSize==null){
            pageSize=5;
        }
        pager.init(requestPage, pageSize, teacherService.getCount(teacher));
        teacher.setOffset(pager.getOffset());
        teacher.setLimit(pager.getLimit());
        List<Teacher> teacherPageList = teacherService.getPageList(teacher);
        pager.setList(teacherPageList);
        pager.setUrl("/teacher/pageList");
        model.addAttribute("pager", pager);
        model.addAttribute("course", teacher);
        return "/teacher/list";

    }
}
