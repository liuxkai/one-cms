package raky.service.impl;

import core.service.impl.CoreServiceImpl;
import org.springframework.stereotype.Service;
import raky.dao.FilesMapper;
import raky.dao.TeacherMapper;
import raky.entity.Files;
import raky.entity.Teacher;
import raky.service.TeacherService;

import javax.annotation.Resource;
import java.util.List;

@Service
public class TeacherServiceImpl extends CoreServiceImpl<Teacher> implements TeacherService {

    @Resource
    private TeacherMapper teacherMapper;
    @Resource
    private FilesMapper filesMapper;

    public int insert(Teacher teacher){
        int update = teacherMapper.insert(teacher);
//        Long id = teacher.getId();
//        List<Files> filesList=teacher.getFilesList();
//        for (Files files:filesList){
//            files.setLinkId(id);
//            files.setLinkTable("教师管理表");
//            filesMapper.insert(files);
//        }



        return update;
    }

    public  int update(Teacher teacher){
        int update = teacherMapper.update(teacher);
//        List<Files> filesList=teacher.getFilesList();
//        if(filesList!=null){
//            for (Files files:filesList){
//                files.setLinkTable("教师管理表");
//                files.setLinkId(teacher.getId());
//                filesMapper.insert(files);
//            }
//        }

        return update;
    }
}
