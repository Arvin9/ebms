package site.nebulas.controller;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import site.nebulas.service.ChartsService;

@Controller
public class ChartsController {
	@Resource
	ChartsService chartsService;

	/**
	 * @author Honghui
	 * @date 20170303
	 * 查询每日登录用户数
	 * 一个用户在当天登录多次，以一次有效登录计算
	 * */
	@RequestMapping("queryUserLoginCount")
	@ResponseBody
	public Object queryUserLoginCount(){
		return chartsService.queryUserLoginCount();
	}

	/**
	 * 用户访问页面数据量
	 * */
	@RequestMapping("queryUserVisitPage")
	@ResponseBody
	public Object queryUserVisitPage(){
		return chartsService.queryUserVisitPage();
	}

	/**
	 * 用户总学习指标
	 * */
	@RequestMapping("queryTotalStudyIndex")
	@ResponseBody
	public Object queryTotalStudyIndex(){
		return chartsService.queryTotalStudyIndex();
	}
	
	
}
