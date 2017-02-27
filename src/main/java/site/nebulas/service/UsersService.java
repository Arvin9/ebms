package site.nebulas.service;

import org.springframework.stereotype.Service;
import site.nebulas.beans.Users;
import site.nebulas.dao.UsersDao;
import javax.annotation.Resource;
import java.util.List;

@Service
public class UsersService {
	@Resource
	private UsersDao usersDao;

    public List<Users> queryByParam(Users users){
    	return usersDao.queryByParam(users);
    }
	
    public void inster(Users users){
        usersDao.inster(users);
    }
    
    public void update(Users users){
        usersDao.update(users);
    }
   
}


