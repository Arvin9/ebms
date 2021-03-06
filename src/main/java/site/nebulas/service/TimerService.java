package site.nebulas.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

@Service 
public class TimerService {
	 private Logger log = LoggerFactory.getLogger(TimerService.class);
	 @Scheduled(cron="0 0/1 *  * * ? ")   //每5秒执行一次  
     public void myTest(){  
           log.info("进入测试"); 
     }  
}
