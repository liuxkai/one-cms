package raky.web.admin.teacher;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import raky.entity.Teacher;
import raky.service.TeacherService;
import raky.util.Pager;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/teacher")
public class TeacherController {
    private static final Logger logger = LoggerFactory.getLogger(TeacherController.class);

    @Autowired
    private TeacherService teacherService;
    @Resource
    private Pager<Teacher> pager;
    @RequestMapping(value = "/save",method = RequestMethod.POST)
    public String save(Teacher teacher){
        if(teacher.getId()!=null){
            teacherService.update(teacher);
            return "redirect:/teacher/pageList";
        }
        teacherService.insert(teacher);
        return "redirect:/teacher/pageList";

    }

    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    public String delete(Long id){
        teacherService.delete(id);
        return "redirect:/teacher/list";
    }

    @RequestMapping(value = "/input",method = RequestMethod.GET)
    public String getOne(Long id, ModelMap model){
        model.addAttribute("teacher",teacherService.getOne(id));
        return "/teacher/edit";
    }
    @RequestMapping(value = "/detailed",method = RequestMethod.GET)
    public String getDetailed(Long id,ModelMap model){
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
    public String getPageList(ModelMap model, Teacher teacher, Integer requestPage) {
        if (requestPage == null) {
            requestPage = 1;
        }
        pager.init(requestPage, 2, teacherService.getCount(teacher));
        teacher.setOffset(pager.getOffset());
        teacher.setLimit(pager.getLimit());
        List<Teacher> teacherPageList = teacherService.getPageList(teacher);
        pager.setList(teacherPageList);
        model.addAttribute("pager", pager);
        model.addAttribute("course", teacher);
        return "/teacher/list";

    }
}
