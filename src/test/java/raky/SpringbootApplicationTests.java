package raky;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import raky.entity.Users;
import raky.service.UsersService;

import javax.annotation.Resource;

@RunWith(SpringRunner.class)
@SpringBootTest
public class SpringbootApplicationTests {
    private final static Logger logger=Logger.getLogger(SpringbootApplicationTests.class);

    @Resource
    private UsersService usersService;
    @Test
    public void contextLoads() {

        usersService.getList(new Users()).forEach(System.out::println);
    }

}
