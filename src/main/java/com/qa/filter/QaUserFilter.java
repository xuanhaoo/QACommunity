package com.qa.filter;


import java.io.IOException;
import java.lang.reflect.Method;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.aop.MethodBeforeAdvice;
/**
 * Create by xuanhao on 2017/12/2
 * function: 后台用户登录验证
 */
public class QaUserFilter extends HttpServlet implements Filter {

    /**
     * 需要排除的页面
     */

    private String excludedPages;
    private String[] excludedPageArray;

    public void doFilter(ServletRequest req, ServletResponse resp,
                         FilterChain chain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        HttpSession session = request.getSession(true);
        boolean isExcludedPage = false;
        for (String page : excludedPageArray) {//判断是否在过滤url之外
            if((request).getServletPath().equals(page)){
                isExcludedPage = true;
                break;
            }
        }
        if(isExcludedPage) {        //在过滤的url之外
            chain.doFilter(request, response);
        }else {
            //不在url之外则进行判断session
            if(request.getSession().getAttribute("qaBackUser") == null) {
                //System.out.println("拦截路径："+request.getRequestURI());
                //非法请求，跳转到登陆页面
                request.getSession().setAttribute("error", "非法请求，请登录！");
                response.sendRedirect(request.getContextPath() + "/admin/login.jsp");
            }else {
                //如果有下一个过滤器则跳转，否则直接到目标页面
                chain.doFilter(request, response);
            }
        }

    }

    /**
     * 初始化函数，获取需要排除的URL
     * @param fConfig
     * @throws ServletException
     */
    public void init(FilterConfig fConfig) throws ServletException {
        excludedPages = fConfig.getInitParameter("excludedPages");
        //获取配置中的路径信息
        if (StringUtils.isNotEmpty(excludedPages)) {
            excludedPageArray = excludedPages.split(",");
        }
        return;
    }


}
