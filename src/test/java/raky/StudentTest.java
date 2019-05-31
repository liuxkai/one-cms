package raky;


import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import raky.entity.Student;
import raky.service.StudentService;

import javax.annotation.Resource;

@RunWith(SpringRunner.class)
@SpringBootTest
public class StudentTest {
    private final static Logger logger=Logger.getLogger(StudentTest.class);
    @Resource
    private StudentService studentService;

    @Test
    public void getStudentList(){
        studentService.getList(new Student()).forEach(System.out::println);
    }

}
