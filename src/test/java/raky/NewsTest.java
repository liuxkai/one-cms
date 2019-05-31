package raky;


import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import raky.entity.News;
import raky.service.NewsService;

import javax.annotation.Resource;

@RunWith(SpringRunner.class)
@SpringBootTest
public class NewsTest {
    private final static Logger logger=Logger.getLogger(NewsTest.class);
    @Resource
    private NewsService newsService;

    @Test
    public void getStudentList(){
        newsService.getList(new News()).forEach(System.out::println);
    }

}
