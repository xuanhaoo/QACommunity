package com.qa.action;

import com.opensymphony.xwork2.ActionContext;
import com.qa.entity.QaFrontUser;
import com.qa.service.FrontUserService;
import javafx.scene.input.DataFormat;
import net.sf.json.JSONObject;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by InterlliJ IDEA.
 * User:3to
 * Date:17-12-30
 * Time:下午9:03
 */

@Controller("FrontUserAction")
@Scope("prototype")
public class FrontUserAction extends BaseAction {

    @Resource
    private FrontUserService frontUserService;
    private String status;
    private QaFrontUser user;

    // 注册页面
    public String registerUser(){
        return "register";
    }

    /**
     * 创建时间：17-12-30 下午10:07
     * 作者：3to
     * 描述： 注册用户动作
    */
    public void registerFrontUser(){

    }

    /**
     * 创建时间：17-12-30 下午11:38
     * 作者：3to
     * 描述： 检验用户账户是否已经存在
    */
    public String checkAccount(){
        Map<String, Object> map = new HashMap<String, Object>();    // 定义map集合存如入返回json的集合
        boolean b;
        String name = request.getParameter("name");
        if(!name.equals("")){
            b = frontUserService.checkAccount(name);
            if (b){
                status = "1";
            }else{
                status = "0";
            }
        }else{
            status = "0";
        }
        map.put("status",status);
        JSONObject.fromObject(map);
        return "checkAccount";

    }
    /**
     * 创建时间：17-12-31 下午2:35
     * 作者：3to
     * 描述：添加新用户
    */
    public String addUser() throws UnsupportedEncodingException, NoSuchAlgorithmException {
        Map<String, Object> map = new HashMap<String, Object>();    // 定义map集合存如入返回json的集合

        // 添加创建时间
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date currentTime = new Date();
        Timestamp timestamp = new Timestamp(currentTime.getTime());
        user.setCreateDate(timestamp);

        // 密码加密
        user.setPassword(super.EncoderByMd5(user.getPassword()));
        boolean b = frontUserService.addUser(user);

        if(b){
            status = "1";
        }else{
            status = "0";
        }
        map.put("status",status);
        JSONObject.fromObject(map);
        return "addUser";
    }



    // 登录页面
    public String UserLogin(){
        return "login";
    }

    // 检验用户登录
    public String checkLogin() throws UnsupportedEncodingException, NoSuchAlgorithmException {
        Map<String, Object> map = new HashMap<String, Object>();    // 定义map集合存如入返回json的集合

        String account = request.getParameter("account");
        String password = request.getParameter("password");


        password = super.EncoderByMd5(password);
        QaFrontUser user = frontUserService.checkLogin(account,password);
        // 如果验证成功,则将用户保存到session中
        if(user != null){
            Map session = ActionContext.getContext().getSession();
            session.put("frontUser", user);//存入session
            status = "1";
        }else{
            status = "0";
        }
        map.put("status",status);
        JSONObject.fromObject(map);
        return "checkLogin";
    }



    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public QaFrontUser getUser() {
        return user;
    }

    public void setUser(QaFrontUser user) {
        this.user = user;
    }
}
