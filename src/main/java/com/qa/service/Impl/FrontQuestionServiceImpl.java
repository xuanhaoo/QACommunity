package com.qa.service.Impl;

import com.qa.dao.FrontQuestionDao;
import com.qa.entity.QaComment;
import com.qa.entity.QaQuestion;
import com.qa.service.FrontQuestionService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;

/**
 * Created by InterlliJ IDEA.
 * User:3to
 * Date:18-1-2
 * Time:下午9:34
 */

@Service("FrontQuestionService")
@Transactional
public class FrontQuestionServiceImpl implements FrontQuestionService {

    @Resource
    private FrontQuestionDao frontQustionDao;

    @Override
    public Object getQuestionById(int id) {
        Object b = frontQustionDao.getQuestionById(id);
        return b;
    }

    @Override
    public Object getCommentById(int id) {
        ArrayList b = (ArrayList) frontQustionDao.getCommentById(id);
        return b;
    }

    @Override
    public boolean addReply(QaComment qaComment) {
        boolean b = frontQustionDao.addReply(qaComment);
        return b;
    }

    public boolean addQues(QaQuestion qaQuestion) {
        boolean b = frontQustionDao.addQues(qaQuestion);
        return b;
    }
}
