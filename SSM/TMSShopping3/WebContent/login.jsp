<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登录</title>
    <link rel="stylesheet" href="css/denlu.css">
</head>
<body>
<div class="daohang">
    <div>
        <img src="images/logo.png" alt="强盛超市">

        <span>强盛超市，白手起家到世界第一</span>
    </div>
</div>
<div class="zhong">
    <div>
        <img src="images/img4.png" alt="">
        <table>
            <tr>
                <td></td>
                <td><h1>登录</h1></td>
            </tr>
            <tr>
                <td>账号</td>
                <td><input type="text" id="username" class="kuang"></td>
                <td><span></span></td><!-- 文本提示（提示文字） -->
            </tr>
            <tr>
                <td>密码</td>
                <td><input type="password" id="password" class="kuang"></td>
                <td><span></span></td><!-- 文本提示（提示文字） -->
            </tr>
            <tr>
                <td>登录类型</td>
                <td><input type="radio" value="0" class="type"  name="leixing">用户登录&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" value="1" class="type" name="leixing">管理员登录</td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="登录" class="anniu" onclick="login()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="取消" class="anniu"></td>
            </tr>
            <tr>
                <td></td>
                <!-- 连接“#”换成注册界面地址 -->
                <td><a href="register.jsp">没有账号，立即注册</a></td>
            </tr>
        </table>
    </div>
</div>
<script type="text/javascript">
    function login(){
        var userName = document.getElementById("username").value;
        var passWord = document.getElementById("password").value;
        var types = document.getElementsByClassName("type");
        let type;
        for (let i = 0; i < types.length; i++) {
            if(types[i].checked){
                type=types[i].value;
            }
        }
        location.href="login?userName="+ userName +"&passWord="+ passWord +"&type="+ type;
    }
</script>
</body>
</html>
