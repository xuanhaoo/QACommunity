package com.qa.entity;

import java.util.Date;

/**
 * Create by xuanhao on 2017/12/11
 */
public class BaTopicToLabel {



    private int lId;
    private String labelName;
    private String remarks;
    private Date createDate;
    private int topicId;

    public int getLId() {
        return lId;
    }

    public void setLId(int lId) {
        this.lId = lId;
    }

    public String getLabelName() {
        return labelName;
    }

    public void setLabelName(String labelName) {
        this.labelName = labelName;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public int getTopicId() {
        return topicId;
    }

    public void setTopicId(int topicId) {
        this.topicId = topicId;
    }

    public int getToId() {
        return toId;
    }

    public void setToId(int toId) {
        this.toId = toId;
    }

    public String getTopicName() {
        return topicName;
    }

    public void setTopicName(String topicName) {
        this.topicName = topicName;
    }

    private int toId;
    private String topicName;


}
