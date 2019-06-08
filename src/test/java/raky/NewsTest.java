package raky;


import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import raky.entity.News;
import raky.service.NewsService;

import javax.annotation.Resource;
import java.util.UUID;

@RunWith(SpringRunner.class)
@SpringBootTest
public class NewsTest {
    private final static Logger logger=Logger.getLogger(NewsTest.class);
    @Resource
    private NewsService newsService;

    @Test
    public void getNewstList(){
        newsService.getList(new News()).forEach(System.out::println);
        News news = newsService.getOne(1l);
    }
    @Test
    public void insertNews() {
        News news = new News();
        news.setUuid(UUID.randomUUID().toString());

        news.setNewsType("xx");
        news.setTitle("xxxx");
        news.setViewCount(10);
        news.setInfoState(1);
        news.setPriority(1);
        news.setDeleted(1);
        int insert = newsService.insert(news);
        logger.info(news.getId());
    }
}
