package raky.web.admin.news;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import raky.entity.News;
import raky.service.NewsService;

import java.util.List;

@RestController
@RequestMapping("/news")
public class NewsController {
    private static final Logger logger = LoggerFactory.getLogger(NewsController.class);

    @Autowired
    private NewsService newsService;

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(News news) {
        if (news.getId() != null) {
            newsService.update(news);
            return "redirect:";
        }
        newsService.insert(news);
        return "redirect:";

    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(Long id) {
        newsService.delete(id);
        return "redirect:";
    }

    @RequestMapping(value = "/input", method = RequestMethod.GET)
    public String getOne(Long id, ModelMap model) {
        model.addAttribute("course", newsService.getOne(id));
        return "";
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String getList(ModelMap model) {
        List<News> newsList = newsService.getList(new News());
        model.addAttribute("newsList", newsList);
        return "";
    }
}