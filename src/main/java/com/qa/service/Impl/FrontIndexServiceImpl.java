package com.qa.service.Impl;

import com.qa.dao.FrontIndexDao;
import com.qa.dao.QaBackQuesDao;
import com.qa.entity.BackQuestion;
import com.qa.service.FrontIndexService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Create by xuanhao on 2017/12/28
 */
@Service("FrontIndexService")
public class FrontIndexServiceImpl implements FrontIndexService{

    @Resource
    private FrontIndexDao frontIndexDao;
    @Override
    public Map getQuesIndex(String pages, String orderTypes) {
        List<BackQuestion> questionList = new ArrayList<>();
        int page = Integer.parseInt(pages);
        int orderType = Integer.parseInt(orderTypes);
        Map map = this.frontIndexDao.getQuesIndex(page, orderType);
        List list = (List)map.get("list");

        for(int i = 0;i < list.size();i++) {
            Object[] object = (Object[]) list.get(i);
            BackQuestion bq = new BackQuestion();
            bq.setQuesId((Integer) object[0]);
            bq.setQuesTitle((String) object[1]);
            bq.setCreateDate((Date) object[2]);
            bq.setToId((Integer)object[3]);
            bq.setTopicName((String)object[4]);
            bq.setAccountName((String)object[5]);
            bq.setHeadPhoto((String)object[6]);
            bq.setCommentCount((BigInteger) object[7]);
            bq.setBrowseCount((BigInteger)object[8]);

            questionList.add(bq);
        }


        map.remove("list");
        map.put("quesLists", questionList);
//        System.out.println("123");
//        System.out.println(map.get("quesLists"));
        return map;

    }

    public Map getTheQuesInfo(int quesId) {

        List<BackQuestion> question = new ArrayList<>();
        Map map = this.frontIndexDao.getTheQuesInfo(quesId);
        List list = (List)map.get("list");

        for(int i = 0;i < list.size();i++) {
            Object[] object = (Object[]) list.get(i);// 每行记录不在是一个对象 而是一个数组
            String labelIds = (String) object[3];
            String[] labelNames = this.frontIndexDao.LabelList(labelIds);  //调用函数获取每个问题所对应的标签信息

            //新建实例，并赋值
            BackQuestion bqt = new BackQuestion();
            bqt.setQuesId((Integer) object[0]);
            bqt.setQuesTitle((String) object[1]);
            bqt.setQuesDetail((String) object[2]);
            bqt.setLabels(labelNames);
            bqt.setCreateDate((Date) object[4]);
            bqt.setToId((Integer) object[5]);
            bqt.setTopicName((String) object[6]);
            bqt.setAccountName((String) object[7]);
            bqt.setHeadPhoto((String)object[8]);
            bqt.setCommentCount((BigInteger)object[9]);
            bqt.setBrowseCount((BigInteger)object[10]);
            //将对象实例添加进入map集合
            question.add(bqt);
        }

        map.remove("list");
        map.put("question",question);

        return map;
    }


    @Override
    public Map getTopicIndex() {
        return null;
    }


}
