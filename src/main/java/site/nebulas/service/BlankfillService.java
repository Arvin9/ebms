package site.nebulas.service;

import org.springframework.stereotype.Service;
import site.nebulas.beans.Blankfill;
import site.nebulas.dao.BlankfillDao;

import javax.annotation.Resource;
import java.util.List;

@Service
public class BlankfillService {
	@Resource
	private BlankfillDao blankfillDao;

    public List<Blankfill> queryByParam(Blankfill blankfill){
    	return blankfillDao.queryByParam(blankfill);
    }
	
    public void inster(Blankfill blankfill){
        blankfillDao.inster(blankfill);
    }
    
    public void update(Blankfill blankfill){
        blankfillDao.update(blankfill);
    }
   
}


