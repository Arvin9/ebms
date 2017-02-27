package site.nebulas.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import site.nebulas.beans.Dynamic;
import site.nebulas.beans.Operation;
import site.nebulas.service.DynamicService;
import site.nebulas.service.OperationService;

import javax.annotation.Resource;

/**
 * @author Honghui
 * @version 0.1 20170227
 */
@Controller
public class OperationController {
    @Resource
    OperationService operationService;
    /**
     * 管理员操作记录页面
     * */
    @RequestMapping("operation")
    public ModelAndView operation(){
        ModelAndView model = new ModelAndView("operation");
        return model;
    }

    @RequestMapping("operationQueryByParam")
    @ResponseBody
    public Object operationQueryByParam(Operation operation){
        return operationService.queryByParam(operation);
    }

}
