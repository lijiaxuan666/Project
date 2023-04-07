package com.Servlet;

import com.bean.Article;
import com.bean.TieZi;
import com.dao.EASYBUY_USERDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

//查询帖子接口
public class SelectTieZiServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=utf-8");
        HttpSession session = req.getSession();
        ArrayList<TieZi> list=new ArrayList<TieZi>();
        if(req.getParameter("update")!=null){
            session.setAttribute("id",req.getParameter("id"));
            session.setAttribute("title",req.getParameter("title"));
            session.setAttribute("phone",req.getParameter("phone"));
            resp.sendRedirect("xiugailinyang.jsp");
            return;
        }
        if(req.getParameter("status")!=null){
            list= EASYBUY_USERDao.selectTieZi(req.getParameter("status"));
        }else{
            list = EASYBUY_USERDao.selectTieZi();
        }
        session.setAttribute("list",list);
        resp.sendRedirect("G_tieziguanli.jsp");
    }
}
