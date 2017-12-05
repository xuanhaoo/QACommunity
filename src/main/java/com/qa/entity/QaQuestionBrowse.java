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
@Table(name = "qa_question_browse", schema = "qacommunity", catalog = "")
public class QaQuestionBrowse {
    private int qId;
    private int fuId;
    private Date browseDate;

    @Basic
    @Column(name = "q_id", nullable = false)
    public int getqId() {
        return qId;
    }

    public void setqId(int qId) {
        this.qId = qId;
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
    @Column(name = "browse_date", nullable = false)
    public Date getBrowseDate() {
        return browseDate;
    }

    public void setBrowseDate(Date browseDate) {
        this.browseDate = browseDate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        QaQuestionBrowse that = (QaQuestionBrowse) o;

        if (qId != that.qId) return false;
        if (fuId != that.fuId) return false;
        if (browseDate != null ? !browseDate.equals(that.browseDate) : that.browseDate != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = qId;
        result = 31 * result + fuId;
        result = 31 * result + (browseDate != null ? browseDate.hashCode() : 0);
        return result;
    }
}
