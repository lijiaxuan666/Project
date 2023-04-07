package com.Servlet;

import com.dao.EASYBUY_USERDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

//登录接口
public class LoginServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String username = req.getParameter("userName");
		String passWord = req.getParameter("passWord");
		int type = Integer.parseInt(req.getParameter("type"));
		resp.setContentType("text/html;charset=utf-8");
		HttpSession session = req.getSession();
		int count = EASYBUY_USERDao.selectByNM(username, passWord,type);
		if (count > 0) {
			session.setAttribute("name", username);
			//如果是用户进入用户主页，如果是管理员进入管理员主页
			if (type == 1) {
				resp.sendRedirect("G_shouye.jsp");
			} else {
				resp.sendRedirect("Y_shouye.jsp");
			}
		} else {
			PrintWriter out = resp.getWriter();
			out.print("<script>");
			out.print("alert('用户名或密码错误');");
			out.print("location.href='index.jsp';");
			out.print("</script>");
			out.close();
		}
	}
}
