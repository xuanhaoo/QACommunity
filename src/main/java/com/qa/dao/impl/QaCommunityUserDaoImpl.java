package com.qa.dao.impl;

import com.qa.dao.QaCommunityUserDao;
import com.qa.entity.QaFrontUser;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 *
 */

@Repository("QaCommunityUserDao")
public class QaCommunityUserDaoImpl implements QaCommunityUserDao {

    @Resource(name = "sessionFactory")
    private SessionFactory sessionFactory;

    /**
     * 描述： 获得前台用户列表
    */
    @Override
    public Map getCommunityUserList(String pages, String limit, String name, String[] rangeDate) {

        int firstRe = 0;            // 查询的第一个结果
        int lastRe = 0;             // 查询的最后一个结果
        int count = 0;              // 查询到总数
        int page = 0;
        int lim = 0;
        String sql;                 // 查询语句
        Timestamp times[] = new Timestamp[2];   // 查询时间
        Query query = null;
        List comlist=null;
        Map userList = new HashMap();       // 结果集合


        // 将字符串转换为int
        page = Integer.parseInt(pages) - 1;
        lim = Integer.parseInt(limit);

        firstRe = page * lim;
        lastRe = page * lim + lim;


        if(rangeDate[0] == null){
            times[0] = Timestamp.valueOf("1999-01-01 00:00:00");
            times[1] = new Timestamp(new Date().getTime());
        }else{
            times[0] = Timestamp.valueOf(rangeDate[0]);
            times[1] = Timestamp.valueOf(rangeDate[1]);
        }


        sql = "From QaFrontUser as qf ";

        System.out.println(name);

        if(!name.equals("")){
            sql += "where qf.name like ?";
            query = sessionFactory.getCurrentSession().createQuery(sql);
            query.setString(0,"%"+name+"%");
        }

        else if(rangeDate[0] != null){
            sql += "where create_date BETWEEN ? AND ?";
            query = sessionFactory.getCurrentSession().createQuery(sql);
            query.setTimestamp(0,times[0]);
            query.setTimestamp(1,times[1]);
        }else{
            query = sessionFactory.getCurrentSession().createQuery(sql);
        }



        // 得到数据长度
        count = query.list().size();
        // 设置查询第一个数据以及查询null的数量
        query.setFirstResult(firstRe);
        query.setMaxResults(lastRe);
        comlist = query.list();


        userList.put("count",count);
        userList.put("list",comlist);

        return userList;
    }


    /**
     *
     * 描述： 删除用户集合
    */
    @Override
    public boolean deleteComUser(List<Integer> ids) {
        boolean b = false;
        String hql = "Delete from QaFrontUser where id in (:ids)";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);

        int result = query.setParameterList("ids", ids).executeUpdate();
        if(result != 0){
            b = true;
        }
        return b;
    }


    /**
     *
     * 描述： 更新用户信息
    */
    @Override
    public boolean updateUser(QaFrontUser user) {
        String hql = "update QaFrontUser qf set qf.name=?, qf.sex=?, qf.phone=?, qf.email=? where qf.id=?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setString(0,user.getName());
        query.setInteger(1,user.getSex());
        query.setString(2,user.getPhone());
        query.setString(3,user.getEmail());
        query.setInteger(4,user.getId());
        int result = query.executeUpdate();
        if(result != 0) {
            return true;
        }else{
            return false;
        }
    }

    @Override
    public QaFrontUser findById(int id) {
        String hql = "From QaFrontUser where id = ?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        query.setInteger(0,id);
        QaFrontUser user = (QaFrontUser) query.list().get(0);
        return user;
    }


}
