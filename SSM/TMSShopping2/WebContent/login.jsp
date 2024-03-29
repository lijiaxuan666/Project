<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>商城-首页</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/xiaoxitixing.css">
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/xiaoxitixing.js"></script>
    <script src="js/Y_daohang.js"></script>
    <link type="text/css" rel="stylesheet" href="css/style.css"/>
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="css/bootstrap-theme.css"/>
    <link type="text/css" rel="stylesheet" href="css/bootstrap-theme.min.css"/>
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
    <script type="text/javascript" src="scripts/function.js"></script>
    <script type="text/javascript" src="scripts/bootstrap.js"></script>
    <script type="text/javascript" src="scripts/bootstrap.min.js"></script>
    <script type="text/javascript" src="scripts/npm.js"></script>
    <script type="text/javascript">
        function selectname() {
            var name = document.getElementById("selectname").value;
            location.href = 'selectProductList?name=' + name;
        }

        function searchHot(name) {
            location.href = 'selectProductList?name=' + name;
        }
    </script>

    <style>
        body {
            background-size: cover;
            background-image: url(./images/1.jpg)
        }
    </style>

</head>
<body>
<div class="daohang">
    <div>
        <ul>
            <li ><a href="indexSelect">首页</a></li>
            <li ><a href="login.jsp">登录</a></li>
            <li ><a href="selectdd?dd=${name.EU_USER_ID }">个人订单</a></li>
            <li ><a href="ShopSelect">购物车</a></li>
            <li ><c:if test="${name.EU_STATUS==2}">
                <a href="manage/index.jsp">去后台</a></c:if></li>
        </ul>
    </div>
</div>
<div style="margin-top: 100px" id="register">
    <div class="shadow">
        <em class="corner lb"></em> <em class="corner rt"></em>
        <div class="box">
            <h1 style="text-align: center">欢迎登录-好又多零食超市</h1>
            <form id="loginForm" method="post" action="login"
                  onsubmit="return checkForm(this)">
                <table>
                    <tr>
                        <td class="field">用户名：</td>
                        <td><input class="text" type="text" name="userName"
                                   onfocus="FocusItem(this)" onblur="CheckItem(this);"/><span></span></td>
                    </tr>
                    <tr>
                        <td class="field">登录密码：</td>
                        <td><input class="text" type="password" id="passWord"
                                   name="passWord" onfocus="FocusItem(this)"
                                   onblur="CheckItem(this);"/><span></span></td>
                    </tr>
                    <tr>
                        <td class="field">验证码：</td>
                        <td><input class="text verycode" type="text" name="veryCode"
                                   onfocus="FocusItem(this)" onblur="Checknum(this);"/><img
                                id="veryCode" alt="看不清,换一张" style="cursor: hand;"
                                src="usernum?<%=new Date().getTime()%>" onclick="change(this)"/><span
                                id="msg"></span></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><label class="ui-green"><input style="background-color: dodgerblue;" type="submit" name="submit" id="sub" value="立即登录"/></label></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    <div class="clear"></div>
</div>
<br><br><br><br><br>
</body>
</html>
