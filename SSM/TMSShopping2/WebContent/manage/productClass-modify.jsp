<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<div id="header" style="padding-bottom: 6px">
    <div class="wrap">
        <div class="help">
            <a href="../indexSelect">
                返回前台页面
            </a>
        </div>
        <a href="index.jsp">
            首页
        </a>
    </div>
</div>
<div id="childNav1">
    <div style="color: white;padding-top: 5px" class="welcome wrap">管理员${name.EU_USER_ID}您好，欢迎回到管理后台。</div>
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
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>
</div>
<div class="main">
    <h2>修改商品分类</h2>
    <div class="manage">
        <form action="doProductClassUpdate">
            <table class="form">
                <tr>
                    <td class="field">父分类：</td>
                    <td><input type="hidden" name="id" value="${epc.EPC_ID }"/>
                        <select name="parentId">
                            <option value="0">零食</option>
                            <c:forEach var="epc1" items="${epclist}">
                                <c:if test="${epc1.EPC_PARENT_ID==0}">
                                    <c:if test="${epc.EPC_PARENT_ID==epc1.EPC_ID}">
                                        <option value="${epc1.EPC_ID }" selected="selected">${epc1.EPC_NAME }</option>
                                    </c:if>
                                    <c:if test="${epc.EPC_PARENT_ID!=epc1.EPC_ID}">
                                        <option value="${epc1.EPC_ID }">${epc1.EPC_NAME }</option>
                                    </c:if>
                                </c:if>
                            </c:forEach>
                        </select></td>
                </tr>
                <tr>
                    <td class="field">分类名称：</td>
                    <td><input type="text" class="text" name="className"
                               value="${epc.EPC_NAME }"/></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td><label class="ui-blue"><input type="submit"
                                                      name="submit" value="提交"/></label></td>
                </tr>
            </table>
        </form>
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

