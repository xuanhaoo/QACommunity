package com.qa.service;

import com.qa.entity.QaFrontUser; /**
 * Created by InterlliJ IDEA.
 * User:3to
 * Date:17-12-30
 * Time:下午10:06
 */

public interface FrontUserService {
    boolean checkAccount(String name);

    boolean addUser(QaFrontUser user);

    QaFrontUser checkLogin(String account, String password);
}
