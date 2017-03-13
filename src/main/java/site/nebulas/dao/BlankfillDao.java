package site.nebulas.dao;

import site.nebulas.beans.Blankfill;
import java.util.List;
import java.util.Map;

/**
 * @author Honghui
 * @date 20160930
 */
public interface BlankfillDao {

	public List<Blankfill> queryByParam(Blankfill blankfill);
	
    public void inster(Blankfill blankfill);
    
    public void update(Blankfill blankfill);

    public List<Map> queryBlankfillAnalyze();

}

