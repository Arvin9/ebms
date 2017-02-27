package site.nebulas.controller;

import com.alibaba.fastjson.JSON;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import site.nebulas.beans.Action;
import site.nebulas.service.ActionService;
import site.nebulas.service.OperationService;
import site.nebulas.util.DateUtil;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2017/1/30.
 */
@Controller
public class ActionController {
    @Resource
    ActionService actionService;
    @Resource
    OperationService operationService;
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
        // 获得当前用户名
        Subject subject = SecurityUtils.getSubject();
        String userAccount = (String)subject.getPrincipal();
        operationService.inster(userAccount,"添加用户动态事件:"+ JSON.toJSON(action));

        actionService.inster(action);
    }

    @RequestMapping("actionUpdate")
    @ResponseBody
    public void actionUpdate(Action action){
        // 获得当前用户名
        Subject subject = SecurityUtils.getSubject();
        String userAccount = (String)subject.getPrincipal();
        operationService.inster(userAccount,"修改用户动态事件:"+ JSON.toJSON(action));

        actionService.update(action);
    }
}
