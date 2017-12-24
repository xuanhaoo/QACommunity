package com.qa.dao.impl;

import com.qa.dao.QaBackQuesDao;
import com.qa.entity.QaQuestion;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Create by xuanhao on 2017/12/13
 */
@Transactional(rollbackFor = Exception.class)//出现Exception异常回滚
@Repository("QaBackQuesDao") //注入
public class QaBackQuesDaoImpl implements QaBackQuesDao{
    @Resource(name = "sessionFactory")
    private SessionFactory sessionFactory;

    /**
     * 作者：xuanhao
     * 后台某些功能如添加或编辑不需要，暂时不写
     * 添加问题功能在前台写
     * @param qaQuestion
     * @return
     */
    @Override
    public boolean addQues(QaQuestion qaQuestion) {
        return false;
    }

    @Override
    public boolean update(QaQuestion qaQuestion) {
        return false;
    }

    @Override
    public boolean delete(int q_id) {
        return false;
    }

    @Override
    public QaQuestion getQaQuestion(int l_id) {
        return null;
    }

    @Override
    /**
     *
     * 获取所有的问题信息列表：这里定义map集合来存放数据，因为map集合是key-value形式，
     * 结果可以清晰显示，个人见解
     *
     */
    public Map getQuestionList(int page, int limits) {
        int firstRe = 0;            // 查询的第一个结果
        int lastRe = 0;             // 查询的最后一个结果
        int count = 0;              // 查询到总数
        int pages = page - 1;           //页码
        int limit = limits;         //每页的显示数

        Map map = new HashMap();
        /*因为没有建立外键，所以不用hql实现；
         * 此处书写原生sql语句进行查询，注意sql语句的书写正确；
         * 左连接-连表查出问题列表并且查询各个问题的所属话题以及创建用户
         */
        String sql = "select t1.q_id as qId,t1.title as qTitle,t1.detail as qDetail,t1.label_ids as labelIds,t1.create_date as createDate,t2.to_id as toId,t2.topic_name as topicName," +
                "t3.account as account,t3.name as accountName from qa_question as t1 " +
                " left join qa_topic t2 on t1.topic_id=t2.to_id" +
                " left join qa_front_user t3 on t1.create_user=t3.id";
        //注意createSQLQuery
        Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
        List list = query.list();
        firstRe = pages * limit;   //当前该显示的记录开始点
        lastRe = page * limits + limits;
        //获取到记录长度（总的页数）
        count = list.size();
        query.setFirstResult(firstRe);
        query.setMaxResults(lastRe);
        map.put("count",count);     //总数
        map.put("list",list);       //数据
        return map;   //返回结果map
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
     * 通过问题的l_id来获取该问题的详细信息
     * @param l_id
     * @return
     */
    public Map getTheQuestion(int l_id) {
        Map map = new HashMap();  //实例化map集合

        //查询该问题的题目信息
        String sql = "select title from qa_question where q_id="+l_id+"";
        List list = sessionFactory.getCurrentSession().createSQLQuery(sql).list();
        String title_temp = list.toString();

        //截取标题字符串
        int beginIndex = title_temp.indexOf("[")+1;
        int endindex = title_temp.lastIndexOf("]");
        String title = title_temp.substring(beginIndex, endindex);
        //统计该问题的评论数
        String hql1 = "select count(*) from QaComment where questionId = "+l_id+"";
        Query query = sessionFactory.getCurrentSession().createQuery(hql1);
        int commentCount = ((Number) query.uniqueResult()).intValue();

        //统计该问题的浏览次数
        String hql2 = "select count(*) from QaQuestionBrowse where qId = "+l_id+"";
        Query query2 = sessionFactory.getCurrentSession().createQuery(hql2);
        int browseCount = ((Number) query2.uniqueResult()).intValue();
        //将各结果放入map中
        map.put("lId", l_id);
        map.put("title", title);
        map.put("comment", commentCount);
        map.put("browse", browseCount);
        return map;
    }

    /**
     * 根据时间段获取浏览量：开始时间-结束时间
     * @param time
     * @return
     */
    public Map getBrowsDate(int q_id, String[] time) {
        Map map = new HashMap();  //实例化map集合
        //对日期进行处理
        Timestamp times[] = new Timestamp[2];
        //时间格式
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd 00:00:00");
        //时间赋值，如果有时间传过来，则进行赋值，如果没有，则将时间段设置在当前日期与前10天之间
        //时间格式都是从0点开始
        if(time == null || (time != null && time.length == 0)) {
            times[0] = Timestamp.valueOf(format.format(new Timestamp(new Date().getTime() - (long) 10 * 24 * 60 * 60 * 1000)));
            times[1] = Timestamp.valueOf(format.format(new Timestamp(new Date().getTime())));
        }else {
            times[0] = Timestamp.valueOf(format.format(Timestamp.valueOf(time[0])));
            times[1] = Timestamp.valueOf(format.format(Timestamp.valueOf(time[1])));
        }

        //首先对时间范围和问题进行筛选，接着格式化时间分组计数
        String sql3 = "select date_format(browse_date,'%Y-%m-%d') btime, count(id) sums from (select * from qa_question_browse where q_id ="+ q_id +" and browse_date between '"+ times[0] +"' and '"+times[1]+"') as view1 GROUP BY btime";
        Query query3 = sessionFactory.getCurrentSession().createSQLQuery(sql3);
        List list = query3.list();
        map.put("list", list);

        return map;
    }

    /**
     * 获取该问题下的一级评论
     * @param q_id
     * @return
     */
    public Map getTheComment(int q_id) {
        Map map = new HashMap();
        //同样原生sql，需要左连接，因为当评论没有赞的时候一样要查询出来
        String sql = "select t1.c_id as commId,t1.content as content,t1.create_date as createDate,t2.name as accountName,count(t3.id) likes from qa_comment as t1" +
                " left join qa_front_user t2 on t1.create_user=t2.id" +
                " left join qa_likes t3 on t1.c_id = t3.c_id" +
                " where t1.question_id="+q_id+" GROUP BY t1.c_id";
        Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
        List list = query.list();
        map.put("commentList", list);
        return map;
    }

    /**
     * 获取评论下的评论，即为二级评论
     * PS:暂时写到二级评论，暂不考虑无限级评论
     * @param pq_id  父级评论ID
     * @return
     */
    public Map getTheComment_two(int pq_id) {
        Map map = new HashMap();
        String sql = "select t1.c_id as commId,t1.content as content,t1.create_date as createDate,t2.name as accountName,count(t3.id) likes from qa_comment as t1" +
                " left join qa_front_user t2 on t1.create_user=t2.id" +
                " left join qa_likes t3 on t1.c_id = t3.c_id" +
                " where t1.question_id="+pq_id+"";
        Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
        List list = query.list();
        map.put("commentList", list);
        return null;
    }



}
