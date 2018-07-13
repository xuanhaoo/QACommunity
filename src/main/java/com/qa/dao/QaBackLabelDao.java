package com.qa.dao;

import com.qa.entity.QaLabel;
import com.qa.entity.QaTopic;

import java.util.List;
import java.util.Map;

/**
 *
 * 标签dao
 */
public interface QaBackLabelDao {

    /**
     * 添加标签
     * @param qaLabel
     */
    public boolean addLabel(QaLabel qaLabel);

    /**
     * 更新标签
     * @param qaLabel
     */
    public boolean updateLabel(QaLabel qaLabel);

    /**
     * 删除标签
     * @param l_id
     */
    public boolean deleteLabel(int l_id);

    /**
     * 获取单个标签信息根据l_id
     * @param l_id
     * @return
     */
    public QaLabel getQaLabel(int l_id);

    /**
     * 获取标签列表
     * @return
     */
    public List getQaLabelList();

    /**
     * 获取标签对应话题
     * @param to_id
     * @return
     */
    public QaTopic getLabelForTopic(int to_id);

    /**
     * 获取话题列表
     * @return
     */
    public List getTopicList();

    public Map getLabelToTopic(int topicId);

}
