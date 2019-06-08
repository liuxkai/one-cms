package raky;


import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.web.bind.annotation.ResponseBody;
import raky.entity.Types;
import raky.entity.Users;
import raky.service.TypesService;
import raky.service.UsersService;

import javax.annotation.Resource;
import java.util.Date;

@RunWith(SpringRunner.class)
@SpringBootTest
public class UsersTest {
    private final static Logger logger=Logger.getLogger(UsersTest.class);
    @Resource
    private UsersService usersService;
    @Resource
    private TypesService typesService;
    @Test
    @ResponseBody
    public void getUsersList(){
//        usersService.getList(new Users()).forEach(System.out::println);

        Types types=new Types();
        types.setId(0l);
        typesService.getList(types).forEach(System.out::println);
    }
    @Test
    public void insertUser(){
        Users users=new Users();
        users.setBirthday(new Date());
        users.setUserName("黄飞虎");
        users.setPassWord("123");
        int result = usersService.insert(users);
        logger.info(result);
    }

    @Test
    public void updateUser(){
        Users users=new Users();
        users.setBirthday(new Date());
        users.setUserName("黄大胖");
        users.setPassWord("123");
        users.setId(2l);
        int result = usersService.update(users);
        logger.info(result);
    }
    @Test
    public void getPageListUser(){
        Users users=new Users();
        users.setOffset(0);
        users.setLimit(2);
        usersService.getPageList(users).forEach(System.out::println);
    }

    @Test
    public void getOneUser(){
        Users users = usersService.getOne(2l);
    }
}
