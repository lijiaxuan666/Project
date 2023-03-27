package com.wangpeng.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse resp = (HttpServletResponse) servletResponse;

        // 获取请求的路径
        String uri = String.valueOf(req.getRequestURI());
        String contextPath = req.getContextPath();
        String basePath = uri.substring(contextPath.length());

        // 如果是登录相关的界面和接口，直接放行
        if (basePath.equals("/index.jsp") || basePath.equals("/login/login.do")) {
            // 访问目标资源
            filterChain.doFilter(servletRequest,servletResponse);
            return;
        }

        // 获得登录对象
        Object loginObj = req.getSession().getAttribute("loginObj");

        // 如果没有登录，则回到登录界面
        if (loginObj == null) {
            req.getRequestDispatcher("/index.jsp").forward(req,resp);
            return;
        }

        // 获得权限身份
        String authority = (String) req.getSession().getAttribute("authority");

        // 如果是管理员身份，直接放行（管理员能访问所有的资源）
        if (authority.equals("manager")) {
            filterChain.doFilter(servletRequest,servletResponse);
            return;
        }
    }

    @Override
    public void destroy() {

    }
}
