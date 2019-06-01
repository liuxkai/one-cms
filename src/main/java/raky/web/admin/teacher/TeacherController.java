package raky.web.admin.teacher;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import raky.entity.Teacher;
import raky.service.TeacherService;

import java.util.List;

@RestController
@RequestMapping("/teacher")
public class TeacherController {
    private static final Logger logger = LoggerFactory.getLogger(TeacherController.class);

    @Autowired
    private TeacherService teacherService;

    @RequestMapping(value = "/save",method = RequestMethod.POST)
    public String save(Teacher teacher){
        if(teacher.getId()!=null){
            teacherService.update(teacher);
            return "redirect:";
        }
        teacherService.insert(teacher);
        return "redirect:";

    }

    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    public String delete(Long id){
        teacherService.delete(id);
        return "redirect:";
    }

    @RequestMapping(value = "/input",method = RequestMethod.GET)
    public String getOne(Long id, ModelMap model){
        model.addAttribute("teacher",teacherService.getOne(id));
        return "";
    }

    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public String getList(ModelMap model){
        List<Teacher> teacherList = teacherService.getList(new Teacher());
        model.addAttribute("teacherList",teacherList);
        return "";
    }
}
