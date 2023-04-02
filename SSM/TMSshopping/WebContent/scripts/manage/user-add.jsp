<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>后台管理-商城</title>
    <link type="text/css" rel="stylesheet" href="../../css/style.css"/>
    <link type="text/css" rel="stylesheet" href="../../css/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="../../css/bootstrap-theme.min.css"/>
    <link type="text/css" rel="stylesheet" href="../../css/bootstrap-theme.css"/>
    <link type="text/css" rel="stylesheet" href="../../css/bootstrap.css"/>
    <link href="../../css/materialdesignicons.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../../css/multitabs.min.css">
    <link href="../../css/style.min.css" rel="stylesheet">
    <script type="text/javascript" src="../function-manage.js"></script>
    <script type="text/javascript" src="../calendar.js"></script>
    <script type="text/javascript" src="../npm.js"></script>
    <script type="text/javascript">
        function checkusername() {
            var username = document.getElementById("userName").value;
            if (username == "") {
                document.getElementById("sp").innerHTML = "<font color='red'>用户名不能为空</font>";
                document.getElementById("sb").disabled = true;
            } else {
                document.getElementById("sp").innerHTML = "";
                document.getElementById("sb").disabled = false;
            }
        }

        function checkname() {
            var name1 = document.getElementById("name").value;
            if (name1 == "") {
                document.getElementById("sn").innerHTML = "<font color='red'>姓名不能为空</font>";
                document.getElementById("sb").disabled = true;
            } else {
                document.getElementById("sn").innerHTML = "";
                document.getElementById("sb").disabled = false;
            }

        }

        function checkpwd() {
            var passWord = document.getElementById("passWord").value;
            if (passWord == "") {
                document.getElementById("spwd").innerHTML = "<font color='red'>密码不能为空</font>";
                document.getElementById("sb").disabled = true;
            } else {
                document.getElementById("spwd").innerHTML = "";
                document.getElementById("sb").disabled = false;
            }
        }

        function checkbirthday() {
            var birthday = document.getElementById("birthday").value;
            if (birthday == "") {
                document.getElementById("sbb").innerHTML = "<font color='red'>生日不能为空</font>";
                document.getElementById("sb").disabled = true;
            } else {
                document.getElementById("sbb").innerHTML = "";
                document.getElementById("sb").disabled = false;
            }
        }

        function checkemail() {
            var email = document.getElementById("email").value;
            if (email == "") {
                document.getElementById("se").innerHTML = "<font color='red'>邮箱不能为空</font>";
                document.getElementById("sb").disabled = true;
            } else {
                document.getElementById("se").innerHTML = "";
                document.getElementById("sb").disabled = false;
            }
        }

        function checkmobile() {
            var mobile = document.getElementById("mobile").value;
            if (mobile == "") {
                document.getElementById("sphone").innerHTML = "<font color='red'>电话不能为空</font>";
                document.getElementById("sb").disabled = true;
            } else {
                document.getElementById("sphone").innerHTML = "";
                document.getElementById("sb").disabled = false;
            }
        }

        function checkaddress() {
            var address = document.getElementById("address").value;
            if (address == "") {
                document.getElementById("sadd").innerHTML = "<font color='red'>地址不能为空</font>";
                document.getElementById("sb").disabled = true;
            } else {
                document.getElementById("sadd").innerHTML = "";
                document.getElementById("sb").disabled = false;
            }
        }
    </script>
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
                                <li><a class="multitabs" href="productClassAdd">新增</a></li>
                                <li><a class="multitabs" href="productSelect">分类管理</a></li>
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
    <h2>新增用户</h2>
    <div class="manage">
        <form action="useradd">
            <table class="form">
                <tr>
                    <td class="field">用户名：</td>
                    <td><input type="text" class="text" name="userName"
                               onblur="check(this.value),checkusername()" id="userName"/><span
                            id="sp"></span></td>
                </tr>
                <tr>
                    <td class="field">用户类型：</td>
                    <td><select class="text" name="name"
                                onblur="checkname()" id="name">
                        <option>请选择</option>
                        <option>管理员</option>
                        <option>普通用户</option>
                    </select>
                        <span id="sn"></span></td>
                </tr>
                <tr>
                    <td class="field">密码：</td>
                    <td><input type="text" class="text" name="passWord" value=""
                               onblur="checkpwd()" id="passWord"/><span id="spwd"></span></td>
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
                               onfocus="c.showMoreDay = false;c.show(this);"
                               onblur="checkbirthday()" id="birthday"/><span id="sbb"></span>
                    </td>
                </tr>
                <tr>
                    <td class="field">邮箱：</td>
                    <td><input type="text" class="text" name="email" value=""
                               onblur="checkemail()" id="email"/><span id="se"></span></td>
                </tr>
                <tr>
                    <td class="field">手机号码：</td>
                    <td><input type="text" class="text" name="mobile" value=""
                               onblur="checkmobile()" id="mobile"/><span id="sphone"></span></td>
                </tr>
                <tr>
                    <td class="field">送货地址：</td>
                    <td><input type="text" class="text" name="address" value=""
                               onblur="checkaddress()" id="address"/><span id="sadd"></span></td>
                </tr>
                <tr>
                    <td></td>
                    <td><label class="ui-blue"><input type="submit"
                                                      name="submit" disabled=true id="sb" value="添加"/></label></td>
                </tr>
            </table>
        </form>
    </div>
</div>
<div class="clear"></div>
</div>
<script type="text/javascript" src="../jquery.min.js"></script>
<script type="text/javascript" src="../bootstrap.min.js"></script>
<script type="text/javascript" src="../perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="../scripts/bootstrap-multitabs/multitabs.js"></script>
<script type="text/javascript" src="../index.min.js"></script>
<script type="text/javascript">
    window.onload = function () {
        $('.dropdown-toggle').dropdown();
    }
</script>
</body>

</html>

