package raky.entity;

import core.entity.CoreEntity;
import lombok.Data;

import java.util.Date;
@Data
public class ClassDate extends CoreEntity {
    private Long id;

    private Date classDate;

    private String state;

    private String classHref;

    private Integer deleted;

    private Integer locked;

    private Integer priority;


}