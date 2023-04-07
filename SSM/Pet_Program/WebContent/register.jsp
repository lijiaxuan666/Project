<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>注册</title>
    <link rel="stylesheet" href="css/denlu.css">
    <link rel="stylesheet" href="css/all.css">
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/zhuce.js"></script>
</head>
<body>
<div class="daohang">
    <div>
        <img src="images/logo.png" alt="宠物计划">

        <span>宠物计划，全面关爱宠物生活</span>
    </div>
</div>
<div class="zhong">
    <div>
        <img src="images/img5.png" alt="">
        <table>
            <tr>
                <td></td>
                <td><h1>注册</h1></td>
            </tr>
            <tr>
                <td class="mingcheng">用户名</td>
                <td><input type="text" id="userName" class="kuang"></td>
                <td><span></span></td><!-- 文本提示（提示文字） -->
            </tr>
            <tr>
                <td class="mingcheng">密码</td>
                <td><input type="password" id="password" class="kuang"></td>
                <td><span></span></td><!-- 文本提示（提示文字） -->
            </tr>
            <tr>
                <td class="mingcheng">确认密码</td>
                <td><input type="password" id="rePassWord" class="kuang"></td>
                <td><span></span></td><!-- 文本提示（提示文字） -->
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="注册" class="anniu" onclick="register()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="取消" class="anniu"></td>
            </tr>
            <tr>
                <td></td>
                <!-- 连接“#”换成注册界面地址 -->
                <td><a href="index.jsp">已有账号？立即登录</a></td>
            </tr>
        </table>
    </div>
</div>
<script type="text/javascript">
    function register(){
        let userName = document.getElementById("userName").value;
        let password = document.getElementById("password").value;
        let rePassWord = document.getElementById("rePassWord").value;
        if(password === rePassWord)
            location.href="register?userName="+ userName +"&password="+ password;
        else
            alert("两次输入的密码不同")
    }
</script>
</body>
</html>
