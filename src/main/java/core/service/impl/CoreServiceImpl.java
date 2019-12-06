package core.service.impl;

import java.util.List;

import core.dao.CoreMapper;
import core.service.CoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.thymeleaf.expression.Ids;

@Service
public class CoreServiceImpl<T> implements CoreService<T> {

	@Autowired(required = false)
	private CoreMapper<T> coreMapper;

	@Override
    @Transactional
	public int insert(T t) {
		return coreMapper.insert(t);
	}

	@Override
	public int save(T t) {
		return coreMapper.save(t);
	}

	@Override
    @Transactional
	public int update(T t) {
		return coreMapper.update(t);
	}

	@Override
    @Transactional
	public int delete(Long id) {
		return coreMapper.delete(id);
	}

	@Override
	public int deleteAll(List<Long> ids) {
		return coreMapper.deleteAll(ids);
	}

	@Override
	public T getOne(Long id) {
		return coreMapper.getOne(id);
	}

	@Override
	public int getCount(T t) {
		return coreMapper.getCount(t);
	}

	@Override
	public List<T> getList(T t) {
		return coreMapper.getList(t);
	}

	@Override
	public List<T> getPageList(T t) {
		return coreMapper.getPageList(t);
	}

	@Override
	public T findOne(T t) {
		return coreMapper.findOne(t);
	}

	@Override
	public T findFile(T t) {

		return coreMapper.findFile(t);
	}

}
