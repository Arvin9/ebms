package site.nebulas.dao;

import site.nebulas.beans.Dynamic;
import java.util.List;

/**
 * @author Honghui
 * @version 0.1 20170227
 */
public interface DynamicDao {

	public List<Dynamic> queryByParam(Dynamic dynamic);

}

