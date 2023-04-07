package com.Servlet;

import com.dao.EASYBUY_USERDao;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

//×¢²á½Ó¿Ú
public class RegisterInServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String username = req.getParameter("userName");
        String passWord = req.getParameter("password");

        int count = EASYBUY_USERDao.insert(username,passWord);
        PrintWriter out = resp.getWriter();
        if (count > 0) {
            resp.sendRedirect("index.jsp");
        } else {
            out.write("<script>");
            out.write("alert('register error');");
            out.write("location.href='register.jsp'");
            out.write("</script>");
            out.close();
        }
    }
}
