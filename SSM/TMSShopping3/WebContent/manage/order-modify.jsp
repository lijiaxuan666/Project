<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
        <form action="douporder">
            <table class="form">
                <tr>
                    <td class="field">订单ID：</td>
                    <td><input type="text" class="text" name="orderId"
                               value="${order.EO_ID }" readonly="readonly"/></td>
                </tr>
                <tr>
                    <td class="field">订购人姓名：</td>
                    <td><input type="text" class="text" name="name"
                               value="${order.EO_USER_ID }" readonly="readonly"/></td>
                </tr>
                <tr>
                    <td class="field">收货地址</td>
                    <td><input type="text" class="text" name="addres"
                               value="${order.EO_USER_ADDRESS }" readonly="readonly"/></td>
                </tr>
                <tr>
                    <td class="field">总价格</td>
                    <td><input type="text" class="text" name="cost"
                               value="${order.EO_COST }" readonly="readonly"/></td>
                </tr>
                <tr>
                    <td class="field">订单状态</td>
                    <td><select name="tatus"
                                onchange="change(this,${order.EO_STATUS })">
                        <option value="1"
                        ${order.orderStatusStr=="待审核" ? "selected" : ""}>待审核
                        </option>
                        <option value="2"
                        ${order.orderStatusStr=="审核通过" ? "selected" :""}>审核通过
                        </option>
                        <option value="3"
                        ${order.orderStatusStr=="配货" ? "selected" : ""}>配货
                        </option>
                        <option value="4"
                        ${order.orderStatusStr=="发货" ? "selected" : ""}>发货
                        </option>
                        <option value="5"
                        ${order.orderStatusStr=="收货确认" ? "selected" : ""}>收货确认
                        </option>
                    </select></td>
                </tr>
                <tr>
                    <td></td>
                    <td><label class="ui-blue"><input type="submit"
                                                      name="submit" value="更新"/></label></td>
                </tr>
            </table>
        </form>
    </div>
</div>
<div class="main">
    <h2>订单详细</h2>
    <div class="manage">
        <table border="1" width="600px" height="100px" bordercolor="red">
            <tr align="center">
                <td class="field">商品名称</td>
                <td class="field">商品图片</td>
                <td class="field">商品价格</td>
                <td class="field">购买数量</td>
                <td class="field">商品库存</td>
            </tr>
            <c:forEach var="d" items="${dlist}">
                <tr align="center">
                    <td>${d.EP_NAME }</td>
                    <td><img src="../images/product/${d.EP_FILE_NAME }"
                             height="100" width="100"/></td>
                    <td>${d.EP_PRICE }</td>
                    <td>${d.EOD_QUANTITY }</td>
                    <td>${d.EP_STOCK }</td>
                </tr>
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
