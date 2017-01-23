package site.nebulas.dao;

import java.util.List;
import java.util.Map;


/**
 * @author CaiHonghui
 * @date 20160921
 */
public interface ChartsDao {

	public List<Map<String,Object>> queryUserVisitPage();

	public List<Map<String,Object>> queryUserLoginCount();
}

