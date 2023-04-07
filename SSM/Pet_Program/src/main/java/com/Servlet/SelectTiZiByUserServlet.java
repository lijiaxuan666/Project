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

//用户查询自己的帖子
public class SelectTiZiByUserServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=utf-8");
        HttpSession session = req.getSession();
        String name = (String) session.getAttribute("name");
        ArrayList<TieZi> list=new ArrayList<TieZi>();
        //如果查询所有
        if("全部".equals(req.getParameter("kind"))&&"全部".equals(req.getParameter("type"))){
            list= EASYBUY_USERDao.selectTieZiAllByUser(name);
        }else{//否则根据查询具体信息查询
            if(req.getParameter("kind")!=null){
                list.addAll(EASYBUY_USERDao.selectTieZiByKind2(req.getParameter("kind"),name));
            }
            if(req.getParameter("type")!=null){
                list.addAll(EASYBUY_USERDao.selectTieZiByType(req.getParameter("type"),name));
            }
        }
        session.setAttribute("list",list);
        resp.sendRedirect("Y_gerenzhongxin.jsp");
    }
}
