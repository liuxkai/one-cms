package raky.web.admin.news;

import core.controller.CoreController;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import raky.entity.*;
import raky.service.FilesService;
import raky.service.NewsService;
import raky.util.LayuiUtil;
import raky.util.Pager;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/admin/news")
public class NewsController extends CoreController{
    private static final Logger logger=Logger.getLogger(NewsController.class);

    @Autowired
    private NewsService newsService;

    @Resource
    private Pager<News> pager;
    @Resource
    private FilesService filesService;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(java.util.Date.class, new CustomDateEditor(dateFormat, true));
    }



//    @RequestMapping(value = "/save", method = RequestMethod.POST)
//    @ResponseBody
//    public int save(News news){
////        @RequestParam("File") MultipartFile[] newsFile,@RequestParam("file") MultipartFile files[],         ,HttpServletRequest request
////        List<Files> list=new ArrayList<>();
////        List<Map<String,String>> filesList = upLoad(files, request);
////        List<Map<String,String>> newsFilesList = upLoad(newsFile, request);
////        for (Map map:newsFilesList){
////            logger.info(map.get("fileName").toString());
////            if(isVideoFile(map.get("fileName").toString())){
////                news.setVideoPath(map.get("savePath").toString());
////            }else{
////                news.setImagePath(map.get("savePath").toString());
////            }
////        }
////        for (Map map:filesList){
////            Files file=new Files();
////            try {
////                BeanUtils.populate(file,map);
////                list.add(file);
////            } catch (Exception e) {
////                e.printStackTrace();
////            }
////        }
////        news.setFilesList(list);
//        if(news.getViewCount() == null){ news.setViewCount(0);}
//        if(news.getInfoState() == null){ news.setInfoState(0);}
//        if(news.getPriority() == null){ news.setPriority(0);}
//        if(news.getDeleted() == null){ news.setDeleted(0);}  //0是未删除,1是删除
//        if (news.getUuid() != null && news.getUuid() != "") {
//            logger.info(news.getId());
//            int update = newsService.update(news);
//            return update;
//        }
//        news.setUuid(UUID.randomUUID().toString());
//        int insert = newsService.insert(news);
//        return insert;
//    }











    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public int save(@RequestParam("File") MultipartFile[] newsFile, @RequestParam("file") MultipartFile files[], News news, HttpServletRequest request){
        for (MultipartFile type : newsFile){
            logger.info(type.toString()+"===============newsFile=========type=======");
        }
        for (MultipartFile type : files){
            logger.info(type.toString()+"===============files=========type=======");
        }
        logger.info(news.toString()+"===============news================");
        List<Files> list=new ArrayList<>();
        List<Map<String,String>> filesList = upLoad(files, request);
        List<Map<String,String>> newsFilesList = upLoad(newsFile, request);
        for (Map map:newsFilesList){
            logger.info(map.get("fileName").toString());
            if(isVideoFile(map.get("fileName").toString())){
                news.setVideoPath(map.get("savePath").toString());
            }else{
                news.setImagePath(map.get("savePath").toString());
            }
        }
        for (Map map:filesList){
            Files file=new Files();
            try {
                BeanUtils.populate(file,map);
                list.add(file);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        System.out.println(list.toString());
        news.setFilesList(list);
        if(news.getViewCount() == null){ news.setViewCount(0);}
        if(news.getInfoState() == null){ news.setInfoState(0);}
        if(news.getPriority() == null){ news.setPriority(0);}
        if(news.getDeleted() == null){ news.setDeleted(0);}  //0是未删除,1是删除
        if (news.getUuid() != null && !news.getUuid().equals("")) {
            logger.info(news.getId());
            int update = newsService.update(news);
            return update;
        }
        news.setUuid(UUID.randomUUID().toString());
        int insert = newsService.insert(news);
        return insert;
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    @ResponseBody
    public String delete(Long id) {
        int delete = newsService.delete(id);
        return String.valueOf(delete);
    }

    @RequestMapping(value = "/deleteAll", method = RequestMethod.GET)
    @ResponseBody
    public String deleteAll(String arrayId) {
        String[] split = arrayId.substring(1,arrayId.length()-1).split(",");
        List<Long> someId = new ArrayList<>();
        for (int i = 0; i < split.length; i++) {
            someId.add(Long.valueOf(split[i]));
        }
        newsService.deleteAll(someId);
        return "1";
    }

    @RequestMapping(value = "/input", method = RequestMethod.GET)
    public String getOne(Long id, ModelMap model) {
//        Files files=new Files();
//        files.setLinkId(id);
//        files.setLinkTable("新闻管理表");
//        model.addAttribute("filesList",filesService.getList(files));
        model.addAttribute("typesList", getTypesListByParentCode(20l));
        if(id!=null){
            model.addAttribute("news",newsService.getOne(id));
            return "/admin/news/input.html";
        }
        return "/admin/news/input.html";
    }

    @RequestMapping(value = "/detailed",method = RequestMethod.GET)
    public String getDetailed(Long id,ModelMap model){
        List<Types> typesList =getTypesListByParentCode(20L);
        model.addAttribute("typesList",typesList);
        model.addAttribute("news",newsService.getOne(id));
        return "/admin/news/show.html";
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String getList(ModelMap model) {
        List<News> newsList = newsService.getList(new News());
        model.addAttribute("newsList", newsList);
        return "/admin/news/list";
    }

    @RequestMapping(value = "/pageList", method = RequestMethod.GET)
    @ResponseBody
    public LayuiUtil<News> getPageList(News news, Integer page, Integer limit) {
        if(page==null){
            page=1;
        }if(limit==null){
            limit=10;
        }
        news.setNewsType((news.getNewsType() != null && !news.getNewsType().equals("")) ? news.getNewsType() : null);
        news.setTitle((news.getTitle() != null && !news.getTitle().equals("")) ? news.getTitle() : null);

        pager.init(page, limit, newsService.getCount(news));
        news.setOffset(pager.getOffset());
        news.setLimit(pager.getLimit());
        List<News> newsPageList = newsService.getPageList(news);
        LayuiUtil layui = LayuiUtil.<News>builder().data(newsPageList).msg("新闻信息").code(0).count(Long.valueOf(newsService.getCount(news))).build();
        return layui;
    }
}