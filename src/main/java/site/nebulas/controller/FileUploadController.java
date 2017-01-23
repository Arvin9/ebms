package site.nebulas.controller;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import site.nebulas.beans.File;
import site.nebulas.util.FTPUtil;

@Controller
public class FileUploadController {
	private Logger logger = LoggerFactory.getLogger(FileUploadController.class);
	
	/**
	 * 文件上传页面
	 * */
	@RequestMapping("fineUploader")
	public ModelAndView fineUploader(){
		ModelAndView model = new ModelAndView("fineUploader");
		return model;
	}
	
	@RequestMapping("/fineUploadFile")
	@ResponseBody
	public Object fineUploadFile(@RequestParam("qqfile")MultipartFile uploadFile) throws IOException{
		File file = new File();
		FTPUtil ftpUtil = new FTPUtil(); 
		if (uploadFile!=null&&!uploadFile.isEmpty()) {
			String filename = Long.toString(System.currentTimeMillis()) + "-" + uploadFile.getOriginalFilename();
			
			String url = ftpUtil.uploadFile(filename,uploadFile.getInputStream());
			System.out.println(url);
			/**
			 * To Do:
			 * 将文件信息存入数据库
			 * */
			
			/*
			file.setFileName(uploadFile.getOriginalFilename());
			file.setFileType(uploadFile.getContentType());
			file.setFileSize(uploadFile.getSize());
			file.setFielContent(uploadFile.getBytes());
			file.setAddTime(DateUtil.getTime());    
			logger.info("uploadFileName:"+file.getFileName());
			logger.info("uploadFileType:"+file.getFileType());
			logger.info("uploadFileSize:"+file.getFileSize());
			*/
		}
		logger.info("fineUploadFile debug");
		file.setSuccess("true");
		return file;
	}
}
