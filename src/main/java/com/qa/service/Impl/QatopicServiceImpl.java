package com.qa.service.Impl;

import com.qa.dao.QaTopicDao;
import com.qa.entity.QaTopic;
import com.qa.service.QaTopicService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service("QaTopicService")
@Transactional
public class QatopicServiceImpl implements QaTopicService {
    @Resource
    private QaTopicDao qaTopicDao;
    @Override
    public List<QaTopic> findAllTopic(){

        List<QaTopic> list=qaTopicDao.findAll();
        return list;
    }

    public void DeleteTopic(int i){
        qaTopicDao.DeleteTopic(i);

    }
    public void UpdateTopic(QaTopic qaTopic){
        System.out.println("nihao a"+qaTopic.getTopicName());
        qaTopicDao.UpdateTopic(qaTopic);
    }
    public void AddTopic(QaTopic qaTopic ){
        System.out.println("nihao a"+qaTopic.getTopicName());
        qaTopicDao.AddTopic(qaTopic);
    }
}
