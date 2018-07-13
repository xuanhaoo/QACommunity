package com.qa.action;

/**
 * Create by xuanhao on 2018/5/3
 */

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.util.ServletContextAware;
import sun.misc.BASE64Encoder;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * 基础类，可用来写一下公共方法
 */
public class BaseAction extends ActionSupport implements ServletContextAware,ServletRequestAware,ServletResponseAware {
    protected HttpServletRequest request;  //请求对象
    protected HttpServletResponse response;    //响应对象
    protected HttpSession session;  //会话对象
    protected ServletContext application;  //全局对象

    @Override
    public void setServletRequest(HttpServletRequest request) {
        this.request = request;
        this.session = this.request.getSession();
    }

    @Override
    public void setServletResponse(HttpServletResponse response) {
        this.response = response;
    }




    @Override
    public void setServletContext(ServletContext servletContext) {

    }


    /**
     *java的md5加密，主要用于对密码的加密判断
     * @param str
     * @return
     * @throws NoSuchAlgorithmException
     * @throws UnsupportedEncodingException
     */
    public String EncoderByMd5(String str) throws NoSuchAlgorithmException, UnsupportedEncodingException {
        //确定加密算法md5方式
        MessageDigest md5=MessageDigest.getInstance("MD5");
        BASE64Encoder base64en = new BASE64Encoder();
        //加密后的字符串
        String newstr=base64en.encode(md5.digest(str.getBytes("utf-8")));
        return newstr;
    }
}
