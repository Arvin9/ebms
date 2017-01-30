package site.nebulas.dao;

import site.nebulas.beans.Category;
import java.util.List;

/**
 * @author Honghui
 * @date 20170130
 */
public interface CategoryDao {

	public List<Category> queryByParam(Category category);
	
    public void inster(Category category);
    
    public void update(Category category);

}

