package raky.service.impl;

import core.service.impl.CoreServiceImpl;
import org.springframework.stereotype.Service;
import raky.dao.FilesMapper;
import raky.dao.StudentMapper;
import raky.entity.Files;
import raky.entity.Student;
import raky.service.StudentService;

import javax.annotation.Resource;
import java.util.List;

@Service
public class StudentServiceImpl extends CoreServiceImpl<Student> implements StudentService {

    @Resource
    private StudentMapper studentMapper;
    @Resource
    private FilesMapper filesMapper;

    public int insert(Student student){
        int update = studentMapper.insert(student);
        Long id = student.getId();
        List<Files> filesList=student.getFilesList();
        for (Files files:filesList){
            files.setLinkId(id);
            files.setLinkTable("学生管理表");
            filesMapper.insert(files);
        }



        return update;
    }

    public  int update(Student student){
        int update = studentMapper.update(student);
        List<Files> filesList=student.getFilesList();
        if(filesList!=null){
            for (Files files:filesList){
                files.setLinkTable("学生管理表");
                files.setLinkId(student.getId());
                filesMapper.insert(files);
            }
        }
        return update;
    }

    public List<Student> getList(Student student){
        return studentMapper.getList(student);
    }

}
