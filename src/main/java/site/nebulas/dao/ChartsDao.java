package site.nebulas.dao;

import java.util.List;
import java.util.Map;


/**
 * @author Honghui
 * @date 20170303
 */
public interface ChartsDao {

	public List<Map<String,Object>> queryUserVisitPage();
	/**
	 * @author Honghui
	 * @date 20170303
	 * 查询每日登录用户数
	 * 一个用户在当天登录多次，以一次有效登录计算
	 * */
	public List<Map<String,Object>> queryUserLoginCount();
}

