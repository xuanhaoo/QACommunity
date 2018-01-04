package com.qa.dao;

import com.qa.entity.QaTopic;
import java.util.List;
public interface QaTopicDao {
    public List<QaTopic> findAll();
   public void DeleteTopic(int i);
    public void UpdateTopic(QaTopic qaTopic);
    public void AddTopic(QaTopic qaTopic);
}
