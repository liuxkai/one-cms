package raky.web.admin.course;

import core.controller.CoreController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import raky.entity.Course;
import raky.entity.Types;
import raky.service.CourseService;
import raky.util.LayuiUtil;
import raky.util.Pager;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
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
    @ResponseBody
    public String save(Course course) {
        System.out.println(course+"================");
        if (course.getId() != null) {
            courseService.update(course);
            return "1";
        }
        courseService.insert(course);
        return "1";

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
        }
        return "/course/edit.html";
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
    public Map<String,Object> getList(Integer page, Integer limit,HttpServletRequest request) {
//        ServletContext context = request.getServletContext();
//        Integer page = (Integer) context.getAttribute("page");
//        Integer limit = (Integer) context.getAttribute("limit");
        System.out.println(page+"==========CourseController============"+limit);
        List<Course> courseList = courseService.getList(new Course());
        int count = courseService.getCount(new Course());
        Map<String, Object> map = new HashMap<>();
        map.put("code",0);
        map.put("msg","");
        map.put("data",courseList);
        map.put("count", count);
        return map;
    }

    @RequestMapping(value = "/pageList", method = RequestMethod.GET)
    @ResponseBody
    public LayuiUtil<Course> getPageList(ModelMap model, Course course, Integer page, Integer limit) {
        pager.init(page, limit, courseService.getCount(course));
        course.setOffset(pager.getOffset());
        course.setLimit(pager.getLimit());
        List<Course> coursePageList = courseService.getPageList(course);
        LayuiUtil layui = LayuiUtil.<Course>builder().data(coursePageList).msg("").code(0).count(Long.valueOf(courseService.getCount(course))).build();
        model.addAttribute("typesList",getTypesListByParentCode(40L));
        model.addAttribute("course", course);
        return layui;

    }
}