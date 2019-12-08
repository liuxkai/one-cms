package raky.entity;

import core.entity.CoreEntity;
import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class Users extends CoreEntity {
    private Long id;

    private String userName;

    private String realName;

    private Integer userType;

    private String passWord;

    private Integer sex;

    private Integer age;

    private Date birthday;

    private String positions;

    private String mobile;

    private String email;

    private Integer loginCount;

    private String lastLoginIp;

    private Date lastLoginTime;

    private Date createTime;

    private Integer locked;

    private Integer deleted;

    private Integer priority;

    private List<Files> filesList;

}