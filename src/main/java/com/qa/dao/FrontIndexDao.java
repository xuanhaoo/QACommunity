package com.qa.dao;

/**
 * Create by xuanhao on 2017/12/28
 */

import java.util.Map;

/**
 * 前台Dao，未登录时
 */
public interface FrontIndexDao {

    /**
     * 登录首页，获取问题列表
     * @return
     */
    public Map getQuesIndex(int page, int orderType);

    /**
     * 获取话题列表
     * @return
     */
    public Map getTopicIndex();

    /**
     * 获取该问题的详情
     * @return
     */
    public Map getTheQuesInfo(int quesId);

    public String[] LabelList(String labelStr);


    public Map getTopicList();
}
