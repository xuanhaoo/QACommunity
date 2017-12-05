package com.qa.action;

/**
 * Create by xuanhao on 2017/12/3
 */

import com.opensymphony.xwork2.ActionSupport;
import sun.misc.BASE64Encoder;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * 基础类，可用来写一下公共方法
 */
public class BaseAction extends ActionSupport {


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
