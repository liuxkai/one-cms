package core.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

@Data
public class CoreEntity implements Serializable {
	private static final long serialVersionUID = 9092861050511346225L;
	private Map<String,Object> map = new HashMap<>();
    private int offset;


    private int limit;

    //多个字段使用此参数模糊查询
    private String condition;

    private String startTime;

    private String endTime;

}
