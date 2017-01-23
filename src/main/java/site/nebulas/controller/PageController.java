package site.nebulas.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;

import site.nebulas.service.ChartsService;
import site.nebulas.service.UserService;



@Controller
public class PageController {
	@Resource
	UserService userService;
	@Resource
	ChartsService chartsService;
	
	@RequestMapping("login")
	public ModelAndView login(){
		ModelAndView model = new ModelAndView("login");
		return model;
	}
	@RequestMapping("home")
	public ModelAndView home(){
		ModelAndView model = new ModelAndView("home");
		//用户访问页面数据量
		model.addObject("userVisitPageMap", JSON.toJSON(chartsService.queryUserVisitPage()));
		//每日用户登录量
		model.addObject("userLoginCountMap", JSON.toJSON(chartsService.queryUserLoginCount()));
		return model;
	}
	
	
	/**
	 * 模板页面
	 * */
	@RequestMapping("template")
	public ModelAndView template(){
		ModelAndView model = new ModelAndView("template");
		return model;
	}
	
}
