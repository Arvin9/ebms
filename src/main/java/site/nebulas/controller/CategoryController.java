package site.nebulas.controller;

import com.alibaba.fastjson.JSON;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import site.nebulas.beans.Category;
import site.nebulas.service.CategoryService;
import site.nebulas.service.OperationService;
import site.nebulas.util.DateUtil;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2017/2/25.
 */
@Controller
public class CategoryController {
    @Resource
    CategoryService categoryService;
    @Resource
    OperationService operationService;
    /**
     * 类别页面
     * */
    @RequestMapping("category")
    public ModelAndView category(){
        ModelAndView model = new ModelAndView("category");
        return model;
    }

    @RequestMapping("categoryQueryByParam")
    @ResponseBody
    public Object categoryQueryByParam(Category category){
        return categoryService.queryByParam(category);
    }

    @RequestMapping("categoryInsert")
    @ResponseBody
    public void categoryInsert(Category category){
        category.setCreateTime(DateUtil.getTime());

        // 获得当前用户名
        Subject subject = SecurityUtils.getSubject();
        String userAccount = (String)subject.getPrincipal();
        operationService.inster(userAccount,"添加类别:"+ JSON.toJSON(category));

        categoryService.inster(category);
    }

    @RequestMapping("categoryUpdate")
    @ResponseBody
    public void categoryUpdate(Category category){
        // 获得当前用户名
        Subject subject = SecurityUtils.getSubject();
        String userAccount = (String)subject.getPrincipal();
        operationService.inster(userAccount,"修改类别:"+ JSON.toJSON(category));

        categoryService.update(category);
    }
}
