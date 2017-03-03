package site.nebulas.dao;

import site.nebulas.beans.SysParam;
import java.util.List;

/**
 * @author Honghui
 * @version 0.1 20170303
 */
public interface SysParamDao {

	public List<SysParam> queryByParam(SysParam sysParam);
	
    public void inster(SysParam sysParam);
    
    public void update(SysParam sysParam);

}

