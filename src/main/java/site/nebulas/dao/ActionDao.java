package site.nebulas.dao;

import site.nebulas.beans.Action;
import java.util.List;

/**
 * @author Honghui
 * @version 0.1 20170227
 */
public interface ActionDao {

	public List<Action> queryByParam(Action action);
	
    public void inster(Action action);
    
    public void update(Action action);

}

