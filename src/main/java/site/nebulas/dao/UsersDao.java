package site.nebulas.dao;

import site.nebulas.beans.Users;
import java.util.List;

/**
 * @author Honghui
 * @version 0.1 20170227
 */
public interface UsersDao {

	public List<Users> queryByParam(Users users);
	
    public void inster(Users users);
    
    public void update(Users users);

}

