package raky.service.impl;

import core.service.impl.CoreServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import raky.dao.FilesMapper;
import raky.entity.Files;
import raky.service.FilesService;

@Service
public class FilesServiceImpl extends CoreServiceImpl<Files> implements FilesService {

}
