<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>" />
    <meta charset="UTF-8">
    <title>学生信息管理系统</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="layuimini/lib/layui-v2.6.3/css/layui.css" media="all">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="layuimini/lib/layui-v2.6.3/css/layui.css" media="all">
    <link rel="stylesheet" href="layuimini/css/public.css" media="all">
    <script src="layuimini/lib/jquery-3.4.1/jquery-3.4.1.min.js" charset="utf-8"></script>
    <script src="layuimini/lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
    <script src="layuimini/lib/jq-module/jquery.particleground.min.js" charset="utf-8"></script>
    <script src="lib/jquery.cookie.js" charset="utf-8"></script>
    <script src="lib/jquery.base64.js" charset="utf-8"></script>

    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <style>
        html, body {width: 100%;height: 100%;overflow: hidden}
        /*body {background: #1E9FFF;}*/
        body{background: url("http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/20211012164441.jpg");background-size: 100%;}
        body:after {content:'';background-repeat:no-repeat;background-size:cover;-webkit-filter:blur(3px);-moz-filter:blur(3px);-o-filter:blur(3px);-ms-filter:blur(3px);filter:blur(3px);position:absolute;top:0;left:0;right:0;bottom:0;z-index:-1;}
        .layui-container {width: 100%;height: 100%;overflow: hidden}
        .admin-login-background {width:360px;height:300px;position:absolute;left:50%;top:40%;margin-left:-180px;margin-top:-100px;}
        .logo-title {text-align:center;letter-spacing:2px;padding:14px 0;}
        .logo-title h1 {color:#1E9FFF;font-size:25px;font-weight:bold;}
        .login-form {background-color:#fff;border:1px solid #fff;border-radius:3px;padding:14px 20px;box-shadow:0 0 8px #eeeeee;}
        .login-form .layui-form-item {position:relative;}
        .login-form .layui-form-item label {position:absolute;left:1px;top:1px;width:38px;line-height:36px;text-align:center;color:#d2d2d2;}
        .login-form .layui-form-item input {padding-left:36px;}
        .captcha {width:60%;display:inline-block;}
        .captcha-img {display:inline-block;width:34%;float:right;}
        .captcha-img img {height:34px;border:1px solid #e6e6e6;height:36px;width:100%;}
    </style>
</head>
<body>
<div class="layui-container">
    <div class="admin-login-background">
        <div class="layui-form login-form">
            <form class="layui-form" action="" lay-filter="loginForm">
                <div class="layui-form-item logo-title">
                    <h1>学生信息管理系统登录</h1>
                </div>
                <%--用户名--%>
                <div class="layui-form-item">
                    <label class="layui-icon layui-icon-username" for="username"></label>
                    <input type="text" id="username" name="username" lay-verify="required|account" placeholder="请输入学生、教师、管理员用户名" autocomplete="off" class="layui-input" value="">
                </div>
                <%--密码--%>
                <div class="layui-form-item">
                    <label class="layui-icon layui-icon-password" for="password"></label>
                    <input type="password" id="password" name="password" lay-verify="required|password" placeholder="请输入密码" autocomplete="off" class="layui-input" value="">
                </div>
                <%--权限authority--%>
                <div class="layui-form-item">
                    <label class="layui-icon layui-icon-password" for="authority"></label>
                    <select name="authority" id="authority">
                        <option value="manager" selected="selected">管理员</option>
                        <option value="teacher">老师</option>
                        <option value="student">学生</option>
                    </select>
                </div>
                <div class="layui-form-item">
                    <button class="layui-btn layui-btn layui-btn-normal layui-btn-fluid" lay-submit="" lay-filter="login">登 入</button>
                </div>
            </form>
            <div class="layuimini-container">
                <!--头部工具栏-->
                <script type="text/html" id="toolbarDemo">
                    <button class="layui-btn layui-btn layui-btn-normal layui-btn-fluid" lay-event="add"> 没有账号？去注册 </button>
                </script>
                <!--表格容器-->
                <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>
            </div>
        </div>
    </div>
</div>


<div class="site-text" style="margin: 5%; display: none" id="edit_window">
    <div class="layui-form" style="width: 400px; float: left" lay-filter="editForm">
        <!--隐藏域，sid-->
        <input type="hidden" id="sid" name="sid" class="layui-input" value="null">
        <!--隐藏域，pic（头像地址）-->
        <input type="hidden" id="pic" name="pic" class="layui-input" value="null">
        <!--姓名-->
        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-block">
                <input type="text" id="sname" name="sname" value="" lay-verify="required" lay-reqtext="姓名不能为空" placeholder="请输入姓名" class="layui-input">
            </div>
        </div>
        <!--学号-->
        <div class="layui-form-item">
            <label class="layui-form-label">学号</label>
            <div class="layui-input-block">
                <input type="number" id="snum" name="snum" value="" lay-verify="required" lay-reqtext="学号不能为空" placeholder="请输入学号" class="layui-input">
            </div>
        </div>
        <!--性别-->
        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block">
                <input type="radio" name="ssex" value="男" title="男" checked="checked">
                <input type="radio" name="ssex" value="女" title="女">
            </div>
        </div>
        <!--年龄-->
        <div class="layui-form-item">
            <label class="layui-form-label">年龄</label>
            <div class="layui-input-block">
                <input type="number" id="sage" name="sage" value="" placeholder="请输入年龄" class="layui-input">
            </div>
        </div>
        <!--班级-->
        <div class="layui-form-item">
            <label class="layui-form-label">所属班级</label>
            <div class="layui-input-block">
                <select name="cid" id="edit_cid" lay-search="">
                    <option value="1">19小教1班</option>
                    <option value="2">20小教1班</option>
                    <option value="3">19学前1班</option>
                    <option value="4">20学前1班</option>
                    <option value="5">19计科1班</option>
                    <option value="6">19计科2班</option>
                    <option value="7">20计科1班</option>
                    <option value="8">20计科2班</option>
                    <option value="9">19数学1班</option>
                    <option value="10">19数学2班</option>
                    <option value="11">20数学1班</option>
                    <option value="12">19物联网1班</option>
                    <option value="13">20物联网1班</option>
                    <option value="14">19汉语言1班</option>
                    <option value="15">20汉语言1班</option>
                    <option value="16">20汉语言2班</option>
                    <option value="17">19英语1班</option>
                    <option value="18">20英语1班</option>
                </select>
            </div>
        </div>
        <!--状态-->
        <div class="layui-form-item">
            <label class="layui-form-label">状态</label>
            <div class="layui-input-block">
                <input type="text" id="sstatus" name="sstatus" value="" placeholder="请输入状态" class="layui-input">
            </div>
        </div>
        <!--备注-->
        <div class="layui-form-item">
            <label class="layui-form-label">备注</label>
            <div class="layui-input-block">
                <input type="text" id="sremark" name="sremark" value="" placeholder="请输入备注" class="layui-input">
            </div>
        </div>
        <!--身份证-->
        <div class="layui-form-item">
            <label class="layui-form-label">身份证号</label>
            <div class="layui-input-block">
                <input type="number" id="idcard" name="idcard" value="" placeholder="请输入身份证号" class="layui-input" onblur="checkIdCard(this.value)">
                <span id="idcardspan" style="color: red"></span>
            </div>
        </div>
        <!--手机号码-->
        <div class="layui-form-item">
            <label class="layui-form-label">手机号码</label>
            <div class="layui-input-block">
                <input type="number" id="phone" name="phone" value="" placeholder="请输入手机号码" class="layui-input" onblur="checkPhone(this.value)">
                <span id="mobilespan" style="color: red"></span>
            </div>
        </div>
        <!--地址-->
        <div class="layui-form-item">
            <label class="layui-form-label">家庭地址</label>
            <div class="layui-input-block">
                <input type="text" id="address" name="address" value="" placeholder="请输入家庭地址" class="layui-input">
            </div>
        </div>
        <!--入学时间-->
        <div class="layui-form-item">
            <label class="layui-form-label">入学时间</label>
            <div class="layui-input-block">
                <input type="text" id="entime" name="entime" value="" lay-verify="date" placeholder="请选择入学时间" class="layui-input">
            </div>
        </div>
        <!--登录密码-->
        <div class="layui-form-item">
            <label class="layui-form-label">登录密码</label>
            <div class="layui-input-block">
                <input type="text" id="pswd" name="pswd" value="" placeholder="请输入登录密码" class="layui-input">
            </div>
        </div>
    </div>

    <div style="float:right;">
        <p>上传头像</p>
        <div style="margin-top: 20px"></div>
        <div class="layui-upload">
            <button type="button" class="layui-btn" id="test1">上传图片</button>
            <div class="layui-upload-list">
                <img width="200px" class="layui-upload-img" id="demo1" />
                <p id="demoText"></p>
            </div>
            <div style="width: 95px">
                <div class="layui-progress layui-progress-big"
                     lay-showpercent="yes"
                     lay-filter="demo">
                    <div class="layui-progress-bar" lay-percent=""></div>
                </div>
            </div>
        </div>
    </div>

</div>
<script>
    function checkIdCard(value){
        //1. 声明一个正则表达式：
        var reg = /^[1-9]\d{16}[0-9X]$/
        //2. 使用正则表达式校验手机号
        if (!reg.test(value)) {
            //校验不通过
            //找到手机号输入框后面的span
            var element = document.getElementById("idcardspan");
            //设置span中的内容为手机号格式不正确
            element.innerHTML = "身份证号格式不正确"
        }else{
            var element = document.getElementById("idcardspan");
            element.innerHTML = ""
        }
    }
    function checkPhone(value){
        //1. 声明一个正则表达式：以1开头, 第二位是3,4,5,7,8的11位数字
        var reg = /^[1][34578][0-9]{9}$/
        //2. 使用正则表达式校验手机号
        if (!reg.test(value)) {
            //校验不通过
            //找到手机号输入框后面的span
            var element = document.getElementById("mobilespan");
            //设置span中的内容为手机号格式不正确
            element.innerHTML = "手机号格式不正确"
        }else{
            var element = document.getElementById("mobilespan");
            element.innerHTML = ""
        }
    }
    layui.use(['form', 'table','laydate', "upload", "element", "layer"], function () {
        var $ = layui.jquery,
            form = layui.form,
            table = layui.table,
            date = layui.laydate,
            upload = layui.upload,
            element = layui.element,
            layer = layui.layer;

        //上传图片
        var uploadInst = upload.render({
            elem: "#test1",
            url: "upload/uploadImg.do", // 自己的上传接口
            before: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    console.log(result);
                    $("#demo1").attr("src", result); //图片链接（base64）
                });

                element.progress("demo", "0%"); //进度条复位
                layer.msg("上传中", { icon: 16, time: 0 });
            },
            done: function (res) {
                //如果上传失败
                if (res.code > 0) {
                    return layer.msg("上传失败");
                }
                //上传成功的一些操作
                //把地址写到表单的隐藏域中
                $("#pic").val(res.data.src);
                //图片链接替换
                $("#demo1").attr("src", res.data.src);
                //置空上传失败的状态
                $("#demoText").html("");
            },
            error: function () {
                //演示失败状态，并实现重传
                var demoText = $("#demoText");
                demoText.html(
                    '<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>'
                );
                demoText.find(".demo-reload").on("click", function () {
                    uploadInst.upload();
                });
            },
            //进度条
            progress: function (n, elem, e) {
                element.progress("demo", n + "%"); //可配合 layui 进度条元素使用
                if (n == 100) {
                    layer.msg("上传完毕", { icon: 1 });
                }
            },
        });

        //加载数据表格
        table.render({
            elem: '#currentTableId',
            toolbar: '#toolbarDemo',
            defaultToolbar: [],
            cols: [],
        });

        //toolbar监听事件
        table.on('toolbar(currentTableFilter)', function (obj) {
            if (obj.event === 'add') {  // 监听添加操作
                layer.open({
                    title:"注册信息",
                    type: 1,
                    maxmin:true,
                    shadeClose: true,
                    area:['800px','90%'],
                    btn: ['注册', '取消'],
                    content: $("#edit_window"),
                    success: function () {  //弹出框成功回调
                        $("#demo1").attr("src", "http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/20211010200811.jpg");
                    },
                    yes: function(index,layero){ //确认的回调
                        layer.close(index); //关闭弹出框
                        var mdata = form.val('editForm');
                        console.log(mdata);
                        //向服务器请求
                        $.ajax({
                            url: 'student/addStudent.do',
                            data: {json:JSON.stringify(mdata)},
                            type: 'post',
                            datatype: 'json',
                            success: function (res) {
                                layer.message("注册成功！！！");
                            }
                        });

                    }
                });
            }
        });
    });

    //点击验证码
    $("#code_pic").click(function () {
        this.src = "kaptcha.jpg?d=" + new Date().getTime();
    });


    layui.use(['form', 'table'], function () {
        var form = layui.form,
            layer = layui.layer;

        var username = $.cookie("username");
        var password = $.cookie("password");
        var authority = $.cookie("authority");
        var rememberMe = $.cookie("rememberMe");

        console.log(username);
        console.log(password);
        console.log(authority);
        console.log(rememberMe);

        if(password !== undefined) password = $.base64.decode(password);

        // 登录过期的时候，跳出ifram框架
        if (top.location != self.location) top.location = self.location;

        // 进行登录操作
        form.on('submit(login)', function (data) {
            data = data.field;
            console.log(data);
            if (data.username === '') {
                layer.msg('用户名不能为空',{time:1000});
                return false;
            } else if (data.password === '') {
                layer.msg('密码不能为空',{time:1000});
                return false;
            }

            $.ajax({
                url: "login/login.do",
                data: {
                    'username':data.username,
                    'password':data.password,
                    'authority':data.authority,
                    'captcha':data.captcha
                },
                type: 'post',
                datatype: 'json',
                success: function (res) {
                    /*
                    * return: 0验证码错误，1账号密码错误，2成功
                    * */
                    switch (res) {
                        case 1:
                            layer.msg("账号或密码错误!",{time:1000});
                            $("#code_pic").prop("src","kaptcha.jpg?d=" + new Date().getTime());
                            break;
                        case 2: //登录成功

                            if(data.rememberMe == "true") {   //记住密码了
                                //设置cookie的过期时间7天
                                var date = new Date();
                                date.setTime(date.getTime() + 1000*60*60*24*7);
                                //设置cookie
                                $.cookie("username",data.username,{ expires: date, path: '/' });
                                $.cookie("password",$.base64.encode(data.password),{ expires: date, path: '/' });
                                $.cookie("authority",data.authority,{ expires: date, path: '/' });
                                $.cookie("rememberMe",data.rememberMe,{ expires: date, path: '/' });
                            } else {    //没有记住密码
                                //清空cookie
                                $.removeCookie("username", { path: '/' });
                                $.removeCookie("password", { path: '/' });
                                $.removeCookie("authority", { path: '/' });
                                $.removeCookie("rememberMe", { path: '/' });
                            }

                            layer.msg("登录成功",{time:1000},function () {
                                if(data.authority === "manager") {
                                    location.href="manager/manager_index.jsp";
                                }else if(data.authority === "teacher") {
                                    location.href="teacher/teacher_index.jsp";
                                }else if(data.authority === "student") {
                                    location.href="student/student_index.jsp";
                                }
                            });
                            break;
                    }
                }
            });
            return false;
        });
    });
</script>
</body>
</html>
