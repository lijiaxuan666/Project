package com.Servlet;

import com.bean.TieZi;
import com.dao.EASYBUY_USERDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

//�û�����Ѱ��������Ĳ�ѯ���ݽӿ�
public class UserSelectTieZiServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=utf-8");
        HttpSession session = req.getSession();
        ArrayList<TieZi> list=new ArrayList<TieZi>();
        if(req.getParameter("like")!=null){
            list=EASYBUY_USERDao.like(req.getParameter("key"),req.getParameter("index"));
            session.setAttribute("list",list);
            if("����".equals(req.getParameter("index")))
                resp.sendRedirect("Y_lingyang.jsp");
            else
                resp.sendRedirect("Y_xunchong.jsp");
            return;
        }
        if("ȫ��".equals(req.getParameter("kind"))&&"ȫ��".equals(req.getParameter("type"))){
            list= EASYBUY_USERDao.selectTieZiAll(req.getParameter("index"));
        }else{
            if(req.getParameter("kind")!=null){
                list.addAll(EASYBUY_USERDao.selectTieZiByKind(req.getParameter("kind"),req.getParameter("index")));
            }
            if(req.getParameter("type")!=null){
                list.addAll(EASYBUY_USERDao.selectTieZiByType(req.getParameter("type")));
            }
        }
        session.setAttribute("list",list);
        for(TieZi t:list){
            System.out.println(t.toString());
        }
        if("����".equals(req.getParameter("index")))
            resp.sendRedirect("Y_lingyang.jsp");
        else
            resp.sendRedirect("Y_xunchong.jsp");
    }
}
