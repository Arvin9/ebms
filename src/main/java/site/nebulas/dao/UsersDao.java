package site.nebulas.dao;

import site.nebulas.beans.Users;
import java.util.List;
import java.util.Map;

/**
 * @author Honghui
 * @version 0.1 20170227
 */
public interface UsersDao {

	public List<Users> queryByParam(Users users);
	
    public void inster(Users users);
    
    public void update(Users users);

    public List<Map> queryUsersAnalyze();

    public Map queryCompletionDegree(Users users);

    public List<Map> queryStudyIndex(Users users);
}

