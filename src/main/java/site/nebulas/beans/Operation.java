package site.nebulas.beans;

/**
 * @author Honghui
 * @version 0.2 20170227
 *
 * 管理员操作记录
 */
public class Operation {
    private Integer id;
    private String userAccount;
    private String content;
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
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public String getCreateTime() {
        return createTime;
    }
    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }
}
