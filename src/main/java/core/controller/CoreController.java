package core.controller;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import raky.entity.Types;
import raky.service.TypesService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
public class CoreController {
    private static final Logger logger=Logger.getLogger(CoreController.class);

    @Resource
    private TypesService typesService;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }


@ResponseBody
public List<String> upLoad(@RequestParam(value = "file") MultipartFile files[], HttpServletRequest request) {
        logger.info(files.toString());
    List<String> list=new ArrayList<>();
    String uploadPath = request.getSession().getServletContext().getRealPath("static/images/pic");
    File uploadDirectory = new File(uploadPath);
    if (uploadDirectory.exists()) {
        if (!uploadDirectory.isDirectory()) {
            uploadDirectory.delete();
        }
    } else {
        uploadDirectory.mkdir();
    }
    if (files != null && files.length >= 1) {
        BufferedOutputStream bw = null;
        try {
            for (MultipartFile file : files) {
                String fileName = file.getOriginalFilename();
                //判断是否有文件且是否为图片文件
                if(fileName!=null && !"".equalsIgnoreCase(fileName.trim()) && isImageFile(fileName)) {
                    //创建输出文件对象
                    String newFileName=UUID.randomUUID().toString()+ getFileType(fileName);
                    logger.info(newFileName);
                    list.add(newFileName);
                    File outFile = new File(uploadPath + "/" + UUID.randomUUID().toString()+ getFileType(fileName));
                    //拷贝文件到输出文件对象
                    FileUtils.copyInputStreamToFile(file.getInputStream(), outFile);

                }

            }
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


    return list;
}

    private Boolean isImageFile(String fileName) {
        String[] img_type = new String[]{".jpg", ".jpeg", ".png", ".gif", ".mp4",".flv", ".bmp"};
        if (fileName == null) {
            return false;
        }
        fileName = fileName.toLowerCase();
        for (String type : img_type) {
            if (fileName.endsWith(type)) {
                return true;
            }
        }
        return false;
    }

    /**
     * 获取文件后缀名
     *
     * @param fileName
     * @return
     */
    private String getFileType(String fileName) {
        if (fileName != null && fileName.indexOf(".") >= 0) {
            return fileName.substring(fileName.lastIndexOf("."), fileName.length());
        }
        return "";
    }

    protected  List<Types> getTypesListByParentCode(Long parentCode){
        Types types = new Types();
        types.setParentCode(parentCode);
        return typesService.getList(types);
    }

}

