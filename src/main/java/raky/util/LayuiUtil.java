package raky.util;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
/**
 * 封装成layui需要格式工具类
 * 
 * @author liu'x'kai
 * @date 2019年10月21日
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class LayuiUtil<T> {
	  
	 private int code;
	 private String msg;
	 private Long count; //总条数
	 private List<T> data; //装前台当前页的数据

}