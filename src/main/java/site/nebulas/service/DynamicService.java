package site.nebulas.service;

import org.springframework.stereotype.Service;
import site.nebulas.beans.Dynamic;
import site.nebulas.dao.DynamicDao;

import javax.annotation.Resource;
import java.util.List;

@Service
public class DynamicService {
	@Resource
	private DynamicDao dynamicDao;

    public List<Dynamic> queryByParam(Dynamic dynamic){
    	return dynamicDao.queryByParam(dynamic);
    }
	
}


