<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>后台管理-商城</title>
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
                                <li><a class="multitabs" href="product-add.jsp">新增</a></li>
                                <li><a class="multitabs" href="productSelect">商品管理</a></li>
                            </ul>
                        </li>
                        <li class="nav-item nav-item-has-subnav"><a href="javascript:void(0)"><i
                                class="mdi mdi-format-align-justify"></i>
                            <span>分类信息</span></a>
                            <ul class="nav nav-subnav">
                                <li><a class="multitabs" href="productClass-add.jsp">新增</a></li>
                                <li><a class="multitabs" href="productClass">分类管理</a></li>
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
    <h2>修改订单</h2>
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
