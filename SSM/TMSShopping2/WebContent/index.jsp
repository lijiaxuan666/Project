<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>首页</title>
    <link type="text/css" rel="stylesheet" href="css/style.css"/>
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="css/bootstrap-theme.css"/>
    <link type="text/css" rel="stylesheet" href="css/bootstrap-theme.min.css"/>
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
    <script type="text/javascript" src="scripts/function.js"></script>
    <script type="text/javascript" src="scripts/bootstrap.js"></script>
    <script type="text/javascript" src="scripts/bootstrap.min.js"></script>
    <script type="text/javascript" src="scripts/npm.js"></script>
    <%
        if (request.getParameter("name") != null) {
            String str = request.getParameter("url");
            str = java.net.URLDecoder.decode(java.net.URLDecoder.decode(str, "utf-8"), "utf-8");
            out.print(str);
        }

    %>

    <style>
        .scroll_div {
            width: 600px;
            height: 62px;
            margin: 0 auto;
            overflow: hidden;
            white-space: nowrap;
            background: #ffffff;
        }

        .scroll_div img {
            width: 120px;
            height: 60px;
            border: 0;
            margin: auto 8px;
            border: 1px #efefef solid;
        }

        #scroll_begin, #scroll_end, #scroll_begin ul, #scroll_end ul,
        #scroll_begin ul li, #scroll_end ul li {
            display: inline;
        }
    </style>
    <style>
        .scroll_div {
            width: 500px;
            height: 100px;
            margin: 0 auto;
            overflow: hidden;
            white-space: nowrap;
            background: #ffffff;
        }

        .scroll_div img {
            width: 120px;
            height: 100px;
            border: 0;
            margin: auto 8px;
            border: 1px #efefef solid;
        }

        #scroll_begin, #scroll_end, #scroll_begin ul, #scroll_end ul,
        #scroll_begin ul li, #scroll_end ul li {
            display: inline;
        }
    </style>
    <script language="javascript">
        function ScrollImgLeft() {
            var speed = 20
            var scroll_begin = document.getElementById("scroll_begin");
            var scroll_end = document.getElementById("scroll_end");
            var scroll_div = document.getElementById("scroll_div");
            scroll_end.innerHTML = scroll_begin.innerHTML

            function Marquee() {
                if (scroll_end.offsetWidth - scroll_div.scrollLeft <= 0)
                    scroll_div.scrollLeft -= scroll_begin.offsetWidth
                else
                    scroll_div.scrollLeft++
            }

            var MyMar = setInterval(Marquee, speed)
            scroll_div.onmouseover = function () {
                clearInterval(MyMar)
            }
            scroll_div.onmouseout = function () {
                MyMar = setInterval(Marquee, speed)
            }
        }

        function selectname() {
            var name = document.getElementById("selectname").value;
            location.href = 'selectProductList?name=' + name;
        }

        function searchHot(name) {
            location.href = 'selectProductList?name=' + name;
        }
    </script>


</head>
<body style="background-color: wheat">
<div id="header">
    <div class="wrap">
        <div class="help">
            <c:if test="${name!=null}">
                <a href="selectdd?dd=${name.EU_USER_ID }">个人订单</a>
            </c:if>
            <c:if test="${name!=null}">用户: ${name.EU_USER_ID }</c:if>
            <a href="ShopSelect"><img style="margin-bottom: 5px" src="./images/购物车.png"/>购物车</a>
            <c:if test="${name==null}">
                <a href="login.jsp">
                    <span class="glyphicon glyphicon-user">登录</span>
                </a>
                |<a href="register.jsp">注册</a>
            </c:if>
            <c:if test="${name!=null}">
                <a href="zx">退出</a>
            </c:if>
            <c:if test="${name.EU_STATUS==2}">
                <a href="manage/index.jsp">去后台</a>
            </c:if>
        </div>
        <a href="indexSelect">
            <span>首页</span>
        </a>
    </div>
</div>
<div id="childNav" class="wrap">
    <ul class="clearfix">
        <li class="first"><a style="color: black">热门搜索</a></li>
        <li ><a href="javascript:searchHot('瓜子')">瓜子</a></li>
        <li><a href="javascript:searchHot('辣条')">辣条</a></li>
        <li><a href="javascript:searchHot('泡面')">泡面</a></li>
        <li><a href="javascript:searchHot('巧克力')">巧克力</a></li>
        <li><a href="javascript:searchHot('薯片')">薯片</a></li>
        <li><a href="javascript:searchHot('糖果')">糖果</a></li>
        <li><a href="javascript:searchHot('肉脯')">肉</a></li>
        <li class="last"><a href="javascript:searchHot('牛奶')">奶制品</a></li>
        <li style="border: 0"><input style="margin-left: 90px" type="text" id="selectname"
                                     value="${search_words}"/><a style="margin-left: 2px" href="javascript:selectname()">搜索</a></li>
    </ul>
</div>
<div id="main" class="wrap">

    <div class="main">
        <div class="price-off">
            <h2>昨日热销</h2>
            <ul class="product clearfix">
                <c:forEach var="tp" items="${tlist}">
                    <li>
                        <dl>
                            <dt>
                                <a href="selectProductView?id=${tp.EP_ID }" target="_blank"><img
                                        src="images/product/${tp.EP_FILE_NAME }"/></a>
                            </dt>
                            <dd class="title">
                                <a href="selectProductView?id=${tp.EP_ID }" target="_blank">${tp.EP_DESCRIPTION }</a>
                            </dd>
                            <dd class="price">${tp.EP_PRICE }.00</dd>
                        </dl>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <div class="spacer clear"></div>
        <div class="hot">
            <h2>今日推荐</h2>
            <ul class="product clearfix">
                <c:forEach var="hotp" items="${hlist}">
                    <li>
                        <dl>
                            <dt>
                                <a href="selectProductView?id=${hotp.EP_ID }" target="_blank"><img
                                        src="images/product/${hotp.EP_FILE_NAME }"/></a>
                            </dt>
                            <dd class="title">
                                <a href="selectProductView?id=${hotp.EP_ID }" target="_blank">${hotp.EP_DESCRIPTION}</a>
                            </dd>
                            <dd class="price">${hotp.EP_PRICE }.00</dd>
                        </dl>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
    <div class="clear"></div>
</div>
</body>
</html>
