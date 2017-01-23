package site.nebulas.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;

import site.nebulas.beans.Article;
import site.nebulas.service.ArticleService;
import site.nebulas.util.DateUtil;

@Controller
public class ArticleController {
	@Resource
	ArticleService articleService;
	
	@RequestMapping("article")
	public ModelAndView article(){
		ModelAndView model = new ModelAndView("article");
		return model;
	}
	
	@RequestMapping("articleQueryByParam")
	@ResponseBody
	public Object articleQueryByParam(Article article){
		return articleService.queryByParam(article);
	}
	
	@RequestMapping("articleInsert")
	@ResponseBody
	public void articleInsert(Article article){
		//获得当前用户名
		Subject subject = SecurityUtils.getSubject();
		String userAccount = (String)subject.getPrincipal();
		
		article.setUserAccount(userAccount);
		article.setArticleCreateTime(DateUtil.getTime());
		article.setArticleUpdateTime(DateUtil.getTime());
		articleService.inster(article);
	}
	/**
	 * honghui
	 * 文章更新
	 * */
	@RequestMapping("articleUpdate")
	@ResponseBody
	public void articleUpdate(Article article){
		article.setArticleUpdateTime(DateUtil.getTime());
		article.setArticleStates(0);
		articleService.update(article);
	}
	/**
	 * honghui
	 * 文章状态更新
	 * */
	@RequestMapping("articleUpdateStatus")
	@ResponseBody
	public void articleUpdateStatus(Article article){
		articleService.update(article);
	}
	/**
	 * honghui
	 * 文章删除，暂未使用
	 * */
	@RequestMapping("articleDelete")
	@ResponseBody
	public void articleDelete(Article article){
		article.setArticleStates(3);
		articleService.update(article);
	}
	
	
	
	
	@RequestMapping("articleShow")
	public ModelAndView articleShow(){
		ModelAndView model = new ModelAndView("articleShow");
		return model;
	}
	
	@RequestMapping("articleQueryForShow")
	@ResponseBody
	public Object articleQueryForShow(Article article){
		return articleService.queryForShow(article);
	}
	
	@RequestMapping("articleDetail")
	public ModelAndView articleDetail(Article article){
		ModelAndView model = new ModelAndView("articleDetail");
		
		List<Article> list = articleService.queryByParam(article);
		//文章浏览
		articleService.articlePageViewIncrease(article);
		
		model.addObject("articleDetail", JSON.toJSON(list.get(0)));
		return model;
	}
	
	/**
	 * 文章点赞事件
	 * */
	@RequestMapping("articleLike")
	@ResponseBody
	public void articleLike(Article article){
		articleService.articleLikeIncrease(article);
	}
	/**
	 * 文章不喜欢事件
	 * */
	@RequestMapping("articleDisLike")
	@ResponseBody
	public void articleDisLike(Article article){
		articleService.articleDisLikeIncrease(article);
	}
	/**
	 * 获取文章详细信息
	 * */
	@RequestMapping("getArticleDetail")
	@ResponseBody
	public Object getArticleDetail(Article article){
		List<Article> list = articleService.queryByParam(article);
		return JSON.toJSON(list.get(0));
	}
}
