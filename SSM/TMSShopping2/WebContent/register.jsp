<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <script type="text/javascript" src="scripts/calendar.js"></script>
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
            background-size: 100% 100%;
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
<div id="register" class="wrap">
    <div class="shadow">
        <em class="corner lb"></em> <em class="corner rt"></em>
        <div class="box">
            <h1 style="text-align: center">欢迎注册-好又多零食超市</h1>
            <form id="regForm" method="post" action="register"
                  onsubmit="return checkForm(this);">
                <table>
                    <tr>
                        <td class="field">用户名：</td>
                        <td><input class="text" type="text" name="userName"
                                   onfocus="FocusItem(this)"
                                   onblur="CheckItem(this),check(this.value);" placeholder="请填写用户名"/><span
                                id="sp"></span></td>
                    </tr>
                    <tr>
                        <td class="field">用户类型：</td>
                        <td><input style="border: 0px;outline:none;" type="text" class="text" name="name" value="普通用户"
                                   readonly="readonly"/></td>
                    </tr>
                    <tr>
                        <td class="field">登录密码：</td>
                        <td><input class="text" type="password" id="passWord"
                                   name="passWord" onfocus="FocusItem(this)"
                                   onblur="CheckItem(this);" placeholder="请填写登录密码"/><span></span></td>
                    </tr>
                    <tr>
                        <td class="field">确认密码：</td>
                        <td><input class="text" type="password" name="rePassWord"
                                   onfocus="FocusItem(this)" onblur="CheckItem(this);"
                                   placeholder="请确认密码"/><span></span></td>
                    </tr>
                    <tr>
                        <td class="field">性别：</td>
                        <td><input type="radio" name="sex" value="男"
                                   checked="checked"/>男 <input type="radio" name="sex" value="女"/>女
                        </td>
                    </tr>
                    <tr>
                        <td class="field">出生日期：</td>
                        <td><input type="text" name="birthday"
                                   onfocus="c.showMoreDay = false;c.show(this);" placeholder="请选择出生日期"/></td>
                    </tr>
                    <tr>
                        <td class="field">邮箱：</td>
                        <td><input type="text" class="text" name="email" value="" placeholder="请填写正确的邮箱地址"/></td>
                    </tr>
                    <tr>
                        <td class="field">手机号码：</td>
                        <td><input type="text" class="text" name="mobile" value="" placeholder="请填写11位手机号"/></td>
                    </tr>
                    <tr>
                        <td class="field">送货地址：</td>
                        <td><input type="text" class="text" name="address" value="" placeholder="请填写正确的送货地址"/></td>
                    </tr>
                    <tr>
                        <td class="field">验证码：</td>
                        <td><input class="text verycode" type="text" name="veryCode"
                                   onfocus="FocusItem(this)" onblur="Checknum(this);" placeholder="如看不清，请点击图片"/><img
                                id="veryCode" alt="看不清,换一张" style="cursor: hand;"
                                src="usernum?<%=new Date().getTime()%>" onclick="change(this)"/><span
                                id="msg"></span></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><label class="ui-green"><input style="background-color: dodgerblue;" type="submit"
                                                           name="submit" disabled=true id="sub" value="提交注册"/></label>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    <div class="clear"></div>
</div>
</body>
</html>
