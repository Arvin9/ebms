package site.nebulas.controller;

import com.alibaba.fastjson.JSON;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import site.nebulas.beans.Response;
import site.nebulas.beans.Users;
import site.nebulas.service.OperationService;
import site.nebulas.service.UsersService;
import site.nebulas.util.DateUtil;

import javax.annotation.Resource;
import java.util.List;

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


    @RequestMapping("usersUpdate")
    @ResponseBody
    public void usersUpdate(Users users){
        // 写入操作记录
        operationService.inster("修改用户动态事件:"+ JSON.toJSON(users));

        usersService.update(users);
    }

    @RequestMapping("isValidityOfUserName")
    @ResponseBody
    public Response isValidityOfUserName(Users users){
        Response response = new Response();
        List<Users> usersList = usersService.queryByParam(users);
        if (null == usersList || usersList.isEmpty() || usersList.size() == 0) {
            response.setRet(1);
            response.setMsg("可以进行添加");
        } else {
            response.setRet(0);
            response.setMsg("用户已存在");
        }
        return response;
    }
    /**
     * 添加用户，初始化密码666666
     * */
    @RequestMapping("registerUser")
    @ResponseBody
    public Response registerUser(Users users){
        Response response = new Response();
        usersService.registerUser(users);
        // 写入操作记录
        operationService.inster("添加用户:"+ JSON.toJSON(users));
        return response;
    }

    /**
     * 锁定用户
     * */
    @RequestMapping("lockUser")
    @ResponseBody
    public Response lockUser(Users users){
        Response response = new Response();
        users.setIsLock(1);
        usersService.update(users);
        // 写入操作记录
        operationService.inster("锁定用户:"+ JSON.toJSON(users));
        return response;
    }
    /**
     * 解锁用户
     * */
    @RequestMapping("unlockUser")
    @ResponseBody
    public Response unlockUser(Users users){
        Response response = new Response();
        users.setIsLock(0);
        usersService.update(users);
        // 写入操作记录
        operationService.inster("解锁用户:"+ JSON.toJSON(users));
        return response;
    }

    /**
     * 重置用户密码
     * */
    @RequestMapping("resetPassword")
    @ResponseBody
    public Response resetPassword(Users users){
        Response response = new Response();
        usersService.resetPassword(users);
        // 写入操作记录
        operationService.inster("重置用户密码:"+ JSON.toJSON(users));
        return response;
    }

}
