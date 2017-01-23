package site.nebulas.controller;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import site.nebulas.beans.Timeline;
import site.nebulas.service.TimelineService;
import site.nebulas.util.DateUtil;

@Controller
public class TimelineController {
	@Resource
	TimelineService timelineService;
	
	/**
	 * 时间轴页面
	 * */
	@RequestMapping("timeline")
	public ModelAndView timeline(){
		ModelAndView model = new ModelAndView("timeline");
		return model;
	}
	/**
	 * 时间轴展示页面
	 * */
	@RequestMapping("timelineShow")
	public ModelAndView timelineShow(){
		ModelAndView model = new ModelAndView("timelineShow");
		return model;
	}
	
	@RequestMapping("timelineQueryByParam")
	@ResponseBody
	public Object timelineQueryByParam(Timeline timeline){
		return timelineService.queryByParam(timeline);
	}
	
	@RequestMapping("timelineInsert")
	@ResponseBody
	public void timelineInsert(Timeline timeline){
		timeline.setTimelineAddTime(DateUtil.getTime());
		timelineService.inster(timeline);
	}
	
	@RequestMapping("timelineUpdate")
	@ResponseBody
	public void timelineUpdate(Timeline timeline){
		timelineService.update(timeline);
	}
	
	@RequestMapping("timelineDelete")
	@ResponseBody
	public void timelineDelete(Timeline timeline){
		timelineService.delete(timeline);
	}
}
