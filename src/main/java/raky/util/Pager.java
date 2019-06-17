package raky.util;

import lombok.*;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
@Data
public class Pager<T> {

	//页面相关属性
	private Integer firstPage ;  //首页
	private Integer lastPage ;   //尾页
	private Integer previousPage ; //上一页
	private Integer nextPage  ; //下一页
	private Integer currentPage ; // 当前页
	private Integer pageCount ;  //总页数
	private Integer pageSize  ;  //页面条数
	private Integer requestPage ;  //请求页
	//后台相关属性
	private Integer totalCount ;  //总记录数
	private Integer offset;  // 开始索引 [ 分段取==>起点 ]
	private Integer limit; // 获取条数 [ 分段取 ==> 终点 ]

	private String url;
	
	private List<T> list = new ArrayList<>();  //存储的需要分页的数据


	/**
	 * 初始化PageUtil
	 * @param requestPage  请求页
	 * @param pageSize     每页显示条数
	 * @param totalCount   总记录数
	 */
	public void init(Integer requestPage,Integer pageSize,Integer totalCount) {
		this.requestPage = requestPage;
		this.currentPage = requestPage;
		this.firstPage = 1;
		
		this.totalCount = totalCount;
		this.pageSize = pageSize;
		//总页数
		this.pageCount = this.totalCount % this.pageSize != 0 ? this.totalCount / this.pageSize + 1:this.totalCount / this.pageSize;
		//尾页
		this.lastPage = this.pageCount;
		//获取条数
		this.limit =  this.pageSize;
		//起始索引
		this.offset = (this.currentPage - 1)*this.pageSize;
		//上一页 = 当前页 - 1(前提是当前页不为首页)
		if(this.currentPage==firstPage) {
			this.previousPage=1;
		}else {
			this.previousPage = currentPage - 1;
		}
		//下一页 = 当前页 + 1 (前提是当前页不为最后一页)
		if(this.currentPage==this.lastPage) {
			this.nextPage = this.lastPage;
		}else {
			this.nextPage =  currentPage + 1 ;    
		}

	}
}
