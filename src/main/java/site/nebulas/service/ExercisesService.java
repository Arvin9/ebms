package site.nebulas.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import site.nebulas.beans.Exercises;
import site.nebulas.dao.ExercisesDao;

@Service
public class ExercisesService {
	@Resource
	private ExercisesDao exercisesDao;

    public List<Exercises> queryByParam(Exercises exercises){
    	return exercisesDao.queryByParam(exercises);
    }
	
    public void inster(Exercises exercises){
    	exercisesDao.inster(exercises);
    }
    
    public void update(Exercises exercises){
    	exercisesDao.update(exercises);
    }
    
    public void delete(Exercises exercises){
    	exercisesDao.delete(exercises);
    }
   
    public Object queryExercisesCount(){
    	List<Exercises> list = exercisesDao.queryByParam(null);
    	Map<String,Object> map = new HashMap<String,Object>();
    	
    	List<Integer> exercisesId = new ArrayList<Integer>();
    	List<Integer> answerCount = new ArrayList<Integer>();
    	List<Integer> answerCorrectCount = new ArrayList<Integer>();
    	List<Integer> answerErrorCount = new ArrayList<Integer>();
    	for (Exercises ex : list){
    		exercisesId.add(ex.getExercisesId());
    		answerCount.add(ex.getAnswerCount());
    		answerCorrectCount.add(ex.getAnswerCorrectCount());
    		answerErrorCount.add(ex.getAnswerCorrectCount() - ex.getAnswerCount());
    	}
    	map.put("exercisesId", exercisesId);
    	map.put("answerCount", answerCount);
    	map.put("answerCorrectCount", answerCorrectCount);
    	map.put("answerErrorCount", answerErrorCount);
    	return map;
    }
}


