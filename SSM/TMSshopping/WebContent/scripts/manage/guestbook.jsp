<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@page import="com.bean.EASYBUY_COMMENT" %>
<%@page import="com.dao.EASYBUY_COMMENTDao" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>商城</title>
    <link type="text/css" rel="stylesheet" href="../../css/style.css"/>
    <link type="text/css" rel="stylesheet" href="../../css/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="../../css/bootstrap-theme.min.css"/>
    <link type="text/css" rel="stylesheet" href="../../css/bootstrap-theme.css"/>
    <link type="text/css" rel="stylesheet" href="../../css/bootstrap.css"/>
    <link href="../../css/materialdesignicons.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../../css/multitabs.min.css">
    <link href="../../css/style.min.css" rel="stylesheet">
    <script type="text/javascript" src="../function-manage.js"></script>
    <script type="text/javascript" src="../npm.js"></script>
</head>
<body>
<div id="header" class="wrap">

    <div class="help">
        <a href="../indexSelect">
            <button>返回前台页面</button>
        </a>
    </div>
    <a href="index.jsp">
        <button>首页</button>
    </a>
</div>
<div id="childNav1">
    <div class="welcome wrap">管理员${name.EU_USER_ID}您好，欢迎回到管理后台。</div>
</div>
<div id="position" class="wrap">
    您现在的位置：商城<a href="index.jsp">>管理后台</a>
</div>
<div id="main" class="lefter">
    <div id="menu-mng" class="lefter">
        <div class="box">
            <div class="lyear-layout-sidebar-scroll">
                <nav class="sidebar-main">
                    <ul class="nav nav-drawer">
                        <li><a class="multitabs"><i
                                class="mdi mdi-home"></i><span>后台首页</span></a></li>
                        <li class="nav-item nav-item-has-subnav"><a href="javascript:void(0)"><i
                                class="mdi mdi-palette"></i><span>账号管理</span></a>
                            <ul class="nav nav-subnav">
                                <li><a class="multitabs" href="user-add.jsp">新增</a></li>
                                <li><a class="multitabs" href="user">用户管理</a></li>
                            </ul>
                        </li>
                        <li class="nav-item nav-item-has-subnav"><a href="javascript:void(0)"><i
                                class="mdi mdi-format-align-justify"></i>
                            <span>商品信息</span></a>
                            <ul class="nav nav-subnav">
                                <li><a class="multitabs" href="productClassAdd">新增</a></li>
                                <li><a class="multitabs" href="productSelect">分类管理</a></li>
                            </ul>
                        </li>
                        <li class="nav-item nav-item-has-subnav"><a href="javascript:void(0)"><i
                                class="mdi mdi-file-outline"></i>
                            <span>订单管理</span></a>
                            <ul class="nav nav-subnav">
                                <li><a class="multitabs" href="ordersel">订单管理</a></li>
                            </ul>
                        </li>
                        <li class="nav-item nav-item-has-subnav"><a href="javascript:void(0)"><i
                                class="mdi mdi-format-align-justify"></i>
                            <span>留言管理</span></a>
                            <ul class="nav nav-subnav">
                                <li><a class="multitabs" href="SelManage">留言管理</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>
</div>
<div class="main">
    <h2>留言管理</h2>
    <div class="manage">
        <table class="list">
            <tr>
                <th>ID</th>
                <th>姓名</th>
                <th>留言内容</th>
                <th>状态</th>
                <th>操作</th>
            </tr>
            <%
                int cpage = (Integer) request.getAttribute("page");
                int max_page = (Integer) request.getAttribute("max_page");

                ArrayList<EASYBUY_COMMENT> list = (ArrayList<EASYBUY_COMMENT>) request.getAttribute("list");
                for (EASYBUY_COMMENT comment : list) {
            %>

            <tr>
                <td class="first w4 c"><%=comment.getEC_ID()%>
                </td>
                <td class="w1 c"><%=comment.getEC_NICK_NAME()%>
                </td>
                <td><%=comment.getEC_CONTENT()%>
                </td>
                <%
                    if (comment.getEC_REPLY() == null || "".equals(comment.getEC_REPLY())) {
                %>
                <td class="w1 c">未回复</td>
                <%
                } else {
                %>
                <td class="w1 c">已回复</td>
                <%
                    }
                %>
                <td class="w1 c">
                    <%
                        if (comment.getEC_REPLY() == null || "".equals(comment.getEC_REPLY())) {
                    %>
                    <a href="UpdateManage?id=<%=comment.getEC_ID()%>">回复</a> <%
                    }
                %> <a href="javascript:DelManage(<%=comment.getEC_ID()%>)">删除</a>
                </td>
            </tr>
            <%
                }
            %>
        </table>
        <div class="pager">
            <ul class="clearfix">
                <%
                    if (cpage != 1) {
                %>
                <li><a href="SelManage?page=<%=cpage - 1%>">上一页</a></li>
                <%
                    }
                %>
                <%
                    for (int i = 1; i <= max_page; i++) {
                %>
                <li><a href="SelManage?page=<%=i%>"><%=i%>
                </a></li>
                <%
                    }
                %>
                <%
                    if (cpage != max_page) {
                %>
                <li><a href="SelManage?page=<%=cpage + 1%>">下一页</a></li>

                <%
                    }
                %>
            </ul>
        </div>
    </div>
</div>
<div class="clear"></div>
</div>
<script type="text/javascript" src="../jquery.min.js"></script>
<script type="text/javascript" src="../bootstrap.min.js"></script>
<script type="text/javascript" src="../perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="../scripts/bootstrap-multitabs/multitabs.js"></script>
<script type="text/javascript" src="../index.min.js"></script>
<script type="text/javascript">
    window.onload = function () {
        $('.dropdown-toggle').dropdown();
    }
</script>
</body>
</html>
