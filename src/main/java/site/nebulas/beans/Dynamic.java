package site.nebulas.beans;

/**
 * @author Honghui
 * @version 0.2 20170227
 *
 * 用户动态
 */
public class Dynamic {
    private Integer id;
    private String userAccount; // 用户名
    private String actionDescription; // 动态描述
    private String createTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }


    public String getUserAccount() {
        return userAccount;
    }

    public void setUserAccount(String userAccount) {
        this.userAccount = userAccount;
    }

    public String getActionDescription() {
        return actionDescription;
    }

    public void setActionDescription(String actionDescription) {
        this.actionDescription = actionDescription;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }
}
