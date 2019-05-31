package raky.entity;

import core.entity.CoreEntity;
import lombok.Data;

@Data
public class Files extends CoreEntity {
    private Long id;

    private String linkTable;

    private Long linkId;

    private String fileName;

    private String fileType;

    private Integer fileSize;

    private String savePath;

    private String saveName;

    private String fileMemo;

    private Integer deleted;
}