package raky.web.admin.student;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import raky.entity.Student;
import raky.service.StudentService;

import java.util.List;

@RestController
@RequestMapping("/student")
public class StudentController {
    private static final Logger logger = LoggerFactory.getLogger(StudentController.class);

    @Autowired
    private StudentService studentService;

    @RequestMapping(value = "/save",method = RequestMethod.POST)
    public String save(Student student){
        if(student.getId()!=null){
            studentService.update(student);
            return "redirect:";
        }
        studentService.insert(student);
        return "redirect:";

    }

    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    public String delete(Long id){
        studentService.delete(id);
        return "redirect:";
    }

    @RequestMapping(value = "/input",method = RequestMethod.GET)
    public String getOne(Long id, ModelMap model){
        model.addAttribute("student",studentService.getOne(id));
        return "";
    }

    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public String getList(ModelMap model){
        List<Student> studentList = studentService.getList(new Student());
        model.addAttribute("studentList",studentList);
        return "";
    }
}
