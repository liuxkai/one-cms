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
import java.util.*;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/admin/course")
public class CourseController extends CoreController {
    private static final Logger logger = LoggerFactory.getLogger(CourseController.class);

    @Autowired
    private CourseService courseService;
    @Resource
    private Pager<Course> pager;

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public int save(Course course) {
        if (course.getId() != null) {
            int update = courseService.update(course);
            return update;
        }
        int insert = courseService.insert(course);
        return insert;

    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    @ResponseBody
    public String delete(Long id) {
        courseService.delete(id);
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
        courseService.deleteAll(someId);
        return "1";
    }

    @RequestMapping(value = "/input", method = RequestMethod.GET)
    public String getOne(Long id, ModelMap model) {
        List<Types> typesList =getTypesListByParentCode(40L);
        model.addAttribute("typesList",typesList);
        if(id!=null){
            model.addAttribute("course", courseService.getOne(id));
        }
        return "/admin/course/input.html";
    }
    @RequestMapping(value = "/detailed",method = RequestMethod.GET)
    public String getDetailed(Long id,ModelMap model){
        List<Types> typesList =getTypesListByParentCode(40L);
        model.addAttribute("typesList",typesList);
        model.addAttribute("course",courseService.getOne(id));
        return "/admin/course/show.html";
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public Map<String,Object> getList(Integer page, Integer limit,HttpServletRequest request) {
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
    public LayuiUtil<Course> getPageList(Course course, Integer page, Integer limit) {
        if(page==null){
            page=1;
        }if(limit==null){
            limit=10;
        }
        course.setCourseType((course.getCourseType() != null && !course.getCourseType().equals("")) ? course.getCourseType() : null);
        course.setCourseName((course.getCourseName() != null && !course.getCourseName().equals("")) ? course.getCourseName() : null);
        pager.init(page, limit, courseService.getCount(course));
        course.setOffset(pager.getOffset());
        course.setLimit(pager.getLimit());
        List<Course> coursePageList = courseService.getPageList(course);
        LayuiUtil layui = LayuiUtil.<Course>builder().data(coursePageList).msg("课程信息").code(0).count(Long.valueOf(courseService.getCount(course))).build();
        return layui;

    }
}