package raky.entity;

import core.entity.CoreEntity;
import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class Teacher extends CoreEntity {
    private Long id;

    private String name;

    private Integer sex;

    private Date birthDate;

    private String contactWay;

    private String email;

    private String onlineContact;

    private String address;

    private Integer deleted;

    private Integer locked;

    private Integer priority;

    private String positions;

    private String memo;

    private List<Files> filesList;
}