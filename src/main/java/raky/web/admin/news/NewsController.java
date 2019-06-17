package raky.web.admin.news;

import core.controller.CoreController;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import raky.entity.Files;
import raky.entity.News;
import raky.service.FilesService;
import raky.service.NewsService;
import raky.util.Pager;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/news")
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



    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(@RequestParam("File") MultipartFile[] newsFile,@RequestParam("file") MultipartFile files[],News news ,HttpServletRequest request){
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
        news.setFilesList(list);

        if (news.getUuid() != null&&news.getUuid()!="") {
            logger.info(news.getId());
            newsService.update(news);
            return "redirect:/news/pageList";
        }
        newsService.insert(news);
        return "redirect:/news/pageList";

    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(Long id) {
        newsService.delete(id);
        return "redirect:/news/pageList";
    }

    @RequestMapping(value = "/input", method = RequestMethod.GET)
    public String getOne(Long id, ModelMap model) {
        Files files=new Files();
        files.setLinkId(id);
        files.setLinkTable("新闻管理表");
        model.addAttribute("filesList",filesService.getList(files));
        model.addAttribute("newsType", getTypesListByParentCode(20l));
        if(id!=null){
            model.addAttribute("news",newsService.getOne(id));
            return "/news/edit";
        }
        return "/news/edit";
    }

    @RequestMapping(value = "/detailed",method = RequestMethod.GET)
    public String getDetailed(Long id,ModelMap model){
        model.addAttribute("news",newsService.getOne(id));
        return "/news/show";
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String getList(ModelMap model) {
        List<News> newsList = newsService.getList(new News());
        model.addAttribute("newsList", newsList);
        return "/news/list";
    }

    @RequestMapping(value = "/pageList", method = RequestMethod.GET)
    public String getPageList(ModelMap model, News news, Integer requestPage,Integer pageSize) {
        if(requestPage==null){
            requestPage=1;
        }if(pageSize==null){
            pageSize=5;
        }
        pager.init(requestPage, pageSize, newsService.getCount(news));
        news.setOffset(pager.getOffset());
        news.setLimit(pager.getLimit());
        List<News> newsPageList = newsService.getPageList(news);
        pager.setList(newsPageList);
        pager.setUrl("/news/pageList");
        model.addAttribute("pager", pager);
        model.addAttribute("news", news);
        return "/news/list";

    }
}