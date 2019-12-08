package raky.web.admin.teacher;

import core.controller.CoreController;
import org.apache.commons.beanutils.BeanUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import raky.entity.Course;
import raky.entity.Files;
import raky.entity.Teacher;
import raky.entity.Types;
import raky.service.FilesService;
import raky.service.TeacherService;
import raky.util.LayuiUtil;
import raky.util.Pager;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

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

    @Override
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    @RequestMapping(value = "/save",method = RequestMethod.POST)
    @ResponseBody
    public int save(@RequestParam(value = "file") MultipartFile files[], HttpServletRequest request, Teacher teacher){
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
            int update = teacherService.update(teacher);
            return update;
        }
        int insert = teacherService.insert(teacher);
        return insert;

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
    @ResponseBody
    public String delete(Long id){
        teacherService.delete(id);
        return "1";
    }

    @RequestMapping(value = "/deleteAll", method = RequestMethod.GET)
    @ResponseBody
    public String deleteAll(String arrayId) {
        String[] split = arrayId.substring(1,arrayId.length()-1).split(",");
        List<Long> someId = new ArrayList<>();
        for (int i = 0; i < split.length; i++) {
            someId.add(Long.valueOf(split[i]));
        }
        teacherService.deleteAll(someId);
        return "1";
    }

    @RequestMapping(value = "/input",method = RequestMethod.GET)
    public String getOne(Long id, ModelMap model){
//        Files files=new Files();
//        files.setLinkId(id);
//        files.setLinkTable("教师管理表");
        List<Types> typesList =getTypesListByParentCode(60L);
        model.addAttribute("typesList",typesList);
        if(id!=null){
            model.addAttribute("teacher",teacherService.getOne(id));
//            model.addAttribute("filesList",filesService.getList(files));
            return "/teacher/edit.html";
        }
        return "/teacher/edit.html";
    }
    @RequestMapping(value = "/detailed",method = RequestMethod.GET)
    public String getDetailed(Long id,ModelMap model){
        List<Types> typesList =getTypesListByParentCode(60l);
        model.addAttribute("typesList",typesList);
        model.addAttribute("teacher",teacherService.getOne(id));
        return "/teacher/detail.html";
    }
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public String getList(ModelMap model){
        List<Teacher> teacherList = teacherService.getList(new Teacher());
        model.addAttribute("teacherList",teacherList);
        return "/teacher/list";
    }
    @RequestMapping(value = "/pageList", method = RequestMethod.GET)
    @ResponseBody
    public LayuiUtil<Course> getPageList(Teacher teacher, Integer page, Integer limit) {
        if(page==null){
            page=1;
        }if(limit==null){
            limit=10;
        }
        teacher.setPositions((teacher.getPositions() != null && !teacher.getPositions().equals("")) ? teacher.getPositions() : null);
        teacher.setName((teacher.getName() != null && !teacher.getName().equals("")) ? teacher.getName() : null);
        pager.init(page, limit, teacherService.getCount(teacher));
        teacher.setOffset(pager.getOffset());
        teacher.setLimit(pager.getLimit());
        List<Teacher> teacherPageList = teacherService.getPageList(teacher);
        LayuiUtil layui = LayuiUtil.<Teacher>builder().data(teacherPageList).msg("教师信息").code(0).count(Long.valueOf(teacherService.getCount(teacher))).build();
        return layui;
    }
}
