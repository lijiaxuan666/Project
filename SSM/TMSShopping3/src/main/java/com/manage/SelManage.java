package com.manage;


import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.EASYBUY_COMMENT;
import com.dao.EASYBUY_COMMENTDao;

public class SelManage extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//编码
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		int page=1; //当前页数
		int pagesize=5;//每页行数
		String spage=req.getParameter("page");
		if(spage!=null){ //如果页面上传递了页数,将当前页数改变掉
			page=Integer.parseInt(spage);
		
		}
		//查出总页数
		ArrayList<EASYBUY_COMMENT> list=EASYBUY_COMMENTDao.selPage(page, pagesize);
		int max_page=EASYBUY_COMMENTDao.getMax(pagesize);
		if(list.size()>0&&max_page>0){ 
			req.setAttribute("list", list);
			//把总页数传递给guestbook.jsp 使用
			req.setAttribute("max_page", max_page);
			//把当前页数传递给guestbook.jsp使用
			req.setAttribute("page", page);
			// 跳
		 	req.getRequestDispatcher("guestbook.jsp").forward(req,resp);
		}else{
			resp.getWriter().print("<script>alert('查询失败！');<script>");
		}
 
	
	}
 
}
