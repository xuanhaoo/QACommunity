package com.qa.dao;

import com.qa.entity.QaFrontUser;

import java.util.List;
import java.util.Map;

/**
 *
 */
public interface FrontUserDao {
    boolean checkAccount(String name);

    boolean addUser(QaFrontUser user);

    QaFrontUser checkLogin(String account, String password);

    Map getQuestionByUser(int id, int page);

    boolean updateBaseInfo(int id, String name, String email, String phone, int sex);

    boolean checkUserPass(int id, String password);

    boolean updateUserPass(int id, String password);

    boolean saveUserPhoto(int id, String realPath);

    List getCommentByUser(int id);
}
