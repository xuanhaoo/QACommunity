package com.qa.dao.impl;

import com.qa.dao.FrontQuestionDao;
import com.qa.entity.QaComment;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.io.Serializable;

/**
 * Created by InterlliJ IDEA.
 * User:3to
 * Date:18-1-2
 * Time:下午9:37
 */

@Repository("FrontQuestionDao")
public class FrontQuestionDaoImpl implements FrontQuestionDao{

    @Resource
    private SessionFactory sessionFactory;


    /**
     * 创建时间：18-1-3 上午12:26
     * 作者：3to
     * 描述： 根据问题id获取问题详情及用户信息
    */
    @Override
    public Object getQuestionById(int id) {

        // 查询问题的标题， 问题的创建时间， 问题的详情， 用户的id， 用户的名称，用户的性别，用户的头像
        String hql = "select t1.title as questionTitle, t1.create_date as createDate, t1.detail as questionDetail, " +
                "t2.id as userId, t2.name as userName, t2.sex as userSex, t2.photo as userPhoto " +
                "from qa_question as t1, qa_front_user as t2 " +
                "where t1.q_id = ? and t1.create_user = t2.id";
        Query query = sessionFactory.getCurrentSession().createSQLQuery(hql);
        query.setInteger(0,id);
        return query.list();
    }

    /**
     * 创建时间：18-1-3 上午12:26
     * 作者：3to
     * 描述： 根据问题id获取回复信息
    */
    @Override
    public Object getCommentById(int id) {

        // 查询回复的id, 查询回复的内容， 回复的创建时间， 用户的id， 用户的名称， 用户的性别， 用户的头像
        String hql = "select t1.c_id as commentId, t1.content as commentContent, t1.pid as commentParent, t1.create_date as commentCreateDate, " +
                "t2.id as userId, t2.name as userName, t2.sex as userSex, t2.photo as userPhoto " +
                "from qa_comment as t1, qa_front_user as t2 " +
                "where t1.question_id = ? and t1.create_user = t2.id";

        Query query = sessionFactory.getCurrentSession().createSQLQuery(hql);

        query.setInteger(0,id);

        if(query.list().size()!=0){
            return query.list();
        }else{
            return null;
        }
    }


    /**
     * 创建时间：18-1-4 上午12:16
     * 作者：3to
     * 描述： 添加消息回复
    */
    @Override
    public boolean addReply(QaComment qaComment) {
        Serializable i = sessionFactory.getCurrentSession().save(qaComment);
        if(i != null){
            return true;
        }
        return false;
    }
}
