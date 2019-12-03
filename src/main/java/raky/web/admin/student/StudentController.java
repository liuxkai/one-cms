package raky.web.admin.student;

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
import raky.entity.Student;
import raky.service.FilesService;
import raky.service.StudentService;
import raky.util.Pager;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/student")
public class StudentController extends CoreController {
    private static final Logger logger = LoggerFactory.getLogger(StudentController.class);

    @Autowired
    private StudentService studentService;
    @Resource
    private Pager<Student> pager;
    @Resource
    private FilesService filesService;




    @RequestMapping(value = "/save",method = {RequestMethod.POST,RequestMethod.GET})
    public String save(@RequestParam(value = "file") MultipartFile files[], HttpServletRequest request,Student student ){
        try {
            List<Map<String, String>> list = upLoad(files, request);
            List<Files> filesList=new ArrayList<>();
            for(Map map:list){
                Files file=new Files();
                BeanUtils.populate(file,map);
                filesList.add(file);
            }
                student.setFilesList(filesList);
        }catch (Exception e) {
                e.printStackTrace();
        }
        if(student.getId()==null){
            studentService.insert(student);
            return "redirect:/student/pageList";
        }
        studentService.update(student);
        return "redirect:/student/pageList";
    }
    @RequestMapping(value = "/change",method = RequestMethod.POST)
    @ResponseBody
    public String change(Student student){
        int result = studentService.update(student);
        if(result==1){
            return "success";
        }
        return "";
    }

    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    public String delete(Long id){
        studentService.delete(id);
        return "redirect:/student/list";
    }

    @RequestMapping(value = "/input",method = RequestMethod.GET)
    public String getOne(Long id, ModelMap model){
        Files files=new Files();
        files.setLinkId(id);
        files.setLinkTable("学生管理表");
        model.addAttribute("student",studentService.getOne(id));
        model.addAttribute("filesList",filesService.getList(files));
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
    public String getPageList(ModelMap model, Student student, Integer requestPage,Integer pageSize) {
        if(requestPage==null){
            requestPage=1;
        }if(pageSize==null){
            pageSize=5;
        }
        pager.init(requestPage, pageSize, studentService.getCount(student));
        student.setOffset(pager.getOffset());
        student.setLimit(pager.getLimit());
        List<Student> studentPageList = studentService.getPageList(student);
        pager.setList(studentPageList);
        pager.setUrl("/student/pageList");
        model.addAttribute("pager", pager);
        model.addAttribute("student", student);
        return "/student/list";

    }
}
