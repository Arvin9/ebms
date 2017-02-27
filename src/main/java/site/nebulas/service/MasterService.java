package site.nebulas.service;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import site.nebulas.beans.Master;
import site.nebulas.dao.MasterDao;


@Service
public class MasterService {
	@Resource
	private MasterDao userDao;

    public void setUserDao(MasterDao userDao) {
        this.userDao = userDao;
    }
    @Resource
    private PasswordHelper passwordHelper;

    public void setPasswordHelper(PasswordHelper passwordHelper) {
        this.passwordHelper = passwordHelper;
    }

    /**
     * @author Honghui
     * @param username
     * @return
     * 根据用户名查找用户
     */
    public Master findByUserAccount(String userAccount) {
        return userDao.findByUserAccount(userAccount);
    }
    
    /**
     * @author Honghui
     * 创建用户
     * @param master
     */
    public void createUser(Master master) {
        //加密密码
        passwordHelper.encryptPassword(master);
        userDao.createUser(master);
    }
    

    /**
     * 修改密码
     * @param userAccount
     * @param newPassword
     */
    public void changePassword(String userAccount, String newPassword) {
        Master master =userDao.findByUserAccount(userAccount);
        master.setPassword(newPassword);
        passwordHelper.encryptPassword(master);
        userDao.updateUser(master);
    }

    
    
    /**
     * 添加用户-角色关系
     * @param userId
     * @param roleIds
     
    public void correlationRoles(Long userId, Long... roleIds) {
        userDao.correlationRoles(userId, roleIds);
    }
     */
    
    /**
     * 移除用户-角色关系
     * @param userId
     * @param roleIds
     
    public void uncorrelationRoles(Long userId, Long... roleIds) {
        userDao.uncorrelationRoles(userId, roleIds);
    }
     */
    

    /**
     * 根据用户名查找其角色
     * @param username
     * @return
     
    public Set<String> findRoles(String username) {
        return userDao.findRoles(username);
    }
     */
    
    /**
     * 根据用户名查找其权限
     * @param username
     * @return
     
    public Set<String> findPermissions(String username) {
        return userDao.findPermissions(username);
    }
	*/
}


