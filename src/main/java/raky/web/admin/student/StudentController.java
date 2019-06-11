package raky.web.admin.student;

import core.controller.CoreController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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

    @RequestMapping(value = "/save",method = RequestMethod.POST)
    public String save(@RequestParam("file") MultipartFile files[], HttpServletRequest request, Student student){
        Files file=new Files();
        List<Files> filesList=new ArrayList<>();
        List<Map<String,String>> list = upLoad(files, request);
        for(Map map:list){
            file.setFileName(map.get("fileName").toString());
            file.setSaveName(map.get("saveName").toString());
            file.setSavePath(map.get("savePath").toString());
            filesList.add(file);
        }
        student.setFilesList(filesList);
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
