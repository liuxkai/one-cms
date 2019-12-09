package raky.service.impl;
import core.service.impl.CoreServiceImpl;
import org.springframework.stereotype.Service;
import raky.dao.WebSeoMapper;
import raky.entity.WebSeo;
import raky.service.WebSeoService;
import javax.annotation.Resource;


@Service
public class WebServiceimpl extends CoreServiceImpl<WebSeo> implements WebSeoService {
    @Resource
    private WebSeoMapper webSeoMapper;


}
