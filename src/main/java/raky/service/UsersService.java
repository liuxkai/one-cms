package raky.service;

import core.service.CoreService;
import raky.entity.Users;

public interface UsersService extends CoreService<Users> {
    Users findOne(Users user);
}
