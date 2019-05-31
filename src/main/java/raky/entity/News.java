package raky.entity;

import core.entity.CoreEntity;
import lombok.Data;

import java.util.Date;

@Data
public class News extends CoreEntity {
    private Long id;

    private String uuid;

    private String newsType;

    private String title;

    private String imagePath;

    private String imageMemo;

    private String videoPath;

    private String videoDesc;

    private String summary;

    private String author;

    private String infoSource;

    private Date invalidDate;

    private Date publishTime;

    private Integer viewCount;

    private Date viewDatetime;

    private Integer infoState;

    private Integer priority;

    private Integer deleted;

    private String content;

}