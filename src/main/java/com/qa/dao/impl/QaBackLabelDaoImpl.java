package com.qa.dao.impl;

import com.qa.dao.QaBackLabelDao;
import com.qa.entity.QaLabel;
import com.qa.entity.QaTopic;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.qa.entity.BaTopicToLabel;

/**
 *
 */
@Transactional(rollbackFor = Exception.class)//出现Exception异常回滚
@Repository("QaBackLabelDao") //注入
public class QaBackLabelDaoImpl implements QaBackLabelDao{

    @Resource(name = "sessionFactory")
    private SessionFactory sessionFactory;

    /**
     *
     * 添加标签信息
     * @param qaLabel
     * @return boolean
     */
    @Override
    public boolean addLabel(QaLabel qaLabel) {
        //接受返回值
        Serializable result = sessionFactory.getCurrentSession().save(qaLabel);
        int integer = (Integer)result;      //添加时，成功返回主键值，否则错误
        if(integer != 0) {
            return true;
        }else {
            return false;
        }

    }

    /**
     *
     * 更新标签
     * @param qaLabel
     * @return
     */
    @Override
    public boolean updateLabel(QaLabel qaLabel) {
        try{
            sessionFactory.getCurrentSession().update(qaLabel);
            return true;
        }catch(Exception e) {
            e.printStackTrace();
            return false;
        }

    }

    /**
     *
     * 删除标签
     * @param l_id  标签id
     * @return
     */
    @Override
    public boolean deleteLabel(int l_id) {
        try{
            //先获取在删除
            QaLabel ql = (QaLabel) sessionFactory.getCurrentSession().get(QaLabel.class, l_id);
            sessionFactory.getCurrentSession().delete(ql);
            return true;
        }catch(Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     *获取该标签的信息
     * @param l_id
     * @return
     */
    @Override
    public QaLabel getQaLabel(int l_id) {
        return (QaLabel) sessionFactory.getCurrentSession().get(QaLabel.class, l_id);
    }

    /**
     * 获取标签列表集合
     * @return
     */
    @Override
    public List getQaLabelList() {
        //hql获取标签列表并按sorted字段排序
        return sessionFactory.getCurrentSession().createQuery("FROM QaLabel order by sorted asc").list();
    }

    /**
     * 查找隶属的话题信息  ，即该标签的所属话题
     * @param to_id
     * @return
     * PS：最开始写的，暂时先这样  :) :)
     */
    public QaTopic getLabelForTopic(int to_id) {
        QaTopic qt = (QaTopic) sessionFactory.getCurrentSession().get(QaTopic.class, to_id);
        return qt;
    }

    /**
     * 返回所有的话题列表
     * 主要针对添加或更新话题是使用
     * @return
     */
    public List getTopicList() {
        return sessionFactory.getCurrentSession().createQuery("FROM QaTopic order by sorted asc").list();
    }

    public Map getLabelToTopic(int topicId) {
        Map map = new HashMap();
        String hql = "FROM QaLabel where topicId = ?";
        Query query =   sessionFactory.getCurrentSession().createQuery(hql);
        query.setInteger(0,topicId);
        List list = query.list();
        map.put("labelList", list);
        return map;

    }
}
