package site.nebulas.service;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import site.nebulas.beans.Operation;
import site.nebulas.dao.OperationDao;
import site.nebulas.util.DateUtil;

@Service
public class OperationService {
	@Resource
	private OperationDao operationDao;

    public List<Operation> queryByParam(Operation operation){
    	return operationDao.queryByParam(operation);
    }
	
    public void inster(String userAccount,String content){
		Operation operation = new Operation();
		operation.setUserAccount(userAccount);
		operation.setContent(content);
		operation.setCreateTime(DateUtil.getTime());
		operationDao.inster(operation);
    }
}


