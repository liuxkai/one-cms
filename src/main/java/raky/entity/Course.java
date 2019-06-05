package raky.entity;

import core.entity.CoreEntity;
import lombok.Data;

import java.util.List;

@Data
public class Course extends CoreEntity {
    private Long id;

    private Integer courseType;

    private String courseName;

    private String courseMemo;

    private Integer priority;

    private Integer deleted;

    List<Types> typesList;
}