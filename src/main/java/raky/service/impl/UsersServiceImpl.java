package raky.service.impl;

import core.service.impl.CoreServiceImpl;
import org.springframework.stereotype.Service;
import raky.dao.UsersMapper;
import raky.entity.Users;
import raky.service.UsersService;

import javax.annotation.Resource;

@Service
public class UsersServiceImpl extends CoreServiceImpl<Users> implements UsersService {
    @Resource
    private UsersMapper usersMapper;

    @Override
    public Users findOne(Users user) {
        Users onlineUser = usersMapper.findOne(user);
        return onlineUser;
    }
}
