package core.dao;

import org.apache.ibatis.annotations.Mapper;
import java.util.List;

public interface CoreMapper<T> {

    int insert(T t);

    int save(T t);


    int update(T t);

    int delete(Long id);

    int deleteAll(List<Long> id);

    T getOne(Long id);

    int getCount(T t);

    List<T> getList(T t);

    List<T> getPageList(T t);
    /*通过用户名和密码登录*/
    T findOne(T t);
}
