package site.nebulas.dao;

import site.nebulas.beans.Operation;
import java.util.List;

/**
 * @author CaiHonghui
 * @date 20160921
 */
public interface OperationDao {

	public List<Operation> queryByParam(Operation operation);
	
    public void inster(Operation operation);

}

