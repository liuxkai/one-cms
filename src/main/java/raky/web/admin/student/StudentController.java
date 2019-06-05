package raky.web.admin.student;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import raky.entity.Student;
import raky.service.StudentService;
import raky.util.Pager;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/student")
public class StudentController {
    private static final Logger logger = LoggerFactory.getLogger(StudentController.class);

    @Autowired
    private StudentService studentService;
    @Resource
    private Pager<Student> pager;

    @RequestMapping(value = "/save",method = RequestMethod.POST)
    public String save(Student student){
        if(student.getId()!=null){
            studentService.update(student);
            return "redirect:/student/pageList";
        }
        studentService.insert(student);
        return "redirect:/student/pageList";

    }

    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    public String delete(Long id){
        studentService.delete(id);
        return "redirect:/student/list";
    }

    @RequestMapping(value = "/input",method = RequestMethod.GET)
    public String getOne(Long id, ModelMap model){
        model.addAttribute("student",studentService.getOne(id));
        return "/student/edit";
    }

    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public String getList(ModelMap model){
        List<Student> studentList = studentService.getList(new Student());
        model.addAttribute("studentList",studentList);
        return "/student/list";
    }
    @RequestMapping(value = "/detailed",method = RequestMethod.GET)
    public String getDetailed(Long id,ModelMap model){
        model.addAttribute("student",studentService.getOne(id));
        return "/student/show";
    }
    @RequestMapping(value = "/pageList", method = RequestMethod.GET)
    public String getPageList(ModelMap model, Student student, Integer requestPage) {
        if (requestPage == null) {
            requestPage = 1;
        }
        pager.init(requestPage, 2, studentService.getCount(student));
        student.setOffset(pager.getOffset());
        student.setLimit(pager.getLimit());
        List<Student> studentPageList = studentService.getPageList(student);
        pager.setList(studentPageList);
        model.addAttribute("pager", pager);
        model.addAttribute("student", student);
        return "/student/list";

    }
}
