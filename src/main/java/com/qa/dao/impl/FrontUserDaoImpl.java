package com.qa.dao.impl;

import com.qa.dao.FrontUserDao;
import com.qa.entity.QaFrontUser;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.io.Serializable;

/**
 * Created by InterlliJ IDEA.
 * User:3to
 * Date:17-12-31
 * Time:下午9:48
 */
@Repository("FrontUserDao")
public class FrontUserDaoImpl implements FrontUserDao {

    @Resource(name = "sessionFactory")
    private SessionFactory sessionFactory;

    /**
     * 创建时间：17-12-31 下午9:50
     * 作者：3to
     * 描述： 检查账户是否已经存在
    */
    @Override
    public boolean checkAccount(String name) {
        String hql = "FROM QaFrontUser fu where account = ?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0,name);
        // 如果存在则返回true
        if(query.list().size() != 0){
            return true;
        }else{
            return false;
        }
    }


    /**
     * 创建时间：17-12-31 下午3:09
     * 作者：3to
     * 描述： 注册新用户
    */
    @Override
    public boolean addUser(QaFrontUser user) {
        Serializable ser = sessionFactory.getCurrentSession().save(user);
        if(ser !=null){
            return true;
        }else{
            return false;
        }
    }

    @Override
    public QaFrontUser checkLogin(String account, String password) {
        String hql = "FROM QaFrontUser fu where account = ? AND password = ?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0,account);
        query.setString(1,password);
        QaFrontUser user = (QaFrontUser) query.iterate().next();
        return user;
    }
}
