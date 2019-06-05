package raky.entity;

import core.entity.CoreEntity;
import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class Types extends CoreEntity {
    private Long id;

    private Long parentCode;

    private String typeName;

    private Integer typeCode;

    private String typeMemo;

    private Date createTime;

    private Integer deleted;

    private Integer locked;

    private Integer priority;

    List<Types> children;

}