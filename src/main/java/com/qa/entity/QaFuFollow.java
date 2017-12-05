package com.qa.entity;

import javax.persistence.*;
import java.sql.Date;

/**
 * Create by xuanhao on 2017/12/5
 */
@Entity
@Table(name = "qa_fu_follow", schema = "qacommunity", catalog = "")
public class QaFuFollow {
    private int id;
    private int toId;
    private int fuId;
    private Date createDate;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "to_id", nullable = false)
    public int getToId() {
        return toId;
    }

    public void setToId(int toId) {
        this.toId = toId;
    }

    @Basic
    @Column(name = "fu_id", nullable = false)
    public int getFuId() {
        return fuId;
    }

    public void setFuId(int fuId) {
        this.fuId = fuId;
    }

    @Basic
    @Column(name = "create_date", nullable = false)
    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        QaFuFollow that = (QaFuFollow) o;

        if (id != that.id) return false;
        if (toId != that.toId) return false;
        if (fuId != that.fuId) return false;
        if (createDate != null ? !createDate.equals(that.createDate) : that.createDate != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + toId;
        result = 31 * result + fuId;
        result = 31 * result + (createDate != null ? createDate.hashCode() : 0);
        return result;
    }
}
