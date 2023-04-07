<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>后台管理 -商城</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/xiaoxitixing.css">
    <link rel="stylesheet" href="../css/gerenzhongxin.css">
    <script src="../js/jquery-3.3.1.min.js"></script>
    <script src="../js/xiaoxitixing.js"></script>
    <script src="../js/Y_daohang.js"></script>
    <link type="text/css" rel="stylesheet" href="../css/style.css"/>
    <link type="text/css" rel="stylesheet" href="../css/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="../css/bootstrap-theme.min.css"/>
    <link type="text/css" rel="stylesheet" href="../css/bootstrap-theme.css"/>
    <link type="text/css" rel="stylesheet" href="../css/bootstrap.css"/>
    <link href="../css/materialdesignicons.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/multitabs.min.css">
    <link href="../css/style.min.css" rel="stylesheet">
    <script type="text/javascript" src="../scripts/function-manage.js"></script>
    <script type="text/javascript" src="../scripts/npm.js"></script>

    <script type="text/javascript">
        function jump2(p) {
            location.href = 'productSelect?cp=' + p;
        }
    </script>
</head>
<body>
<div class="daohang">
    <div>
        <img src="../images/logo.png" alt="宠物计划">
        <ul>
            <li><a href="index.jsp">首页</a></li>
            <li><a href="../indexSelect">返回前台页面</a></li>
        </ul>
    </div>
</div>

<div id="position" class="wrap">
    当前位置：商城<a href="index.jsp">>管理后台</a>
</div>
<div class="daohang">
    <div>
        <ul>
            <li ><a href="user-add.jsp">新增用户</a></li>
            <li ><a href="user">用户列表</a></li>
            <li ><a href="product-add.jsp">新增商品</a></li>
            <li ><a href="productSelect">商品列表</a></li>
            <li ><a href="productClass-add.jsp">新增分类</a></li>
            <li ><a href="ordersel">订单管理</a></li>
        </ul>
    </div>
    <div class="clear"></div>
</div>
<div class="main">
    <div class="liebiao">
        <table>
            <tr>
                <th>ID</th>
                <th>商品名称</th>
                <th>描述</th>
                <th>价格</th>
                <th>操作</th>
            </tr>
            <c:forEach var="p" items="${eplist}">
                <tr>
                    <td class="first w4 c">${p.EP_ID }</td>
                    <td class="thumb"><img
                            src="../images/product/${p.EP_FILE_NAME }" width="80"
                            height="80"/></td>
                    <td class="thumb"><a href="../selectProductView?id=${p.EP_ID }"
                           target="_blank">${p.EP_NAME }</a></td>
                    <td class="thumb"><a href="../selectProductView?id=${p.EP_ID }"
                                         target="_blank">${p.EP_PRICE }.00</a></td>
                    <td class="w1 c"><a href="toProductUpdate?id=${p.EP_ID }">修改</a>
                        <a style="margin-left: 20px" href="javascript:productDel(${p.EP_ID })">删除</a></td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div class="pager">
        <ul class="clearfix">
            <li style="position: relative;top: 5px">当前:${cpage}/${tpage }页</li>
            <li><a href="productSelect?cp=1">首页</a></li>
            <li><a href="productSelect?cp=${cpage-1<=0 ? 1 : cpage-1 }">上一页</a></li>
            <li><a
                    href="productSelect?cp=${cpage+1>=tpage ? tpage : cpage+1 }">下一页</a></li>
            <li><a href="productSelect?cp=${tpage }">尾页</a></li>
            <li style="position: relative;top: 5px"><select onchange="jump2(this.value)">
                <c:forEach var="i" begin="1" end="${tpage}">
                    <option ${i==cpage ? "selected" : "" } value="${i}">${i }页</option>
                </c:forEach>
            </select></li>
        </ul>
    </div>
</div>
<div class="clear"></div>
</div>
<script type="text/javascript" src="../scripts/jquery.min.js"></script>
<script type="text/javascript" src="../scripts/bootstrap.min.js"></script>
<script type="text/javascript" src="../scripts/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="../scripts/bootstrap-multitabs/multitabs.js"></script>
<script type="text/javascript" src="../scripts/index.min.js"></script>
<script type="text/javascript">
    window.onload = function () {
        $('.dropdown-toggle').dropdown();
    }
</script>
</body>
</html>

