package raky.service.impl;

import core.service.impl.CoreServiceImpl;
import org.springframework.stereotype.Service;
import raky.dao.UsersMapper;
import raky.entity.Course;
import raky.service.CourseService;

import javax.annotation.Resource;

@Service
public class CourseServiceImpl extends CoreServiceImpl<Course> implements CourseService {
}

