package site.nebulas.dao;

import java.util.List;

import site.nebulas.beans.Exercises;

/**
 * @author CaiHonghui
 * @date 20160921
 */
public interface ExercisesDao {

	public List<Exercises> queryByParam(Exercises exercises);
	
    public void inster(Exercises exercises);
    
    public void update(Exercises exercises);
    
    public void delete(Exercises exercises);

}

