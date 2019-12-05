package raky.web.admin.users;

import core.controller.CoreController;
import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import raky.entity.Types;
import raky.entity.Users;
import raky.service.UsersService;
import raky.util.LayuiUtil;
import raky.util.Pager;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.IOException;
import java.util.*;

@RestController
@RequestMapping("/admin/users")
public class UsersController extends CoreController {

    private static final Logger logger = LoggerFactory.getLogger(UsersController.class);

    @Autowired
    private UsersService usersService;
    @Resource
    private Pager<Users> pager;

    @RequestMapping(value = "/save" )
    public String save(@RequestBody Users users){
        int result ;
        if(users.getId()!=null){
           result =  usersService.update(users);
            return String.valueOf(result);
        }
        users.setCreateTime(new Date());
        result = usersService.insert(users);

        return String.valueOf(result);

    }

    @RequestMapping(value = "/delete",method = RequestMethod.POST)
    public String delete(Long id){
        System.out.println(id);
        usersService.delete(id);
        return "redirect:/users/list";
    }

    @RequestMapping(value = "/input",method = RequestMethod.GET)
    public String getOne(Long id, ModelMap model){
        List<Types> typesList1 =getTypesListByParentCode(10L);
        List<Types> typesList2 =getTypesListByParentCode(60L);
        model.addAttribute("typesList1",typesList1);
        model.addAttribute("typesList2",typesList2);
        if(id!=null){
            model.addAttribute("user",usersService.getOne(id));
            return "/users/edit";
        }
        return "/users/edit";
    }
    @RequestMapping(value = "/detailed",method = RequestMethod.POST)
    public String getDetailed(Long id,ModelMap model){
        List<Types> typesList1 =getTypesListByParentCode(10L);
        List<Types> typesList2 =getTypesListByParentCode(60L);
        for (Types types:typesList1){
            System.out.println(types);
        }
        model.addAttribute("typesList1",typesList1);
        model.addAttribute("typesList2",typesList2);
        model.addAttribute("user",usersService.getOne(id));
        return "/html/UserAdd";
    }

    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public Map<String,Object> getList(){
        Map<String, Object> dataMap = new HashMap<>();
        List<Users> usersList = usersService.getList(new Users());
        dataMap.put("code",0);
        dataMap.put("msg","success");
        dataMap.put("data",usersList);
        return dataMap;
    }

    @RequestMapping(value = "/pageList",method = RequestMethod.GET)
    public LayuiUtil getPageList(ModelMap model, Users users, Integer page, Integer limit){
       /* if(aroundTime!=null&&aroundTime.contains("/")){
            String[] split = aroundTime.split("-");
            users.setStartTime(split[0]);
            users.setEndTime(split[1]);
        }*/
        System.out.println(users.getDeleted());
        System.out.println(users.getCondition());
        if(page==null){
            page=1;
        }if(limit==null){
            limit=5;
        }
        pager.init(page,limit,usersService.getCount(users));
        users.setOffset(pager.getOffset());
        users.setLimit(pager.getLimit());
        List<Users> usersPageList = usersService.getPageList(users);
        /*pager.setList(usersPageList);
        pager.setUrl("/users/pageList");
        model.addAttribute("pager",pager);
        model.addAttribute("users",users);
        model.addAttribute("aroundTime",aroundTime);
        return "/users/list";*/
        LayuiUtil layuiUtil = LayuiUtil.<Users>builder().data(usersPageList).msg("").code(0).count(Long.valueOf(usersService.getCount(users))).build();
        List<Types> typesList1 =getTypesListByParentCode(10L);
        List<Types> typesList2 =getTypesListByParentCode(60L);
        model.addAttribute("typesList1",typesList1);
        model.addAttribute("typesList2",typesList2);
        model.addAttribute("user",users);
        return layuiUtil;
    }

    @RequestMapping(value = "/upload")
    public String  upload(MultipartFile  file,HttpServletRequest request) throws IOException {
        String filename = file.getOriginalFilename();
        String uploadPath = request.getSession().getServletContext().getRealPath("static/files/upload/"+getDate());
        File uploadDirectory = new File(uploadPath);
        if (uploadDirectory.exists()) {
            if (!uploadDirectory.isDirectory()) {
                uploadDirectory.delete();
            }
        } else {
            uploadDirectory.mkdir();
        }
        if (file != null ) {
            BufferedOutputStream bw = null;
            try {
//                for (MultipartFile file : files) {
//                    if(fileName!=null && !"".equalsIgnoreCase(fileName.trim()) && isFile(fileName)) {
                        //创建输出文件对象
                        String saveName=UUID.randomUUID().toString()+ getFileType(filename);
                        File outFile = new File(uploadPath + "/" + saveName);
                        //拷贝文件到输出文件对象
                        FileUtils.copyInputStreamToFile(file.getInputStream(), outFile);

//                    }

//                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    if (bw != null) {
                        bw.close();
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return "";
    }
}
