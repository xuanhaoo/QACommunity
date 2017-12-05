package com.qa.entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.sql.Date;

/**
 * Create by xuanhao on 2017/12/5
 */
@Entity
@Table(name = "qa_likes", schema = "qacommunity", catalog = "")
public class QaLikes {
    private int cId;
    private int fuId;
    private Date createDate;

    @Basic
    @Column(name = "c_id", nullable = false)
    public int getcId() {
        return cId;
    }

    public void setcId(int cId) {
        this.cId = cId;
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

        QaLikes qaLikes = (QaLikes) o;

        if (cId != qaLikes.cId) return false;
        if (fuId != qaLikes.fuId) return false;
        if (createDate != null ? !createDate.equals(qaLikes.createDate) : qaLikes.createDate != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = cId;
        result = 31 * result + fuId;
        result = 31 * result + (createDate != null ? createDate.hashCode() : 0);
        return result;
    }
}
