package com.qa.service;

import com.qa.entity.QaQuestion;

import java.util.List;
import java.util.Map;

/**
 * Create by xuanhao on 2017/12/13
 */
public interface QaBackQuesService {
    public boolean addQues(QaQuestion qaQuestion);

    public boolean update(QaQuestion qaQuestion);

    public boolean deleteQues(List<Integer> c_ids);

    public QaQuestion getQaQuestion(int l_id);

    public Map getQuestionList(String pages, String limit);

    public Map getTheQuestion(int l_id);

    public Map getBrowseForDate(int qId, String[] time);

    public Map getTheComment(int q_id);


    public Map getTheComment_two(int pq_id);

    public boolean deleteComm(int c_id);
}
