package site.nebulas.service;

import org.springframework.stereotype.Service;
import site.nebulas.beans.SysParam;
import site.nebulas.dao.SysParamDao;
import javax.annotation.Resource;
import java.util.List;

@Service
public class SysParamService {
	@Resource
	private SysParamDao sysParamDao;

    public List<SysParam> queryByParam(SysParam sysParam){
    	return sysParamDao.queryByParam(sysParam);
    }

    public SysParam queryByName(String name){
        SysParam sysParam = new SysParam();
        sysParam.setName(name);
        return sysParamDao.queryByParam(sysParam).get(0);
    }
	
    public void inster(SysParam sysParam){
        sysParamDao.inster(sysParam);
    }
    
    public void update(SysParam sysParam){
        sysParamDao.update(sysParam);
    }
   
}


