package site.nebulas.service;

import org.springframework.stereotype.Service;
import site.nebulas.beans.Action;
import site.nebulas.dao.ActionDao;
import javax.annotation.Resource;
import java.util.List;

@Service
public class ActionService {
	@Resource
	private ActionDao actionDao;

    public List<Action> queryByParam(Action action){
    	return actionDao.queryByParam(action);
    }
	
    public void inster(Action action){
        actionDao.inster(action);
    }
    
    public void update(Action action){
        actionDao.update(action);
    }
   
}


