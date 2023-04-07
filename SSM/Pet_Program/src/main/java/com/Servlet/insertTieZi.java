package com.Servlet;

import com.dao.EASYBUY_USERDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

//发布领养信息和寻宠信息
public class insertTieZi extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String phone = req.getParameter("phone");
        String title = req.getParameter("title");
        String type = req.getParameter("type");
        String kind = req.getParameter("kind");
        String status2 = req.getParameter("status2");
        String imag = req.getParameter("imag");
        HttpSession session = req.getSession();
        String user = (String) session.getAttribute("name");
        System.out.println(phone+"--"+title+"--"+type+"--"+kind+"--"+status2+"--"+imag+"--"+user);
        EASYBUY_USERDao.insertTieZi(kind,type,phone,title,status2,imag,user);
        resp.sendRedirect("Y_gerenzhongxin.jsp");

    }
}
