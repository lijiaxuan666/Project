package com.Servlet;

import com.dao.EASYBUY_USERDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UpdateXiaoXiServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=utf-8");
        int id=Integer.parseInt(req.getParameter("id"));
        if(req.getParameter("delete")!=null){
            EASYBUY_USERDao.deleteXiaoXi(id);
            resp.sendRedirect("selectXiaoXi");
        }
        if(req.getParameter("update")!=null){
            EASYBUY_USERDao.updateXiaoXi(id);
            resp.sendRedirect("selectXiaoXi");
        }
    }
}
