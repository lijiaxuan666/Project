<%@ page language="java" import="java.util.*"
         contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <script type="text/javascript" src="..//scripts/calendar.js"></script>
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
        <form action="userdoupdate">
            <table class="form">
                <tr>
                    <td class="field">用户名：</td>
                    <td><input type="text" class="text" name="userName"
                               value="${user.EU_USER_ID }" readonly="readonly"/></td>
                </tr>
                <tr>
                    <td class="field">用户类型：</td>
                    <td><input type="text" class="text" name="name"
                               value="${user.EU_USER_NAME }"/></td>
                </tr>
                <tr>
                    <td class="field">密码：</td>
                    <td><input type="text" class="text" name="passWord"
                               value="${user.EU_PASSWORD }"/></td>
                </tr>
                <tr>
                    <td class="field">性别：</td>
                    <td><input type="radio" name="sex" value="男"
                    ${user.EU_SEX=='男' ? "checked" :""} />男
                        <input type="radio"
                               name="sex" value="女" ${user.EU_SEX=='女' ? "checked" :""} />女
                    </td>
                </tr>
                <tr>
                    <td class="field">出生日期：</td>
                    <td><input type="text" name="birthday"
                               onfocus="c.showMoreDay = false;c.show(this);"
                               value="${user.EU_BIRTHDAY }" readonly="readonly"/></td>
                </tr>
                <tr>
                    <td class="field">邮箱：</td>
                    <td><input type="text" class="text" name="email"
                               value="${user.EU_EMAIL }"/></td>
                </tr>
                <tr>
                    <td class="field">手机号码：</td>
                    <td><input type="text" class="text" name="mobile"
                               value="${user.EU_MOBILE}"/></td>
                </tr>
                <tr>
                    <td class="field">送货地址：</td>
                    <td><input type="text" class="text" name="address"
                               value="${user.EU_ADDRESS }"/></td>
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
