<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>后台管理-商城</title>
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

</head>
<body>
<div class="daohang">
    <div>
        <img src="../images/logo.png" alt="宠物计划">
        <ul>
            <li ><a href="index.jsp">首页</a></li>
            <li ><a href="../indexSelect">返回前台页面</a></li>
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
    <div class="manage">
        <table class="list">
            <tr>
                <th>ID</th>
                <th>分类名称</th>
                <th>操作</th>
            </tr>
            <c:forEach var="epc" items="${epclist}">
                <c:if test="${epc.EPC_PARENT_ID == 0}">
                    <tr>
                        <td class="first w4 c">${epc.EPC_ID}</td>
                        <td>${epc.EPC_NAME}</td>
                        <td class="w1 c"><a
                                href="toProductClassUpdate?id=${epc.EPC_ID}">修改</a>
                            <a style="margin-left: 20px" href="productClassDel?id=${epc.EPC_ID}">删除</a></td>
                    </tr>
                    <c:forEach var="epc2" items="${epclist}">
                        <c:if
                                test="${epc.EPC_ID==epc2.EPC_PARENT_ID&&epc2.EPC_ID!=epc2.EPC_PARENT_ID}">
                            <tr>
                                <td class="first w4 c">${epc2.EPC_ID}</td>
                                <td class="childClass">${epc2.EPC_NAME}</td>
                                <td class="w1 c"><a
                                        href="toProductClassUpdate?id=${epc2.EPC_ID}">修改</a>
                                    <a style="margin-left: 20px" href="javascript:productClassDel(${epc2.EPC_ID})">删除</a></td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </c:if>
            </c:forEach>
        </table>
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

