package com.qa.dao;

import com.qa.entity.QaQuestion;

import java.util.List;
import java.util.Map;

/**
 * Create by xuanhao on 2017/12/13
 */
public interface QaBackQuesDao {

    /**
     * 添加问题
     * @param qaQuestion
     * @return
     */
    public boolean addQues(QaQuestion qaQuestion);

    public boolean update(QaQuestion qaQuestion);

    public boolean delete(int q_id);

    public QaQuestion getQaQuestion(int l_id);

    /**
     * 获取问题列表接口
     * @param page 当前页
     * @param limits 每页限制数
     * @return
     */
    public Map getQuestionList(int page, int limits);

    /**
     * 通过问题表中ids来获取该问题包含哪些标签
     * @param labelStr
     * @return
     */
    public String[] LabelList(String labelStr);

    /**
     * 通过问题的l_id来获取该问题的详细信息
     * @param l_id
     * @return
     */
    public Map getTheQuestion(int l_id);

    /**
     * 根据时间获取浏览量
     * @param time
     * @return
     */
    public Map getBrowsDate(int l_id, String[] time);

    /**
     * 获取该问题下的一级评论
     * @param q_id
     * @return
     */
    public Map getTheComment(int q_id);

    /**
     * 获取评论下的评论，即为二级评论
     * PS:暂时写到二级评论，暂不考虑无限级评论
     * @param pq_id  父级评论ID
     * @return
     */
    public Map getTheComment_two(int pq_id);
}
