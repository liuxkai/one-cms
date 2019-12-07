package core.controller;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import raky.entity.Files;
import raky.entity.Types;
import raky.service.TypesService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;


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
public List<Map<String,String>> upLoad(@RequestParam(value = "file") MultipartFile files[], HttpServletRequest request) {
    List<Map<String,String>> list=new ArrayList<>();
    String uploadPath = "D://static/files/upload/"+getDate();
    System.out.println(uploadPath+"上传图片");
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
                if(fileName!=null && !"".equalsIgnoreCase(fileName.trim()) && isFile(fileName)) {
                    //创建输出文件对象
                    String saveName=UUID.randomUUID().toString()+ getFileType(fileName);
                    Map<String,String> map=new HashMap<>();
                    map.put("fileName",fileName);
                    logger.info(fileName);
                    map.put("savePath","/image/files/upload/"+getDate()+"/"+saveName);
                    map.put("saveName",saveName);
                    map.put("fileSize",(file.getSize()/1024)+"");
                    map.put("fileType",file.getContentType());
                    list.add(map);
                    File outFile = new File(uploadPath + "/" + saveName);
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

//判断文件格式
    private Boolean isFile(String fileName) {
        String[] img_type = new String[]{".jpg", ".jpeg", ".png", ".gif",".txt",".jsp" ,".mp4",".flv", ".bmp"};
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
    protected Boolean isVideoFile(String fileName) {
        String[] img_type = new String[]{".mp4",".flv"};
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
    protected Boolean isImagesFile(String fileName) {
        String[] img_type = new String[]{".jpg",".png",".jpeg",".gif","bmp"};
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
    protected String getFileType(String fileName) {
        if (fileName != null && fileName.indexOf(".") >= 0) {
            return fileName.substring(fileName.lastIndexOf("."), fileName.length());
        }
        return "";
    }

    public String getDate(){
        Date date = new Date();

        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");

        String str = format.format(date);
        return  str;

    }

    protected  List<Types> getTypesListByParentCode(Long parentCode){
        Types types = new Types();
        types.setParentCode(parentCode);
        return typesService.getList(types);
    }

}

