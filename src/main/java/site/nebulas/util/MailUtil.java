package site.nebulas.util;

import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class MailUtil {
	private static Logger log = LoggerFactory.getLogger(MailUtil.class);
	
	public static void sendMailTest(){
		final Properties props = new Properties();
		// 表示SMTP发送邮件，需要进行身份验证
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.host", "smtp.yeah.net");
        // 发件人的账号
        props.put("mail.user", "info_nebulas@yeah.net");
        // 访问SMTP服务时需要提供的密码
        props.put("mail.password", "nebula94");
        // 构建授权信息，用于进行SMTP进行身份验证
        Authenticator authenticator = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                // 用户名、密码
                String userName = props.getProperty("mail.user");
                String password = props.getProperty("mail.password");
                return new PasswordAuthentication(userName, password);
            }
        };
		// 使用环境属性和授权信息，创建邮件会话
        Session mailSession = Session.getInstance(props, authenticator);
        // 创建邮件消息
        MimeMessage message = new MimeMessage(mailSession);
        try {
        	// 设置发件人
            InternetAddress form = new InternetAddress(props.getProperty("mail.user"));
            message.setFrom(form);

            // 设置收件人
            InternetAddress to = new InternetAddress("594113869@qq.com");
            message.setRecipient(RecipientType.TO, to);
            // 设置抄送
            //InternetAddress cc = new InternetAddress("");
            //message.setRecipient(RecipientType.CC, cc);

            // 设置密送，其他的收件人不能看到密送的邮件地址
            //InternetAddress bcc = new InternetAddress("");
            //message.setRecipient(RecipientType.CC, bcc);
            // 设置邮件标题
            message.setSubject("noReply");

            // 设置邮件的内容体
            message.setContent("<a href='http://www.baidu.com'>国庆节快乐</a>", "text/html;charset=UTF-8");

            // 发送邮件
            Transport.send(message);
            log.info("邮件发送成功!");
		} catch (AddressException e) {
			log.error("地址错误");
			e.printStackTrace();
		} catch (MessagingException e) {
			log.equals("邮件内容错误");
			e.printStackTrace();
		}
        
	}
	
	
	public static void main(String[] args) {
		sendMailTest();
	}
}
