package raky.skip;


import com.alibaba.fastjson.JSONObject;
import core.controller.CoreController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import raky.entity.Files;
import raky.entity.Types;
import raky.entity.Users;
import raky.service.FilesService;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/skip")
public class SkipController extends CoreController {
    @Autowired(required = false)
    private Files files;
    @Autowired
    private FilesService filesService;
    @RequestMapping(value = "/aa")
    public String aaa(){
        return "html/nv.html";
    }


    @RequestMapping(value = "/bb")
    @ResponseBody
    public String bb(String content,Model model){
        System.out.println(content);

        return content;
    }


    @RequestMapping(value = "/upload")
    @ResponseBody
    public Map<String, Object> upload(@RequestParam("file") MultipartFile file) throws IOException {
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
        String format = sf.format(new Date());
        String abpath = new String("/src/" + format);//D盘路径
        File realFile = new File(abpath);
        if (!realFile.exists()) {
            realFile.mkdirs();
        }
        System.out.println("路径"+realFile.getAbsolutePath()); // 文件夹路径
        String filename = file.getOriginalFilename();//文件名
        String name = UUID.randomUUID().toString()+filename.substring(filename.lastIndexOf("."));//新名字
        File newFile = new File(realFile.getAbsoluteFile() + File.separator + name);// File.separator 反斜杠
        System.out.println(newFile);
        file.transferTo(newFile); // 开始上传
        Map<String, Object> map1 = new HashMap<>();
        map1.put("src","/image/"+format+"/"+name);
        map1.put("title",name);
        Map<String, Object> map = new HashMap<>();
        map.put("code",0);
        map.put("msg","");
        map.put("data",map1);

        return map;
    }




    @RequestMapping(value = "/main")
    public String index(HttpServletRequest request,Model model){
        Users onlinerUser = (Users)request.getSession().getAttribute("OnlinerUser");
        Long id = onlinerUser.getId();
        Files files = new Files();
        files.setLinkId(id);
        System.out.println(id);
        files.setLinkTable("用户管理表");
        Files file = filesService.findFile(files);
        System.out.println(file);
        model.addAttribute("onlinerUser",onlinerUser);
        model.addAttribute("files",files);
        return "html/main";
    }

    @RequestMapping(value = "/main2")
    public String welcome(){
        return "html/welcome.html";
    }

    @RequestMapping(value = "/main3")
    public String student(){
        return "html/student.html";
    }

    @RequestMapping(value = "/editor")
    public String editor(){
        return "html/editor.html";
    }

    @RequestMapping(value = "/userList")
    public String userList(){
        return "users/user.html";
    }

    @RequestMapping(value = "/courseList")
    public String courseList(ModelMap model){
        List<Types> typesList =getTypesListByParentCode(40l);
        model.addAttribute("typesList",typesList);
        return "course/list.html";
    }

    @RequestMapping(value = "/teacherList")
    public String teacherList(ModelMap model){
        List<Types> typesList =getTypesListByParentCode(60l);
        model.addAttribute("typesList",typesList);
        return "teacher/list.html";
    }

    @RequestMapping(value = "/newsList")
    public String newsList(ModelMap model){
        List<Types> typesList =getTypesListByParentCode(20l);
        model.addAttribute("typesList",typesList);
        return "news/list.html";
    }

}
