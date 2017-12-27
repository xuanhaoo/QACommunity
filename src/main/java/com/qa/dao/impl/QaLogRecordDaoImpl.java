package com.qa.dao.impl;

import com.qa.dao.QaLogRecordDao;
import com.qa.entity.QaLogRecord;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.classic.Session;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by InterlliJ IDEA.
 * User:3to
 * Date:17-12-11
 * Time:上午10:53
 */
// 进行注入
@Repository("QaLogRecordDao")
public class QaLogRecordDaoImpl implements QaLogRecordDao {

    // 注入sessionFactory
    @Resource(name = "sessionFactory")
    private SessionFactory sessionFactory;


    /**
     * 创建时间：17-12-11 上午10:59
     * 作者：3to
     * 描述：根据传递过来的logRecord实体,将其添加到数据库中
    */
    @Override
    public void addLog(QaLogRecord logRecord) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.save(logRecord);
        transaction.commit();
        session.close();
    }

    /**
     * 创建时间：17-12-11 下午4:46
     * 作者：3to
     * 描述：根据id集合,删除日志信息
    */
    @Override
    public Boolean deleteLog(List<Integer> logRecords) {
        boolean b = false;
        String hql = "Delete from QaLogRecord where id in (:ids)";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);

        int result = query.setParameterList("ids", logRecords).executeUpdate();
        if(result != 0){
            b = true;
        }
        return b;
    }

    /**
     * 创建时间：17-12-11 下午4:53
     * 作者：3to
     * 描述：根据传入的条件集合,进行日志查找
    */
    @Override
    public Map queryLog(String pages, String limit, String[] time) {

        int firstRe = 0;            // 查询的第一个结果
        int lastRe = 0;             // 查询的最后一个结果
        int count = 0;              // 查询到总数
        int page = 0;
        int lim = 0;

        Timestamp times[] = new Timestamp[2];
        List<QaLogRecord> arrayList = null;     // 返回的数据数组
        Map map = new HashMap();

        // 如果时间为空,则给予默认值
        if(time[0].equals("")){
            times[0] = Timestamp.valueOf("1999-01-01 00:00:00");
            times[1] = new Timestamp(new Date().getTime());
        }else{
            times[0] = Timestamp.valueOf(time[0]);
            times[1] = Timestamp.valueOf(time[1]);
        }

        // 将字符串转换为int
        page = Integer.parseInt(pages) - 1;
        lim = Integer.parseInt(limit);

        firstRe = page * lim;
        lastRe = page * lim + lim;

//        System.out.println("page:"+pages);
//        System.out.println("lim:"+lim);
//        System.out.println("time:"+time);
//        System.out.println("time1:"+times[0]+"times2:"+times[1]);

        String hql = "FROM QaLogRecord log WHERE create_date BETWEEN ? AND ?";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);  // 用于数据截取
        query.setTimestamp(0,times[0]);
        query.setTimestamp(1,times[1]);
        // 得到数据长度
        count = query.list().size();
        // 设置查询第一个数据以及查询的数量
        query.setFirstResult(firstRe);
        query.setMaxResults(lastRe);

        arrayList = query.list();

        map.put("list",arrayList);
        map.put("count",count);
        return map;
    }
}
