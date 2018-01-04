package com.qa.dao.impl;

import com.qa.dao.BackInfoDao;
import com.qa.entity.QaBackUser;
import com.qa.entity.QaTopic;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Transactional(rollbackFor = Exception.class)//出现Exception异常回滚
@Repository("BackInfoDao")
public class BackInfoDaoImpl implements BackInfoDao{

    @Resource(name = "sessionFactory")
    private SessionFactory sessionFactory;
    public List<QaBackUser> findAll(String username){
       String hql="From QaBackUser where account=?";



        Query query =sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0,username);
        List<QaBackUser> list=query.list();
       if(list.size()>0||list!=null){
           return list;
       }
       return null;


    }

    public void updateInfo(QaBackUser qaBackUser){
       Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();

        String hql = ("update QaBackUser u set u.name = ?,u.email = ?,u.sex=?,u.photo=?where u.account=?");
        Query query = session.createQuery(hql);
        query.setParameter(0, qaBackUser.getName());
        query.setParameter(1, qaBackUser.getEmail());
        query.setParameter(2, qaBackUser.getSex());
        query.setParameter(3, qaBackUser.getPhoto());
        query.setParameter(4, qaBackUser.getAccount());
        query.executeUpdate();
       // session.getTransaction().commit();
        //sessionFactory.getCurrentSession().update (qaBackUser);


    }
    public void updatePsInfo(QaBackUser qaBackUser){
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();

        String hql = ("update QaBackUser u set u.password = ? where u.account=?");
        Query query = session.createQuery(hql);
        query.setParameter(0, qaBackUser.getPassword());
        query.setParameter(1, qaBackUser.getAccount());
        query.executeUpdate();

    }


}
