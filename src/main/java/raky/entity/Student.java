package raky.entity;

import core.entity.CoreEntity;
import lombok.Data;

import java.util.Date;

@Data
public class Student extends CoreEntity {
    private Long id;

    private String name;

    private String clazz;

    private Integer sex;

    private String company;

    private String salary;

    private Date birthDate;

    private Integer education;

    private Integer major;

    private String school;

    private String contactWay;

    private String email;

    private String onlineContact;

    private String address;

    private Integer deleted;

    private Integer locked;

    private Integer priority;

}