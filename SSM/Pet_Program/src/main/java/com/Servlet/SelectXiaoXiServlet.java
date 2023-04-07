package com.Servlet;

import com.bean.TieZi;
import com.bean.XiaoXi;
import com.dao.EASYBUY_USERDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

//个人中心消息查询
public class SelectXiaoXiServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=utf-8");
        HttpSession session = req.getSession();
        String name = (String) session.getAttribute("name");
        ArrayList<XiaoXi> list=new ArrayList<XiaoXi>();
        list.addAll(EASYBUY_USERDao.selectXiaoXi(name));
        session.setAttribute("list",list);
        resp.sendRedirect("Y_xiaoxitixing.jsp");
    }
}
