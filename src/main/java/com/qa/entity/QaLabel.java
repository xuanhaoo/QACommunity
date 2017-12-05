package com.qa.entity;

import javax.persistence.*;
import java.sql.Date;

/**
 * Create by xuanhao on 2017/12/5
 */
@Entity
@Table(name = "qa_label", schema = "qacommunity", catalog = "")
public class QaLabel {
    private int lId;
    private String labelName;
    private String remarks;
    private Date createDate;
    private int topicId;
    private int sorted;

    @Id
    @Column(name = "l_id", nullable = false)
    public int getlId() {
        return lId;
    }

    public void setlId(int lId) {
        this.lId = lId;
    }

    @Basic
    @Column(name = "label_name", nullable = false, length = 128)
    public String getLabelName() {
        return labelName;
    }

    public void setLabelName(String labelName) {
        this.labelName = labelName;
    }

    @Basic
    @Column(name = "remarks", nullable = true, length = 255)
    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    @Basic
    @Column(name = "create_date", nullable = false)
    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    @Basic
    @Column(name = "topic_id", nullable = false)
    public int getTopicId() {
        return topicId;
    }

    public void setTopicId(int topicId) {
        this.topicId = topicId;
    }

    @Basic
    @Column(name = "sorted", nullable = false)
    public int getSorted() {
        return sorted;
    }

    public void setSorted(int sorted) {
        this.sorted = sorted;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        QaLabel qaLabel = (QaLabel) o;

        if (lId != qaLabel.lId) return false;
        if (topicId != qaLabel.topicId) return false;
        if (sorted != qaLabel.sorted) return false;
        if (labelName != null ? !labelName.equals(qaLabel.labelName) : qaLabel.labelName != null) return false;
        if (remarks != null ? !remarks.equals(qaLabel.remarks) : qaLabel.remarks != null) return false;
        if (createDate != null ? !createDate.equals(qaLabel.createDate) : qaLabel.createDate != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = lId;
        result = 31 * result + (labelName != null ? labelName.hashCode() : 0);
        result = 31 * result + (remarks != null ? remarks.hashCode() : 0);
        result = 31 * result + (createDate != null ? createDate.hashCode() : 0);
        result = 31 * result + topicId;
        result = 31 * result + sorted;
        return result;
    }
}
