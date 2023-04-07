package com.Servlet;

import com.dao.EASYBUY_USERDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

//�������ӽӿ�
public class UpdateTieZi extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=utf-8");
        int id=Integer.parseInt(req.getParameter("id"));
        String user=req.getParameter("user");
        if(req.getParameter("delete")!=null){
            EASYBUY_USERDao.deleteTieZi(id);
            resp.sendRedirect("Y_shouye.jsp");
        }
        if(req.getParameter("update")!=null){
            EASYBUY_USERDao.updateTieZi3(id,req.getParameter("kind"),req.getParameter("type"),req.getParameter("phone"),req.getParameter("title"));
            resp.sendRedirect("Y_shouye.jsp");
        }
        if(req.getParameter("status2")!=null){
            String status2=req.getParameter("status2");
            EASYBUY_USERDao.updateTieZi2(id,status2);
            //������״̬�ı����Ϣ����������
            EASYBUY_USERDao.insertXiaoXi("����������������"+status2,user);
            resp.sendRedirect("Y_shouye.jsp");
        }
        if(req.getParameter("status")!=null){
            EASYBUY_USERDao.updateTieZi(id,req.getParameter("status"));
            //������״̬�ı����Ϣ����������
            EASYBUY_USERDao.insertXiaoXi("��������"+req.getParameter("status"),user);
            resp.sendRedirect("selectTieZi");
        }
    }
}
