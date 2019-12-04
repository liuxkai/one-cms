package raky.web.admin.logout;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * @author atian
 * @version 1.0.0
 * @ClassName Logout.java
 * @Description TODO
 * @createTime 2019年12月04日 00:22:00
 */
/*用户退出*/
@Controller
@RequestMapping("logout")
public class Logout {
    @RequestMapping("out")
    public String logout(HttpServletRequest request){}

}
