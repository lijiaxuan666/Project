package com.Servlet;


import com.bean.EASYBUY_USER;
import com.dao.EASYBUY_USERDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class RegisterInServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String username = req.getParameter("userName");
        String name = "��ͨ�û�";
        String rePassWord = req.getParameter("rePassWord");
        String sex = req.getParameter("sex");
        String year = req.getParameter("birthday");
        String email = req.getParameter("email");
        String mobile = req.getParameter("mobile");
        String address = req.getParameter("address");

        HttpSession session = req.getSession();
        EASYBUY_USER u = new EASYBUY_USER(username, name, rePassWord, sex, year, email, mobile, address, 1);
        int count = EASYBUY_USERDao.insert(u);
        PrintWriter out = resp.getWriter();
        if (count > 0) {
            resp.sendRedirect("reg-result.jsp");
        } else {
            out.write("<script>");
            out.write("alert('register error');");
            out.write("location.href='register.jsp'");
            out.write("</script>");
            out.close();
        }
    }
}
