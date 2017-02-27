package site.nebulas.controller;

import com.alibaba.fastjson.JSON;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import site.nebulas.beans.Users;
import site.nebulas.service.OperationService;
import site.nebulas.service.UsersService;
import site.nebulas.util.DateUtil;

import javax.annotation.Resource;

/**
 * @author Honghui
 * @version 0.1 20170227
 */
@Controller
public class UsersController {
    @Resource
    UsersService usersService;
    @Resource
    OperationService operationService;

    /**
     * 用户动态事件页面
     * */
    @RequestMapping("users")
    public ModelAndView users(){
        ModelAndView model = new ModelAndView("users");
        return model;
    }

    @RequestMapping("usersQueryByParam")
    @ResponseBody
    public Object usersQueryByParam(Users users){
        return usersService.queryByParam(users);
    }

    @RequestMapping("usersInsert")
    @ResponseBody
    public void usersInsert(Users users){
        users.setAddTime(DateUtil.getTime());
        // 获得当前用户名
        Subject subject = SecurityUtils.getSubject();
        String userAccount = (String)subject.getPrincipal();
        operationService.inster(userAccount,"添加用户:"+ JSON.toJSON(users));

        usersService.inster(users);
    }

    @RequestMapping("usersUpdate")
    @ResponseBody
    public void usersUpdate(Users users){
        // 获得当前用户名
        Subject subject = SecurityUtils.getSubject();
        String userAccount = (String)subject.getPrincipal();
        operationService.inster(userAccount,"修改用户动态事件:"+ JSON.toJSON(users));

        usersService.update(users);
    }
}
