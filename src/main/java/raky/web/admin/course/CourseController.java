package raky.web.admin.course;

import core.controller.CoreController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import raky.entity.Course;
import raky.entity.Types;
import raky.service.CourseService;
import raky.util.Pager;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/course")
public class CourseController extends CoreController {
    private static final Logger logger = LoggerFactory.getLogger(CourseController.class);

    @Autowired
    private CourseService courseService;
    @Resource
    private Pager<Course> pager;

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(Course course) {
        if (course.getId() != null) {
            courseService.update(course);
            return "redirect:/course/pageList";
        }
        courseService.insert(course);
        return "redirect:/course/pageList";

    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(Long id) {
        courseService.delete(id);
        return "redirect:/course/list";
    }

    @RequestMapping(value = "/input", method = RequestMethod.GET)
    public String getOne(Long id, ModelMap model) {
        List<Types> typesList =getTypesListByParentCode(40l);
        model.addAttribute("typesList",typesList);
        if(id!=null){
            model.addAttribute("course", courseService.getOne(id));
            return "/course/edit";
        }
        return "/course/edit";
    }
    @RequestMapping(value = "/detailed",method = RequestMethod.GET)
    public String getDetailed(Long id,ModelMap model){
        List<Types> typesList =getTypesListByParentCode(40l);
        model.addAttribute("course",courseService.getOne(id));
        model.addAttribute("typesList",typesList);
        return "/course/show";
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public Map<String,Object> getList(ModelMap model) {
        List<Course> courseList = courseService.getList(new Course());
        model.addAttribute("courseList", courseList);
        Map<String, Object> map = new HashMap<>();
        map.put("code",0);
        map.put("msg","");
        map.put("data",courseList);
//        map.put("")
        return map;
    }

    @RequestMapping(value = "/pageList", method = RequestMethod.GET)
    public String getPageList(ModelMap model, Course course, Integer requestPage,Integer pageSize) {
        if(requestPage==null){
            requestPage=1;
        }if(pageSize==null){
            pageSize=5;
        }
        pager.init(requestPage, pageSize, courseService.getCount(course));
        course.setOffset(pager.getOffset());
        course.setLimit(pager.getLimit());
        List<Course> coursePageList = courseService.getPageList(course);
        pager.setList(coursePageList);
        pager.setUrl("/course/pageList");
        model.addAttribute("typesList",getTypesListByParentCode(40l));
        model.addAttribute("pager", pager);
        model.addAttribute("course", course);
        return "/course/list";

    }
}