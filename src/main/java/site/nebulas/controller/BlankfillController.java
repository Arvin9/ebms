package site.nebulas.controller;

import com.alibaba.fastjson.JSON;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import site.nebulas.beans.Blankfill;
import site.nebulas.beans.Category;
import site.nebulas.service.BlankfillService;
import site.nebulas.service.CategoryService;
import site.nebulas.service.OperationService;
import site.nebulas.util.DateUtil;
import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2017/1/30.
 */
@Controller
public class BlankfillController {
    @Resource
    BlankfillService blankfillService;
    @Resource
    CategoryService categoryService;
    @Resource
    OperationService operationService;
    /**
     * 题目页面
     * */
    @RequestMapping("blankfill")
    public ModelAndView blankfill(){
        ModelAndView model = new ModelAndView("blankfill");
        model.addObject("categoryList", JSON.toJSON(categoryService.queryByParam(null)));
        return model;
    }

    @RequestMapping("blankfillQueryByParam")
    @ResponseBody
    public Object blankfillQueryByParam(Blankfill blankfill){
        return blankfillService.queryByParam(blankfill);
    }

    @RequestMapping("blankfillInsert")
    @ResponseBody
    public void blankfillInsert(Blankfill blankfill){
        blankfill.setCreateTime(DateUtil.getTime());
        // 写入操作记录
        operationService.inster("添加题目:"+ JSON.toJSON(blankfill));

        blankfillService.inster(blankfill);
    }

    @RequestMapping("blankfillUpdate")
    @ResponseBody
    public void blankfillUpdate(Blankfill blankfill){
        // 写入操作记录
        operationService.inster("修改题目:"+ JSON.toJSON(blankfill));

        blankfillService.update(blankfill);
    }
    /**
     * 题目分析页面
     * */
    @RequestMapping("blankfillAnalyze")
    public ModelAndView blankfillAnalyze(){
        return new ModelAndView("blankfillAnalyze");
    }
    @RequestMapping("queryBlankfillAnalyze")
    @ResponseBody
    public Object queryBlankfillAnalyze(){
        return blankfillService.queryBlankfillAnalyze();
    }
}
