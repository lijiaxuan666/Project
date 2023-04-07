package com.Servlet;

import com.dao.EASYBUY_USERDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

//��¼�ӿ�
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
			//������û������û���ҳ������ǹ���Ա�������Ա��ҳ
			if (type == 1) {
				resp.sendRedirect("G_shouye.jsp");
			} else {
				resp.sendRedirect("Y_shouye.jsp");
			}
		} else {
			PrintWriter out = resp.getWriter();
			out.print("<script>");
			out.print("alert('�û������������');");
			out.print("location.href='index.jsp';");
			out.print("</script>");
			out.close();
		}
	}
}
