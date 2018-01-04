package com.qa.action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.qa.entity.QaBackUser;
import com.qa.service.BackInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import javax.persistence.Entity;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

@Controller("BackInfoAction")
@Scope("prototype")
public class BackInfoAction extends BaseAction implements ModelDriven<QaBackUser>{




    @Resource
    private BackInfoService BackInfoService;
    private List list=null;
    private QaBackUser qaBackUser;
    private String username;
    private System account;

    public System getAccount() {
        return account;
    }

    public void setAccount(System account) {
        this.account = account;
    }





    private String name;

    public String getName() {
        return name;

    }

    public void setName(String name) {
        this.name = name;
    }
    public List getList() {
        return list;
    }

    @Override
    public QaBackUser getModel() {
        this.qaBackUser=new QaBackUser();
        return  qaBackUser;
    }



    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String FindBackInfo(){

    List<QaBackUser> QaBackUser = BackInfoService.findByname(username);
    list = QaBackUser;

    return "FindBackInfo";

    }

    public String updateInfo()  {
       // qaBackUser.setName(name);
        System.out.println(qaBackUser.getName());
        System.out.println(qaBackUser.getEmail());
        System.out.println(qaBackUser.getAccount());


        BackInfoService.updateInfo(qaBackUser);
        return "updateInfoSuccess";


    }
    public String updatePassword() throws NoSuchAlgorithmException, UnsupportedEncodingException{
        String Ps = qaBackUser.getPassword();
        String md5Ps = EncoderByMd5(Ps);  //调用加密算法
        qaBackUser.setPassword(md5Ps);
        BackInfoService.updatePsInfo(qaBackUser);
        return "updateInfoPssuccess";
    }
}
