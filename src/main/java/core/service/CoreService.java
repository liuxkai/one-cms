package core.service;

import java.util.List;

public interface CoreService<T> {

	int insert(T t);
	int save(T t);

	int update(T t);

	int delete(Long id);

	int deleteAll(List<Long> id);

	T getOne(Long id);

	int getCount(T t);

	List<T> getList(T t);

	List<T> getPageList(T t);

	T findOne(T t);
}
