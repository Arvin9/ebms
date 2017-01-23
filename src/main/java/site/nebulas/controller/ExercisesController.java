package site.nebulas.controller;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;

import site.nebulas.beans.Exercises;
import site.nebulas.service.ExercisesService;

@Controller
public class ExercisesController {
	@Resource
	ExercisesService exercisesService;
	
	@RequestMapping("exercises")
	public ModelAndView exercises(){
		ModelAndView model = new ModelAndView("exercises");
		return model;
	}
	
	@RequestMapping("exercisesQueryByParam")
	@ResponseBody
	public Object exercisesQueryByParam(Exercises exercises){
		return exercisesService.queryByParam(exercises);
	}
	
	@RequestMapping("exercisesInsert")
	@ResponseBody
	public void exercisesInsert(Exercises exercises){
		exercisesService.inster(exercises);
	}
	
	@RequestMapping("exercisesUpdate")
	@ResponseBody
	public void exercisesUpdate(Exercises exercises){
		exercisesService.update(exercises);
	}
	
	@RequestMapping("exercisesDelete")
	@ResponseBody
	public void exercisesDelete(Exercises exercises){
		exercisesService.delete(exercises);
	}
	
	/**
	 * exercise图表
	 * */
	@RequestMapping("exerciseChart")
	public ModelAndView exerciseChart(){
		ModelAndView model = new ModelAndView("exerciseChart");
		//每日用户登录量
		model.addObject("exercisesCountMap", JSON.toJSON(exercisesService.queryExercisesCount()));
		return model;
	}
}
