package raky.web.admin.course;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import raky.entity.Course;
import raky.service.CourseService;

import java.util.List;

@RestController
@RequestMapping("/course")
public class CourseController {
    private static final Logger logger = LoggerFactory.getLogger(CourseController.class);

    @Autowired
    private CourseService courseService;

    @RequestMapping(value = "/save",method = RequestMethod.POST)
    public String save(Course course){
        if(course.getId()!=null){
            courseService.update(course);
            return "redirect:";
        }
        courseService.insert(course);
        return "redirect:";

    }

    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    public String delete(Long id){
        courseService.delete(id);
        return "redirect:";
    }

    @RequestMapping(value = "/input",method = RequestMethod.GET)
    public String getOne(Long id, ModelMap model){
        model.addAttribute("course",courseService.getOne(id));
        return "";
    }

    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public String getList(ModelMap model){
        List<Course> courseList = courseService.getList(new Course());
        model.addAttribute("courseList",courseList);
        return "";
    }
}
