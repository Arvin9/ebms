package site.nebulas.service;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import site.nebulas.beans.Timeline;
import site.nebulas.dao.TimelineDao;

@Service
public class TimelineService {
	@Resource
	private TimelineDao timelineDao;

    public List<Timeline> queryByParam(Timeline timeline){
    	return timelineDao.queryByParam(timeline);
    }
	
    public void inster(Timeline timeline){
    	timelineDao.inster(timeline);
    }
    
    public void update(Timeline timeline){
    	timelineDao.update(timeline);
    }
    
    public void delete(Timeline timeline){
    	timelineDao.delete(timeline);
    }
   
}


