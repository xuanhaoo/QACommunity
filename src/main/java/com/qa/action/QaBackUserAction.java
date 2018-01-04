package com.qa.action;

import com.opensymphony.xwork2.ActionContext;
import com.qa.entity.QaBackUser;
import com.qa.service.QaBackUserService;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import javax.xml.ws.Action;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;
import net.sf.json.JSONObject;

/**
 * Create by xuanhao on 2017/11/30
 */

@Controller("QaBackUserAction")
@Scope("prototype")
public class QaBackUserAction extends BaseAction {
    @Resource
    private QaBackUserService qaBackUserService;
    private QaBackUser qaBackUser;
    public QaBackUser getQaBackUser() {
        return qaBackUser;
    }

    public void setQaBackUser(QaBackUser qaBackUser) {
        this.qaBackUser = qaBackUser;
    }

    //对应json获取msg
    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    private String msg;  //设置返回信息提示

    //检查登录
    public String baLogin()  throws NoSuchAlgorithmException, UnsupportedEncodingException{
        checkLogin();
        return SUCCESS;
    }
    //登录的具体实现
    private void checkLogin()  throws NoSuchAlgorithmException, UnsupportedEncodingException {
        //定义map集合存取返回信息信息
        Map<String, Object> map = new HashMap<String, Object>();
        String status = null;       //状态标识代码
        String Ps = qaBackUser.getPassword();
        String md5Ps = EncoderByMd5(Ps);  //调用加密算法
        qaBackUser.setPassword(md5Ps);
        //System.out.println(qaBackUser.getPassword());
        //检查登录信息是否正确
        if(qaBackUserService.login(qaBackUser)) {
            Map session = ActionContext.getContext().getSession();

            session.put("qaBackUser", qaBackUser);//存入session
            session.put("user",qaBackUser.getAccount());
            //return SUCCESS;
            status = "0";  //成功状态码

        }else {
            //return ERROR;
            status = "1";      //失败状态码

        }
        map.put("status", status);
        msg = JSONObject.fromObject(map).toString();        //转化为json字符串
        //System.out.println(msg);
    }

    /**
     * 验证登录成功进入控制面板主页
     * @return
     */
    public String dashboard() {
        return "dashboard";
    }

    /**
     * 退出登录删除时session
     * @return
     */
    public String logout() {
        Map session = ActionContext.getContext().getSession();
        if(session.get("qaBackUser") != null) {
            session.remove("qaBackUser");
        }
        return "userLogin";
    }


}
