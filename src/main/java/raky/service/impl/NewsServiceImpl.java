package raky.service.impl;

import core.service.impl.CoreServiceImpl;
import org.springframework.stereotype.Service;
import raky.entity.News;
import raky.service.NewsService;

@Service
public class NewsServiceImpl extends CoreServiceImpl<News> implements NewsService {

}
