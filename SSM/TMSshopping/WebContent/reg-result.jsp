<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>商城-首页</title>
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
</head>
<body>
<div id="header" class="wrap">
    <div class="help">
        <c:if test="${name!=null}">
            <a href="selectdd?dd=${name.EU_USER_ID }">个人订单</a>
        </c:if>
        <c:if test="${name!=null}">当前用户${name.EU_USER_ID }</c:if>
        <a href="ShopSelect" class="shopping">购物车</a>
        <c:if test="${name==null}">
            <a href="login.jsp">登录</a>|<a href="register.jsp">注册</a>
        </c:if>
        <c:if test="${name!=null}">
            <a href="zx">退出</a>
        </c:if>
        <a href="SelallServlet">留言</a>
        <c:if test="${name.EU_STATUS==2}">
            <a href="manage/index.jsp">去后台</a>
        </c:if>
    </div>
    <a href="indexSelect">
        <button>首页</button>
    </a>

</div>
<div id="childNav">
    <div class="wrap">
        <ul class="clearfix">
            <li><a>热门搜索</a></li>
            <li class="first"><a href="javascript:searchHot('瓜子')">瓜子</a></li>
            <li><a href="javascript:searchHot('辣条')">辣条</a></li>
            <li><a href="javascript:searchHot('凤爪')">凤爪</a></li>
            <li><a href="javascript:searchHot('泡面')">泡面</a></li>
            <li><a href="javascript:searchHot('巧克力')">巧克力</a></li>
            <li><a href="javascript:searchHot('葡萄干')">葡萄干</a></li>
            <li><a href="javascript:searchHot('薯片')">薯片</a></li>
            <li><a href="javascript:searchHot('糖果')">糖果</a></li>
            <li><a href="javascript:searchHot('肉脯')">肉脯</a></li>
            <li><a href="javascript:searchHot('牛奶')">牛奶</a></li>
            <li><a href="javascript:searchHot('特产')">特产</a></li>
            <li class="last"><input type="text" id="selectname"/><a
                    href="javascript:selectname()">搜索</a></li>
        </ul>
    </div>
</div>
<div id="register" class="wrap">
    <div class="shadow">
        <em class="corner lb"></em> <em class="corner rt"></em>
        <div class="box">
            <h1>欢迎注册-托马斯网上零食商城</h1>
            <div class="msg">
                <p>恭喜：注册成功！</p>
                <p>正在进入首页...</p>
                <script type="text/javascript">
                    setTimeout("location.href='indexSelect'", 3000);
                </script>
            </div>
        </div>
    </div>
</div>
</body>
</html>

