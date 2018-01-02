package com.qa.service.Impl;

import com.opensymphony.xwork2.ActionContext;
import com.qa.dao.FrontUserDao;
import com.qa.entity.QaFrontUser;
import com.qa.service.FrontUserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    public Map checkLogin(String account, String password) {
        QaFrontUser b = frontUserDao.checkLogin(account,password);
        // 构造一个新的对象给前台使用
        Map m = new HashMap();
        if(b != null){
            m.put("name",b.getName());
            m.put("id",b.getId());
            m.put("email",b.getEmail());
            m.put("account",b.getAccount());
            m.put("sex",b.getSex());
            m.put("photo",b.getPhoto());
            m.put("phone",b.getPhone());
            m.put("createDate",b.getCreateDate());
        }
        return m;
    }

    @Override
    public Map getQuestionByUser(int id, int page) {
        Map m = frontUserDao.getQuestionByUser(id,page);
        return m;
    }

    @Override
    public boolean userUpdate(int id, String name, String email,String phone, int sex) {
        boolean b = frontUserDao.updateBaseInfo(id,name,email,phone,sex);
        return b;
    }

    @Override
    public boolean checkPass(int id, String password) {
        boolean b = frontUserDao.checkUserPass(id,password);
        return b;
    }

    @Override
    public boolean userPassUpdate(int id, String password) {
        boolean b = frontUserDao.updateUserPass(id, password);
        return b;
    }

    @Override
    public boolean saveUserPhoto(int id, String realPath) {
        boolean b = frontUserDao.saveUserPhoto(id,realPath);

        // 更新用户头像
        Map session = ActionContext.getContext().getSession();
        Map user = (Map) session.get("frontUser");//获取session
        user.remove("photo");
        user.put("photo",realPath);

        return b;
    }

    @Override
    public ArrayList getCommentByUser(int id) {
        ArrayList comment = (ArrayList) frontUserDao.getCommentByUser(id);
        return comment;
    }
}
