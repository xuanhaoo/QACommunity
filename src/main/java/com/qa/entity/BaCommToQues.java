package com.qa.entity;

import java.math.BigInteger;
import java.util.Date;

/**
 * Create by xuanhao on 2017/12/19
 */
public class BaCommToQues {

    int commId;
    String content;
    Date createDate;
    String accountName;
    BigInteger likes;
    String headPhoto;


    public int getCommId() {
        return commId;
    }

    public void setCommId(int commId) {
        this.commId = commId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public BigInteger getLikes() {
        return likes;
    }

    public void setLikes(BigInteger likes) {
        this.likes = likes;
    }
    public String getHeadPhoto() {
        return headPhoto;
    }

    public void setHeadPhoto(String headPhoto) {
        this.headPhoto = headPhoto;
    }


}
