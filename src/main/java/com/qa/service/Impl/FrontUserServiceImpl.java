package com.qa.service.Impl;

import com.qa.dao.FrontUserDao;
import com.qa.entity.QaFrontUser;
import com.qa.service.FrontUserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * Created by InterlliJ IDEA.
 * User:3to
 * Date:17-12-30
 * Time:下午10:06
 */
@Service("FrontUserService")
@Transactional
public class FrontUserServiceImpl implements FrontUserService {

    @Resource
    private FrontUserDao frontUserDao;

    @Override
    public boolean checkAccount(String name) {
        boolean b = frontUserDao.checkAccount(name);
        return b;
    }

    @Override
    public boolean addUser(QaFrontUser user) {
        boolean b = frontUserDao.addUser(user);
        return b;
    }

    @Override
    public QaFrontUser checkLogin(String account, String password) {
        QaFrontUser b = frontUserDao.checkLogin(account,password);
        return b;
    }
}
