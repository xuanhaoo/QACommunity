package com.qa.aop;

/**
 *切面类
 */


import com.opensymphony.xwork2.ActionContext;
import com.qa.entity.QaBackUser;
import com.qa.entity.QaLogRecord;
import com.qa.service.QaLogRecordService;
import org.apache.struts2.ServletActionContext;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

/**
 * 系统日志切面
 */
@Aspect
@Component
public class SystemLogAspect {

    @Resource
    private QaLogRecordService qaLogRecordService;


    /**
     * 定义一个切入点
     * 监听dao中的方法调用（排除用户登录情况,日志记录情况）
     */
    @Pointcut(value="execution (* com.qa.dao.*.*(..)) && !execution(* com.qa.dao.QaBackUserDao.login(..)) && !execution(* com.qa.dao.QaLogRecordDao.*(..))")
    public void AfterPoint() {}


    /**
     * 在业务执行前调用,不能阻止业务调用
     * @param point
     */

//    @AfterReturning(value="AfterPoint()")
    public void after(JoinPoint point) throws Exception {
        String action;  // 操作方法
        String name;    // 操作人员账户
        Date createTime;    // 操作时间
        String ip;      // 操作人员ip地址
        QaLogRecord logRecord = new QaLogRecord();  // 创建日志对象


        name = getUserName();    // 获取管理员姓名
        createTime = getCurruentTime(); // 获取系统时间
        ip = getIp();

        // 获取方法名
        action = point.getSignature().getName();

        System.out.println("用户："+name);
        System.out.println("时间："+createTime);
        System.out.println("方法名："+action);
        System.out.println("ip："+ip);


        // 日志对象
        logRecord.setAccount(name);
        logRecord.setCreateDate(createTime);
        logRecord.setCreateIp(ip);
        logRecord.setType(action);

        // 添加日志信息
        qaLogRecordService.addLog(logRecord);

    }



    /**
     * 获取操作人员账户
     * @return
     */
    public String getUserName(){
        QaBackUser user;
        String account;
        // 从session中获取用户信息
        Map session = ActionContext.getContext().getSession();
        user = (QaBackUser) session.get("qaBackUser");
        account = user.getAccount();

        if(account == null){
            return "";
        }else {
            return account;
        }
    }

    /**
     * 获取当前时间
     * @return
     * @throws ParseException
     */
    public Date getCurruentTime() {

        // java.util.date 与 sql.date 不一样,因此需要转换
//        java.util.Date now = new java.util.Date();
//        Date SqlDate = new Date(now.getTime());
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date currentTime = new Date();
         Timestamp timestamp = new Timestamp(currentTime.getTime());
        return timestamp;
    }

    /**
     *
     * 参数：@param null
     * 描述：获取请求客户端的ip地址
    */
    
    public String getIp(){
        HttpServletRequest res= ServletActionContext.getRequest();
        String ip =  res.getRemoteAddr();
        return ip;
    }


//    /**
//     * 利用java反射来获取方法名称
//     * 将操作值拼接为操作内容
//     * @param args
//     * @param Name
//     * @return
//     */
//    public String OptionContent(Object[] args, String Name){
//        String className = null;
//        int index = 1;
//        StringBuffer sb = new StringBuffer();
//
//        if (args == null){
//            return null;
//        }
//        // 添加操作方法
//        sb.append(Name);
//        // 遍历参数
//        for (Object info : args){
//
//            // 获取对象类型
//            className = info.getClass().getName();
//            className = className.substring(className.lastIndexOf(".") + 1);
//            sb.append("[参数" + index + ", 类型" + className);
//
//
//            sb.append("]");
//            index++;
//        }
//        return sb.toString();
//    }


}
