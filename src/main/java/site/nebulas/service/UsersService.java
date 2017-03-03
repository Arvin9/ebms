package site.nebulas.service;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import site.nebulas.beans.Users;
import site.nebulas.dao.UsersDao;
import site.nebulas.util.DateUtil;
import site.nebulas.util.MD5Util;
import site.nebulas.util.UUIDUtil;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UsersService {
    Logger logger = LoggerFactory.getLogger(getClass());
	@Resource
	private UsersDao usersDao;
    @Resource
    SysParamService sysParamService;

    public List<Users> queryByParam(Users users){
    	return usersDao.queryByParam(users);
    }
	
    public void inster(Users users){
        usersDao.inster(users);
    }
    
    public void update(Users users){
        usersDao.update(users);
    }
    /**
     * 管理员添加用户
     * */
    public void registerUser(Users users){
        String salt = MD5Util.encode(UUIDUtil.getRandomUUID());
        users.setSalt(salt);

        // 将用户输入的密码+用户名+salt并进行MD5操作
        //String password = "f379eaf3c831b04de153469d1bec345e"; // 666666 的md5值
        String password = MD5Util.encode(sysParamService.queryByName("defaultPassword").getValue());
        String md5_password = MD5Util.encode(password + users.getAccount() + salt);
        users.setPassword(md5_password);

        // 获得当前用户名
        Subject subject = SecurityUtils.getSubject();
        String master = (String)subject.getPrincipal();
        users.setAddMan(master);

        users.setAddTime(DateUtil.getTime());

        this.inster(users);
    }

    /**
     * 管理员重置用户密码
     * */
    public void resetPassword(Users users){
        String salt = MD5Util.encode(UUIDUtil.getRandomUUID());
        users.setSalt(salt);
        // 将用户输入的密码+用户名+salt并进行MD5操作
        //String password = "f379eaf3c831b04de153469d1bec345e"; // 666666 的md5值
        String password = MD5Util.encode(sysParamService.queryByName("resetPassword").getValue());
        String md5_password = MD5Util.encode(password + users.getAccount() + salt);
        users.setPassword(md5_password);

        this.update(users);
    }
}


