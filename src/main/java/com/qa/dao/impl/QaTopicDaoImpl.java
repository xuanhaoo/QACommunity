package com.qa.dao.impl;

import com.qa.dao.QaTopicDao;
import com.qa.entity.QaBackUser;
import com.qa.entity.QaTopic;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
@Transactional(rollbackFor = Exception.class)//出现Exception异常回滚
@Repository("QaTopicDao")
public class QaTopicDaoImpl implements QaTopicDao {
    @Resource(name = "sessionFactory")
    private SessionFactory sessionFactory;
    Date date = new Date();
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    @Override
    public List<QaTopic> findAll() {
        String hql="From QaTopic";
        Query query =sessionFactory.getCurrentSession().createQuery(hql);
        List<QaTopic> list=query.list();
        if(list.size()>0||list!=null){
            System.out.println("寻找成功");
            return list;

        }
        return null;
    }
    public void DeleteTopic(int i){
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        String hql="delete from QaTopic qatopic where qatopic.toId="+i;
        Query query = session.createQuery(hql);
        query.executeUpdate();


    }
    public void UpdateTopic(QaTopic qaTopic){
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();

        String hql = ("update QaTopic u set u.topicName = ?,u.remarks = ?where u.toId=?");
        Query query = session.createQuery(hql);
        query.setParameter(0, qaTopic.getTopicName());
        query.setParameter(1, qaTopic.getRemarks());
        query.setParameter(2, qaTopic.getToId());
        query.executeUpdate();

    }
    public void AddTopic(QaTopic qaTopic){
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        String sql = "insert into qacommunity.qa_topic(topic_name,remarks,create_date,sorted) values(?,?,?,?)";
        Query query= session.createSQLQuery(sql);
        query.setString(0, qaTopic.getTopicName());
        query.setString(1, qaTopic.getRemarks());
        query.setTimestamp(2, date);
        query.setInteger(3,1);
        query.executeUpdate();
    }
}
