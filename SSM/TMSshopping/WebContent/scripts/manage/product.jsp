<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>后台管理 -商城</title>
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

    <script type="text/javascript">
        function jump2(p) {
            location.href = 'productSelect?cp=' + p;
        }
    </script>
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
    <h2>商品管理</h2>

    <div class="manage">
        <table class="list">
            <tr>
                <th>ID</th>
                <th>商品名称</th>
                <th>操作</th>
            </tr>
            <c:forEach var="p" items="${eplist}">
                <tr>
                    <td class="first w4 c">${p.EP_ID }</td>
                    <td class="thumb"><img
                            src="../images/product/${p.EP_FILE_NAME }" width="80"
                            height="80"/><a href="../selectProductView?id=${p.EP_ID }"
                                            target="_blank">${p.EP_NAME }</a></td>
                    <td class="w1 c"><a href="toProductUpdate?id=${p.EP_ID }">修改</a>
                        <a href="javascript:productDel(${p.EP_ID })">删除</a></td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div class="pager">
        <ul class="clearfix">
            <li>当前:${cpage}/${tpage }页</li>
            <li><a href="productSelect?cp=1">首页</a></li>
            <li><a href="productSelect?cp=${cpage-1<=0 ? 1 : cpage-1 }">上一页</a></li>
            <li><a
                    href="productSelect?cp=${cpage+1>=tpage ? tpage : cpage+1 }">下一页</a></li>
            <li><a href="productSelect?cp=${tpage }">尾页</a></li>
            <li><select onchange="jump2(this.value)">
                <c:forEach var="i" begin="1" end="${tpage}">
                    <option ${i==cpage ? "selected" : "" } value="${i}">${i }页</option>
                </c:forEach>
            </select></li>
        </ul>
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

