package com.qa.dao;

import com.qa.entity.QaFrontUser; /**
 * Created by InterlliJ IDEA.
 * User:3to
 * Date:17-12-31
 * Time:下午9:47
 */
public interface FrontUserDao {
    boolean checkAccount(String name);

    boolean addUser(QaFrontUser user);

    QaFrontUser checkLogin(String account, String password);
}
