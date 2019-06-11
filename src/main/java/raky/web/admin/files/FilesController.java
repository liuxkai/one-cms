package raky.web.admin.files;

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
import raky.service.FilesService;
import raky.util.Pager;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/files")
public class FilesController extends CoreController {
    private static final Logger logger = LoggerFactory.getLogger(FilesController.class);

    @Resource
    private Pager<Files> pager;
    @Autowired
    private FilesService filesService;

    @RequestMapping("/upload")
    public void upload(@RequestParam("file")MultipartFile file) throws  Exception{
        String filePath=file.getOriginalFilename();
        BufferedOutputStream outputStream=new BufferedOutputStream(new FileOutputStream(filePath));
        outputStream.write(file.getBytes());
        outputStream.flush();
        outputStream.close();

    }

    @RequestMapping(value = "/save",method = RequestMethod.POST)
    public String save(@RequestParam("file") MultipartFile files[], HttpServletRequest request, Files file){
        List<Map<String,String>> list = upLoad(files, request);
        for(Map map:list){
            file.setFileName(map.get("fileName").toString());
            file.setSaveName(map.get("saveName").toString());
            file.setSavePath(map.get("savePath").toString());
            file.setFileSize(Integer.valueOf(map.get("fileSize").toString()));
        }
        logger.info(file.toString());
        if(file.getId()!=null){
            filesService.update(file);
            return "redirect:/files/pageList";
        }
        filesService.insert(file);
        return "redirect:/files/pageList";

    }

    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    public String delete(Long id){
        filesService.delete(id);
        return "redirect:/files/pageList";
    }

    @RequestMapping(value = "/input",method = RequestMethod.GET)
    public String getOne(Long id, ModelMap model){
        model.addAttribute("file",filesService.getOne(id));
        return "/files/edit";
    }

    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public String getList(ModelMap model){
        List<Files> filesList = filesService.getList(new Files());
        model.addAttribute("filesList",filesList);
        return "";
    }
    @RequestMapping(value = "/detailed",method = RequestMethod.GET)
    public String getDetailed(Long id,ModelMap model){
        model.addAttribute("file",filesService.getOne(id));
        return "/files/show";
    }
    @RequestMapping(value = "/pageList", method = RequestMethod.GET)
    public String getPageList(ModelMap model, Files file, Integer requestPage) {
        if (requestPage == null) {
            requestPage = 1;
        }
        pager.init(requestPage, 2, filesService.getCount(file));
        file.setOffset(pager.getOffset());
        file.setLimit(pager.getLimit());
        List<Files> filesPageList = filesService.getPageList(file);
        pager.setList(filesPageList);
        model.addAttribute("pager", pager);
        model.addAttribute("file", file);
        return "/files/list";

    }
}