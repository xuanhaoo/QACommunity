package com.qa.entity;

import javax.persistence.*;
import java.sql.Date;

/**
 * Create by xuanhao on 2017/12/5
 */
@Entity
@Table(name = "qa_topic", schema = "qacommunity", catalog = "")
public class QaTopic {
    private int toId;
    private String topicName;
    private String remarks;
    private Date createDate;
    private int sorted;

    @Id
    @Column(name = "to_id", nullable = false)
    public int getToId() {
        return toId;
    }

    public void setToId(int toId) {
        this.toId = toId;
    }

    @Basic
    @Column(name = "topic_name", nullable = false, length = 128)
    public String getTopicName() {
        return topicName;
    }

    public void setTopicName(String topicName) {
        this.topicName = topicName;
    }

    @Basic
    @Column(name = "remarks", nullable = false, length = 255)
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

        QaTopic qaTopic = (QaTopic) o;

        if (toId != qaTopic.toId) return false;
        if (sorted != qaTopic.sorted) return false;
        if (topicName != null ? !topicName.equals(qaTopic.topicName) : qaTopic.topicName != null) return false;
        if (remarks != null ? !remarks.equals(qaTopic.remarks) : qaTopic.remarks != null) return false;
        if (createDate != null ? !createDate.equals(qaTopic.createDate) : qaTopic.createDate != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = toId;
        result = 31 * result + (topicName != null ? topicName.hashCode() : 0);
        result = 31 * result + (remarks != null ? remarks.hashCode() : 0);
        result = 31 * result + (createDate != null ? createDate.hashCode() : 0);
        result = 31 * result + sorted;
        return result;
    }
}
