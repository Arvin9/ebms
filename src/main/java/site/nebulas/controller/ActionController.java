package site.nebulas.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import site.nebulas.beans.Action;
import site.nebulas.service.ActionService;
import site.nebulas.util.DateUtil;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2017/1/30.
 */
@Controller
public class ActionController {
    @Resource
    ActionService actionService;
    /**
     * 用户动态事件页面
     * */
    @RequestMapping("action")
    public ModelAndView action(){
        ModelAndView model = new ModelAndView("action");
        return model;
    }

    @RequestMapping("actionQueryByParam")
    @ResponseBody
    public Object actionQueryByParam(Action action){
        return actionService.queryByParam(action);
    }

    @RequestMapping("actionInsert")
    @ResponseBody
    public void actionInsert(Action action){
        action.setCreateTime(DateUtil.getTime());
        actionService.inster(action);
    }

    @RequestMapping("actionUpdate")
    @ResponseBody
    public void actionUpdate(Action action){
        actionService.update(action);
    }
}
