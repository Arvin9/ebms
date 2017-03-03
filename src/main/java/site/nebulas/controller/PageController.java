package site.nebulas.controller;

import javax.annotation.Resource;

import com.alibaba.fastjson.JSON;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import site.nebulas.service.ChartsService;
import site.nebulas.service.MasterService;



@Controller
public class PageController {
	@Resource
    MasterService masterService;
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
