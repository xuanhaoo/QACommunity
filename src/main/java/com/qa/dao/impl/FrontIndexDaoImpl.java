package com.qa.dao.impl;

import com.qa.dao.FrontIndexDao;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Create by xuanhao on 2017/12/28
 */

/**
 * 前台数据库交互层
 */
@Transactional(rollbackFor = Exception.class)//出现Exception异常回滚
@Repository("FrontIndexDao") //注入
public class FrontIndexDaoImpl implements FrontIndexDao {
    @Resource(name = "sessionFactory")
    private SessionFactory sessionFactory;

    /**
     * 获取首页问题列表
     * @param page  页码
     * @param orderType 排序类型：1，最新（按时间） 2.最热（评论数最多）
     * @return
     */
    @Override
    public Map getQuesIndex(int page, int orderType) {
        int firstRe = 0;            // 查询的第一个结果
        int lastRe = 0;             // 查询的最后一个结果
        int count = 0;              // 查询到总数
        int pages;           //页码,int型变量，默认为空
        int limit = 15;         //每页的显示数
        if(page == 0) {
            pages = 0;
        }else {
            pages = page - 1;
        }
        Map map = new HashMap();
//        select t1.q_id as qId,t1.title as qTitle,t1.detail as qDetail,t1.create_date as createDate,t2.to_id as toId,t2.topic_name as topicName,
//        t3.name as accountName,count(DISTINCT t4.c_id) commNum, COUNT(DISTINCT t6.id)browNum from qa_question as t1
//        left join qa_topic t2 on t1.topic_id=t2.to_id
//        left join qa_front_user t3 on t1.create_user=t3.id
//        left join qa_comment t4 on t1.q_id=t4.question_id
//        left join qa_question_browse t6 on t1.q_id=t6.q_id
//        group by t1.q_id;
        String sql = "";

        Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
        List list = query.list();
        firstRe = pages * limit;   //当前该显示的记录开始点
        lastRe = page * limit + limit;      //结束的点

        return null;
    }

    @Override
    public Map getTopicIndex() {
        return null;
    }
}
