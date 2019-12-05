package raky.service.impl;

import core.service.impl.CoreServiceImpl;
import org.springframework.stereotype.Service;
import raky.dao.FilesMapper;
import raky.dao.NewsMapper;
import raky.entity.Files;
import raky.entity.News;
import raky.service.NewsService;

import javax.annotation.Resource;
import java.util.List;

@Service
public class NewsServiceImpl extends CoreServiceImpl<News> implements NewsService {

    @Resource
    private FilesMapper filesMapper;

    @Resource
    private NewsMapper newsMapper;

    public int insert(News news){
        int update = newsMapper.insert(news);
//        Long id = news.getId();
//        List<Files> filesList=news.getFilesList();
//        for (Files files:filesList){
//            files.setLinkId(id);
//            files.setLinkTable("新闻管理表");
//            filesMapper.insert(files);
//        }

        return update;
    }
    public  int update(News news){
        int update = newsMapper.update(news);
//        List<Files> filesList=news.getFilesList();
//        for (Files files:filesList){
//            files.setLinkId(news.getId());
//            files.setLinkTable("新闻管理表");
//            System.out.println(files);
//            filesMapper.insert(files);
//        }
        return update;
    }
}
