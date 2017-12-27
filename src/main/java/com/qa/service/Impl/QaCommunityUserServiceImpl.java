package com.qa.service.Impl;

import com.qa.dao.QaCommunityUserDao;
import com.qa.entity.QaFrontUser;
import com.qa.service.QaCommunityUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by InterlliJ IDEA.
 * User:3to
 * Date:17-12-23
 * Time:下午1:36
 */

@Service("QaCommunityUserService")
@Transactional
public class QaCommunityUserServiceImpl implements QaCommunityUserService {

    @Autowired
    private QaCommunityUserDao qaCommunityUserDao;


    @Override
    public Map getComUserList(String pages, String limit, String name, String[] rangeDate) {
        Map comUserList = new HashMap();  // 用户集合
        comUserList = qaCommunityUserDao.getCommunityUserList(pages, limit, name, rangeDate);
        return comUserList;
    }

    @Override
    public boolean deleteLog(List<Integer> ids) {
        boolean istrue;
        istrue = qaCommunityUserDao.deleteComUser(ids);
        return istrue;
    }

    @Override
    public boolean updateUser(QaFrontUser user) {
        boolean istrue;
        istrue = qaCommunityUserDao.updateUser(user);
        return istrue;
    }

    @Override
    public QaFrontUser findById(int id) {
        QaFrontUser user;
        user = qaCommunityUserDao.findById(id);
        return user;
    }
}
