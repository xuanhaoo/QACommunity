package com.qa.service;

import java.util.Map;

/**
 * Create by xuanhao on 2017/12/28
 */
public interface FrontIndexService {

    public Map getQuesIndex(String page, String orderType);

    public Map getTopicIndex();

    public Map getTheQuesInfo(int quesId);

    public Map getTheOneComm(int q_id);

    public Map getTheTwoComm(int pq_id);

}
