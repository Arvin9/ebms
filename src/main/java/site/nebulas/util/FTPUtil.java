package site.nebulas.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.SocketException;

import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class FTPUtil {
	private Logger logger = LoggerFactory.getLogger(FTPUtil.class);
	/**  
     * @param path 上传到ftp服务器哪个路径下     
     * @param addr 地址  
     * @param port 端口号  
     * @param username 用户名  
     * @param password 密码  
     * @return  
     * @throws Exception  
     */
	private  FTPClient ftp;
	/**
	 * TO DO
	 * 根据年月来改变path路径
	 * */
	private String path = "/var/www/html/file";
	private String addr = "115.29.52.104";
	private int port = 21;
	private String username = "file";
	private String password = "314159";
	
	public  String uploadFile(String filename,InputStream input){      
        String url = "http://file.nebulas.site/file/";
        url += filename;
        ftp = new FTPClient();
        int reply;      
        try {
			ftp.connect(addr,port);
			
			ftp.enterLocalPassiveMode();
	        ftp.setFileTransferMode(FTPClient.BINARY_FILE_TYPE);
	        ftp.setControlEncoding("UTF-8");
			
	        ftp.login(username,password);
	        
			ftp.setFileType(FTPClient.BINARY_FILE_TYPE);
	        reply = ftp.getReplyCode();
	        logger.info("FTP reply code:" + reply);
	        if (!FTPReply.isPositiveCompletion(reply)) {      
	            ftp.disconnect();
	            logger.info("错误产生：FTP关闭连接....");
	        }      
	        ftp.changeWorkingDirectory(path);
	        logger.info("FTP上传目录：" + path);
	        //FileInputStream input = new FileInputStream(file);      
			ftp.storeFile(filename, input);      
			input.close();
			logger.info("FTP退出登录:" + ftp.logout());
		} catch (SocketException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally { 
	        if (ftp.isConnected()) { 
	            try { 
	                ftp.disconnect();
	                logger.info("FTP关闭连接....");
	            } catch (IOException ioe) { 
	            } 
	        } 
	    }      
        return url;      
    }
	 
	 public static void main(String[] args) throws Exception{    
		 FTPUtil t = new FTPUtil();    
		 //t.connect("/home/file", "115.29.52.104", 21, "file", "314159");    
		 File file = new File("C:/Users/Administrator/Desktop/Pager.zip");
//		 File file2 = new File("D:/Pager.java");
//		 FileOutputStream fs = new FileOutputStream(file2);
//		 FileInputStream input = new FileInputStream(file);
//		 int in = input.read();
//		 while(in!=-1){
//			 fs.write(in);
//			 in = input.read();
//		 }
		 //t.uploadFile(file);    
	 }  
}
