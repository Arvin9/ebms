package site.nebulas.service;

import org.springframework.stereotype.Service;
import site.nebulas.beans.Category;
import site.nebulas.dao.CategoryDao;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CategoryService {
	@Resource
	private CategoryDao categoryDao;

    public List<Category> queryByParam(Category category){
    	return categoryDao.queryByParam(category);
    }
	
    public void inster(Category category){
        categoryDao.inster(category);
    }
    
    public void update(Category category){
        categoryDao.update(category);
    }
   
}


