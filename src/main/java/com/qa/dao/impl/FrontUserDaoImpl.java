package com.qa.dao.impl;

import com.qa.dao.FrontUserDao;
import com.qa.entity.QaFrontUser;
import com.qa.entity.QaQuestion;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.io.Serializable;
import java.util.*;

/**
 *
 */
@Repository("FrontUserDao")
public class FrontUserDaoImpl implements FrontUserDao {

    @Resource(name = "sessionFactory")
    private SessionFactory sessionFactory;

    /**
     *
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
     *
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

    /**
     *
     * 描述： 检查用户登录
    */
    @Override
    public QaFrontUser checkLogin(String account, String password) {
        List it;
        String hql = "FROM QaFrontUser bu where bu.account=? and bu.password=?";

        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0,account);
        query.setString(1,password);

        it = query.list();
        System.out.println(it.size());
        if (it.size()!=0) {
            return (QaFrontUser) it.get(0);
        }

            return null;

    }

    /**
     *
     * 描述： 根据用户id获得相关的问题
    */
    @Override
    public Map getQuestionByUser(int id, int page) {

        int limit = 10;     // 每页显示10个
        int firstRe = 0;    // 第一个数据
        int lastRe = 0;     // 最后一个数据
        int count = 0;      // 总的问题个数

        Map map = new HashMap();

        String hql = "FROM QaQuestion qq where create_user = ? order by create_date desc";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setInteger(0,id);

        firstRe = (page - 1) * limit;
        lastRe = firstRe + limit;

        // 总的个数
        count = query.list().size();

        // 分页
        query.setFirstResult(firstRe);
        query.setMaxResults(lastRe);

        // 问题集合
        ArrayList l = (ArrayList) query.list();
        map.put("list",l);
        map.put("count",count);
        return map;
    }


    /**
     *
     * 描述： 更新用户基本信息
    */
    @Override
    public boolean updateBaseInfo(int id, String name, String email, String phone, int sex) {
        String hql = "update QaFrontUser qf set qf.name=?, qf.sex=?, qf.phone=?, qf.email=? where qf.id=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0,name);
        query.setInteger(1,sex);
        query.setString(2,phone);
        query.setString(3,email);
        query.setInteger(4,id);

        int b =query.executeUpdate();

        if(b != 0){
            return true;
        }else {
            return false;
        }
    }

    /**
     *
     * 描述： 检查用户原密码是否正确
    */
    @Override
    public boolean checkUserPass(int id, String password) {
        String hql = "FROM QaFrontUser qf where id = ? AND password = ?";

        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setInteger(0,id);
        query.setString(1,password);
        if(query.list().size()!=0){
            return true;
        }else{
            return false;
        }
    }


    /**
     *
     * 描述： 更新用户密码
    */
    @Override
    public boolean updateUserPass(int id, String password) {
        String hql = "update QaFrontUser qf set qf.password=? where qf.id=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0,password);
        query.setInteger(1,id);
        int result = query.executeUpdate();
        if(result != 0){
            return true;
        }else{
            return false;
        }
    }


    /**
     *
     * 描述： 更新用户头像
    */
    @Override
    public boolean saveUserPhoto(int id, String realPath) {
        String hql = "update QaFrontUser set photo=? where id=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0,realPath);
        query.setInteger(1,id);

        int result = query.executeUpdate();
        if(result != 0){
            return true;
        }

        return false;
    }



    /**
     *
     * 描述： 根据用户id获取最新评论信息
    */
    @Override
    public ArrayList getCommentByUser(int id) {
        String hql = "select t1.content as reply, t1.create_date as create_date, " +
                "t2.q_id as question_id, t2.title as title " +
                "from qa_comment as t1,qa_question as t2 " +
                "where t1.create_user = ? order by t1.create_date desc";
        Query query = sessionFactory.getCurrentSession().createSQLQuery(hql);
        query.setInteger(0,id);
        query.setMaxResults(5);     // 最多查询5个
        return (ArrayList)query.list();
    }
}
