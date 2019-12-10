package raky.service.impl;

import core.service.impl.CoreServiceImpl;
import org.springframework.stereotype.Service;
import raky.dao.WebSeoMapper;
import raky.entity.ClassDate;
import raky.service.ClassDataService;


import javax.annotation.Resource;


@Service
public class ClassDateServiceimpl extends CoreServiceImpl<ClassDate> implements ClassDataService {
    @Resource
    private WebSeoMapper webSeoMapper;


}
