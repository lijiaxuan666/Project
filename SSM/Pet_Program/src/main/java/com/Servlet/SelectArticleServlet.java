package com.Servlet;

import com.bean.Article;
import com.dao.EASYBUY_USERDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

//查询文章接口
public class SelectArticleServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String id = req.getParameter("id");
        resp.setContentType("text/html;charset=utf-8");
        HttpSession session = req.getSession();
        Article article = EASYBUY_USERDao.selectArticle(Integer.parseInt(id));
        session.setAttribute("title",article.getTitle());
        session.setAttribute("contnet",article.getContnet());
        session.setAttribute("time",article.getTime());
        session.setAttribute("file_name","images/"+article.getFile_name());
        resp.sendRedirect("wenzhang.jsp");
    }
}
