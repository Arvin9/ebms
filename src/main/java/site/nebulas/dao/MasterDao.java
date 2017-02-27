package site.nebulas.dao;

import site.nebulas.beans.Master;

/**
 * @author CaiHonghui
 * @date 20160818
 */
public interface MasterDao {

    public void createUser(Master master);
    
    public void updateUser(Master master);

    Master findByUserAccount(String userAccount);
}

