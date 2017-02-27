package site.nebulas.beans;

/**
 * @author Honghui
 * @version 0.2 20170227
 *
 * 类别
 */
public class Category {
    private Integer id;
    private String name;
    private String createTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }
}
