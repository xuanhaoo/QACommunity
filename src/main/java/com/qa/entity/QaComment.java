package com.qa.entity;

import javax.persistence.*;
import java.util.Date;

/**
 * Create by xuanhao on 2018/1/4
 */
@Entity
@Table(name = "qa_comment", schema = "qacommunity", catalog = "")
public class QaComment {
    private int cId;
    private String content;
    private int questionId;
    private Integer cPid;
    private Date createDate;
    private int createUser;

    @Id
    @Column(name = "c_id", nullable = false)
    public int getcId() {
        return cId;
    }

    public void setcId(int cId) {
        this.cId = cId;
    }

    @Basic
    @Column(name = "content", nullable = false, length = -1)
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Basic
    @Column(name = "question_id", nullable = false)
    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }

    @Basic
    @Column(name = "c_pid", nullable = true)
    public Integer getCPid() {
        return cPid;
    }

    public void setCPid(Integer cPid) {
        this.cPid = cPid;
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
    @Column(name = "create_user", nullable = false)
    public int getCreateUser() {
        return createUser;
    }

    public void setCreateUser(int createUser) {
        this.createUser = createUser;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        QaComment qaComment = (QaComment) o;

        if (cId != qaComment.cId) return false;
        if (questionId != qaComment.questionId) return false;
        if (createUser != qaComment.createUser) return false;
        if (content != null ? !content.equals(qaComment.content) : qaComment.content != null) return false;
        if (cPid != null ? !cPid.equals(qaComment.cPid) : qaComment.cPid != null) return false;
        if (createDate != null ? !createDate.equals(qaComment.createDate) : qaComment.createDate != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = cId;
        result = 31 * result + (content != null ? content.hashCode() : 0);
        result = 31 * result + questionId;
        result = 31 * result + (cPid != null ? cPid.hashCode() : 0);
        result = 31 * result + (createDate != null ? createDate.hashCode() : 0);
        result = 31 * result + createUser;
        return result;
    }
}
