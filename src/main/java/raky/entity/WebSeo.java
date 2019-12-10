package raky.entity;

import core.entity.CoreEntity;
import lombok.Data;

@Data
public class WebSeo extends CoreEntity {
    private Long id;

    private String webName;

    private String title;

    private Integer type;

    private String keywords;

    private String description;

    private Integer deleted;

    private Integer locked;

    private Integer priority;


}