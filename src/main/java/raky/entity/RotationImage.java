package raky.entity;

import core.entity.CoreEntity;
import lombok.Data;

@Data
public class RotationImage extends CoreEntity {
    private Integer id;

    private String title;

    private String imagePath;

    private Short height;

    private Short width;

    private Integer deleted;

    private Integer locked;

    private Integer priority;


}