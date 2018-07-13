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
        String orderString;     //排序
        if(page == 0) {
            pages = 0;
        }else {
            pages = page - 1;
        }
        if(orderType == 1) {
            orderString = "createDate";
        }else{
            orderString = "commNum";
        }
        Map map = new HashMap();
        String sql = "select t1.q_id as qId,t1.title as qTitle,t1.create_date as createDate,t2.to_id as toId,t2.topic_name as topicName," +
                " t3.name as accountName,t3.photo as userPhoto,count(DISTINCT t4.c_id) commNum, count(DISTINCT t6.id)browNum from qa_question as t1" +
                " left join qa_topic t2 on t1.topic_id=t2.to_id" +
                " left join qa_front_user t3 on t1.create_user=t3.id" +
                " left join qa_comment t4 on t1.q_id=t4.question_id" +
                " left join qa_question_browse t6 on t1.q_id=t6.q_id" +
                " group by t1.q_id order by "+orderString+" desc";

        Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
        List list = query.list();
        count = list.size();
        firstRe = pages * limit;   //当前该显示的记录开始点
        lastRe = pages  * limit + limit;      //结束的点
        query.setFirstResult(firstRe);
        query.setMaxResults(lastRe);
        map.put("count", count);
        map.put("page",page);
        map.put("orderType", orderType);
        map.put("list", list);
        return map;
    }

    /**
     * 获取话题列表
     * @return
     */
    @Override
    public Map getTopicIndex() {

        Map map = new HashMap();
        List list = sessionFactory.getCurrentSession().createQuery("from QaTopic order by sorted asc").list();
        map.put("topicLists", list);
        return map;
    }


    /**
     * 获取问题详情
     * @return
     */
    public Map getTheQuesInfo(int quesId) {
        Map map = new HashMap();
        String sql = "select t1.q_id as qId,t1.title as qTitle,t1.detail as quesDetail,t1.label_ids as labels,t1.create_date as createDate,t2.to_id as toId,t2.topic_name as topicName," +
                " t3.name as accountName,t3.photo as userPhoto,count(DISTINCT t4.c_id) commNum, count(DISTINCT t6.id)browNum from qa_question as t1" +
                " left join qa_topic t2 on t1.topic_id=t2.to_id" +
                " left join qa_front_user t3 on t1.create_user=t3.id" +
                " left join qa_comment t4 on t1.q_id=t4.question_id" +
                " left join qa_question_browse t6 on t1.q_id=t6.q_id" +
                " WHERE t1.q_id = "+quesId+" group by t1.q_id";
        Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
        List list = query.list();
        map.put("list",list);
        return map;
    }

    /**
     * 查询问题时返回的标签字符集
     * 获取当前问题包含的标签
     * @param labelStr
     * @return
     */
    public String[] LabelList(String labelStr) {
        String sql = "select label_name from qa_label where l_id in ("+labelStr+")";
        List list = sessionFactory.getCurrentSession().createSQLQuery(sql).list();
        //存放入数组
        String[] labelNames  = (String[]) list.toArray(new String[list.size()]);
        return labelNames;
    }

    /**
     * 获取所有的话题列表
     * @return
     */
    public Map getTopicList() {

        return null;
    }
}
