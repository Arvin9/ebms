package site.nebulas.dao;

import java.util.List;

import site.nebulas.beans.Timeline;

/**
 * @author Honghui
 * @date 20160930
 */
public interface TimelineDao {

	public List<Timeline> queryByParam(Timeline timeline);
	
    public void inster(Timeline timeline);
    
    public void update(Timeline timeline);
    
    public void delete(Timeline timeline);

}

