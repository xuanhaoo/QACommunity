package com.qa.dao;

import com.qa.entity.QaComment;
import com.qa.entity.QaQuestion;

/**
 *
 */
public interface FrontQuestionDao {
    Object getQuestionById(int id);

    Object getCommentById(int id);

    boolean addReply(QaComment qaComment);
    public boolean addQues(QaQuestion qaQuestion);
}
