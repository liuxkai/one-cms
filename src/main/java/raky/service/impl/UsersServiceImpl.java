package raky.service.impl;

import core.service.impl.CoreServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import raky.dao.FilesMapper;
import raky.dao.UsersMapper;
import raky.entity.Files;
import raky.entity.Users;
import raky.service.UsersService;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UsersServiceImpl extends CoreServiceImpl<Users> implements UsersService {
    @Resource
    private UsersMapper usersMapper;
    @Autowired(required = false)
    private FilesMapper filesMapper;
    @Override
    public Users findOne(Users user) {
        Users onlineUser = usersMapper.findOne(user);
        return onlineUser;
    }

    public int insert(Users users){
        int update = usersMapper.insert(users);
        Long id = users.getId();
        List<Files> filesList=users.getFilesList();
        for (Files files:filesList){
            files.setLinkId(id);
            files.setLinkTable("用户管理表");
            filesMapper.insert(files);
        }



        return update;
    }
    public  int update(Users users){
        int update = usersMapper.update(users);
        List<Files> filesList=users.getFilesList();
        if(filesList!=null){
            for (Files files:filesList){
                files.setLinkTable("用户管理表");
                files.setLinkId(users.getId());
                filesMapper.update(files);
            }
        }

        return update;
    }
}
