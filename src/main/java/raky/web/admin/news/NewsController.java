package raky.web.admin.news;

import core.controller.CoreController;
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
import raky.entity.News;
import raky.service.NewsService;
import raky.util.Pager;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/news")
public class NewsController extends CoreController{
    private static final Logger logger=Logger.getLogger(NewsController.class);

    @Autowired
    private NewsService newsService;

    @Resource
    private Pager<News> pager;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(java.util.Date.class, new CustomDateEditor(dateFormat, true));
    }



    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(@RequestParam("file") MultipartFile files[],News news ,HttpServletRequest request){
        List<String> fileName = upLoad(files, request);
//        logger.info(fileName);
//        news.setImagePath(fileName.get(0));
//        news.setVideoPath(fileName.get(1));

        if (news.getUuid() != null&&news.getUuid()!="") {
            logger.info(news.toString());
            newsService.update(news);
            return "redirect:/news/pageList";
        }
        news.setUuid(UUID.randomUUID().toString());
        newsService.insert(news);
        return "redirect:/news/pageList";

    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(Long id) {
        newsService.delete(id);
        return "redirect:/news/pageList";
    }

    @RequestMapping(value = "/input", method = RequestMethod.GET)
    public String getOne(News news, ModelMap model) {
        if(news.getNewsType()!=null){
            model.addAttribute("newsType", newsService.getOne(news.getId()).getTypesList());
            model.addAttribute("news",news);
            return "/news/edit";
        }
        model.addAttribute("news", newsService.getOne(news.getId()));
        model.addAttribute("newsType", newsService.getOne(news.getId()).getTypesList());
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
    public String getPageList(ModelMap model, News news, Integer requestPage) {
        if (requestPage == null) {
            requestPage = 1;
        }
        pager.init(requestPage, 2, newsService.getCount(news));
        news.setOffset(pager.getOffset());
        news.setLimit(pager.getLimit());
        List<News> newsPageList = newsService.getPageList(news);
        pager.setList(newsPageList);
        model.addAttribute("pager", pager);
        model.addAttribute("news", news);
        return "/news/list";

    }
}