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
                <td><input type="password" id="rePassWord" class="kuang"></td>
                <td><span></span></td><!-- 文本提示（提示文字） -->
            </tr>
            <tr>
                <td>性别</td>
                <td><input type="radio" value="男" class="sex" name="leixing">男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" value="女" class="sex" name="leixing">女
                </td>
            </tr>
            <tr>
                <td>生日</td>
                <td><input type="text" id="birthday" class="kuang"></td>
                <td><span></span></td>
            </tr>
            <tr>
                <td>邮箱</td>
                <td><input type="text" id="email" class="kuang"></td>
                <td><span></span></td>
            </tr>
            <tr>
                <td>手机号</td>
                <td><input type="text" id="mobile" class="kuang"></td>
                <td><span></span></td>
            </tr>
            <tr>
                <td>收货地址</td>
                <td><input type="text" id="address" class="kuang"></td>
                <td><span></span></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="button" value="注册" class="anniu xiaoshou" id="sub" onclick="register()" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="reset" value="取消" class="anniu xiaoshou" id="qx"></td>
            </tr>
            <tr>
                <td></td>
                <!-- 连接“#”换成注册界面地址 -->
                <td><a href="denglu.html">已有账号？立即登录</a></td>
            </tr>
        </table>
    </div>
</div>
<script type="text/javascript">
    function register(){
        let userName = document.getElementById("userName").value;
        let rePassWord = document.getElementById("rePassWord").value;
        let types = document.getElementsByClassName("sex");
        let birthday = document.getElementById("birthday").value;
        let email = document.getElementById("email").value;
        let mobile = document.getElementById("mobile").value;
        let address = document.getElementById("address").value;
        let type;
        for (let i = 0; i < types.length; i++) {
            if(types[i].checked){
                type=types[i].value;
            }
        }
        location.href="register?userName="+ userName +"&rePassWord="+ rePassWord +"&sex="+ type +"&birthday="+ birthday +"&email="+ email+"&mobile="+ mobile +"&address="+ address;
    }
</script>
</body>
</html>
