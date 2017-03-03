package site.nebulas.controller;

import com.alibaba.fastjson.JSON;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import site.nebulas.beans.Action;
import site.nebulas.beans.SysParam;
import site.nebulas.service.ActionService;
import site.nebulas.service.OperationService;
import site.nebulas.service.SysParamService;
import site.nebulas.util.DateUtil;

import javax.annotation.Resource;

/**
 * @author Honghui
 * @version 0.1 20170303
 */
@Controller
public class SysParamController {
    @Resource
    SysParamService sysParamService;
    @Resource
    OperationService operationService;
    /**
     * 参数配置页面
     * */
    @RequestMapping("paramConfig")
    public ModelAndView paramConfig(){
        ModelAndView model = new ModelAndView("paramConfig");
        return model;
    }

    @RequestMapping("sysParamQueryByParam")
    @ResponseBody
    public Object sysParamQueryByParam(SysParam sysParam){
        return sysParamService.queryByParam(sysParam);
    }

    @RequestMapping("sysParamInsert")
    @ResponseBody
    public void sysParamInsert(SysParam sysParam){
        sysParam.setCreateTime(DateUtil.getTime());
        // 写入操作记录
        operationService.inster("添加系统配置参数:"+ JSON.toJSON(sysParam));

        sysParamService.inster(sysParam);
    }

    @RequestMapping("sysParamUpdate")
    @ResponseBody
    public void sysParamUpdate(SysParam sysParam){
        // 写入操作记录
        operationService.inster("修改系统配置参数:"+ JSON.toJSON(sysParam));

        sysParamService.update(sysParam);
    }

    @RequestMapping("sysParamQueryByName")
    @ResponseBody
    public Object sysParamQueryByName(String name){
        return sysParamService.queryByName(name);
    }
}
