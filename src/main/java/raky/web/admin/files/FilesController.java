package raky.web.admin.files;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import raky.entity.Files;
import raky.service.FilesService;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.util.List;

@RestController
@RequestMapping("/files")
public class FilesController {
    private static final Logger logger = LoggerFactory.getLogger(FilesController.class);

    @RequestMapping("/upload")
    public void upload(@RequestParam("file")MultipartFile file) throws  Exception{
        String filePath=file.getOriginalFilename();
        BufferedOutputStream outputStream=new BufferedOutputStream(new FileOutputStream(filePath));
        outputStream.write(file.getBytes());
        outputStream.flush();
        outputStream.close();

    }
    @Autowired
    private FilesService filesService;

    @RequestMapping(value = "/save",method = RequestMethod.POST)
    public String save(Files files){
        if(files.getId()!=null){
            filesService.update(files);
            return "redirect:";
        }
        filesService.insert(files);
        return "redirect:";

    }

    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    public String delete(Long id){
        filesService.delete(id);
        return "redirect:";
    }

    @RequestMapping(value = "/input",method = RequestMethod.GET)
    public String getOne(Long id, ModelMap model){
        model.addAttribute("course",filesService.getOne(id));
        return "";
    }

    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public String getList(ModelMap model){
        List<Files> filesList = filesService.getList(new Files());
        model.addAttribute("filesList",filesList);
        return "";
    }
}