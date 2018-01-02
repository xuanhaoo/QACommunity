package com.qa.service;

import com.qa.entity.QaFrontUser;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by InterlliJ IDEA.
 * User:3to
 * Date:17-12-30
 * Time:下午10:06
 */

public interface FrontUserService {
    boolean checkAccount(String name);

    boolean addUser(QaFrontUser user);

    Map checkLogin(String account, String password);

    Map getQuestionByUser(int id, int page);

    boolean userUpdate(int id, String name, String email,String phone, int sex);

    boolean checkPass(int id, String password);

    boolean userPassUpdate(int id, String password);

    boolean saveUserPhoto(int id, String realPath);

    ArrayList getCommentByUser(int id);
}
