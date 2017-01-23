package site.nebulas.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import site.nebulas.dao.ChartsDao;
import site.nebulas.util.DateUtil;

@Service
public class ChartsService {
	@Resource
	private ChartsDao chartsDao;

	/**
	 * 用户访问页面数据量
	 * */
	public Map<String,Object> queryUserVisitPage(){
		Map<String,Object> userVisitPageMap = new HashMap<String,Object>();
		
		String[] legendData = {"答题页面","留言页面","客服机器人页面"};
		userVisitPageMap.put("legendData", legendData);
		
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		list = chartsDao.queryUserVisitPage();
		
		List<Map<String,Object>> tempList = new ArrayList<Map<String,Object>>();
		Map<String,Object> tempMap;
		String type;
		for(Map<String,Object> m : list){
			//tempList.add(tempMap)添加的是句柄,若放在循环外,则内容全为最终值
			tempMap = new HashMap<String,Object>();
			type = m.get("dynamicTyle").toString();
			if(null == type)
				continue;
			if("2".equals(type)){
				tempMap.put("value", m.get("amount"));
				tempMap.put("name", "答题页面");
				tempList.add(tempMap);
			}
			if("3".equals(type)){
				tempMap.put("value", m.get("amount"));
				tempMap.put("name", "留言页面");
				tempList.add(tempMap);
			}
			if("5".equals(type)){
				tempMap.put("value", m.get("amount"));
				tempMap.put("name", "客服机器人页面");
				tempList.add(tempMap);
			}
		}
		userVisitPageMap.put("seriesData", tempList);
    	return userVisitPageMap;
    }
	
	/**
	 * 每日用户登录量
	 * */
	public Map<String,Object> queryUserLoginCount(){
		Map<String,Object> userLoginCountMap = new HashMap<String,Object>();
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		list = chartsDao.queryUserLoginCount();
		//获取开始时间、结束时间
		String beginDate = list.get(0).get("loginTime").toString();
		String endDate = DateUtil.getDate();
		
		//构造时间序列
		List<String> dateList = new ArrayList<String>();
		dateList = DateUtil.getDateList(beginDate, endDate);
		userLoginCountMap.put("date", dateList);
		//构造data
		List<String> dataList = new ArrayList<String>();
		for(String s : dateList){
			boolean b = false;
			for(Map<String,Object> m : list){
				if(s.equals(m.get("loginTime").toString())){
					dataList.add(m.get("amount").toString());
					b = true;
				}
			}
			if(!b){
				dataList.add("0");
			}
		}
		userLoginCountMap.put("data", dataList);
		return userLoginCountMap;
	}
}


