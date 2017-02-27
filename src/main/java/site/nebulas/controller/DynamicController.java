package site.nebulas.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import site.nebulas.beans.Action;
import site.nebulas.beans.Dynamic;
import site.nebulas.service.ActionService;
import site.nebulas.service.DynamicService;
import site.nebulas.util.DateUtil;

import javax.annotation.Resource;

/**
 * @author Honghui
 * @version 0.1 20170227
 */
@Controller
public class DynamicController {
    @Resource
    DynamicService dynamicService;
    /**
     * 用户动态页面
     * */
    @RequestMapping("dynamic")
    public ModelAndView dynamic(){
        ModelAndView model = new ModelAndView("dynamic");
        return model;
    }

    @RequestMapping("dynamicQueryByParam")
    @ResponseBody
    public Object dynamicQueryByParam(Dynamic dynamic){
        return dynamicService.queryByParam(dynamic);
    }

}
