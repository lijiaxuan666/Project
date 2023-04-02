<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>首页</title>
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
    <%
        if (request.getParameter("name") != null) {
            String str = request.getParameter("url");
            str = java.net.URLDecoder.decode(java.net.URLDecoder.decode(str, "utf-8"), "utf-8");
            out.print(str);
        }

    %>

    <style>
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
<body >
<div class="daohang">
    <div>
        <img src="images/logo.png" alt="宠物计划">
        <ul>
            <li ><a href="indexSelect">首页</a></li>
            <li ><a href="login.jsp">登录</a></li>
            <li ><a href="manage/index.jsp">去后台</a></li>
            <li ><a href="selectdd?dd=${name.EU_USER_ID }">个人订单</a></li>
            <li ><a href="ShopSelect">购物车</a></li>
        </ul>
    </div>
</div>

<div class="daohang">
    <div>
        <ul>
            <li class="first"><a style="color: black">热门搜索</a></li>
            <li ><a href="javascript:searchHot('瓜子')">瓜子</a></li>
            <li><a href="javascript:searchHot('辣条')">辣条</a></li>
            <li><a href="javascript:searchHot('泡面')">泡面</a></li>
            <li><a href="javascript:searchHot('巧克力')">巧克力</a></li>
            <li><a href="javascript:searchHot('薯片')">薯片</a></li>
            <li><a href="javascript:searchHot('糖果')">糖果</a></li>
            <li><a href="javascript:searchHot('肉脯')">肉</a></li>
            <li class="last"><a href="javascript:searchHot('牛奶')">牛奶</a></li>
            <li style="border: 0"><input style="margin-left: 90px" type="text" id="selectname"
                                         value="${search_words}"/><a style="margin-left: 2px" href="javascript:selectname()">搜索</a></li>
        </ul>
    </div>
</div>

<div id="main" class="wrap">

    <div class="main">
        <div class="price-off">
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
    </div>
    <div class="clear"></div>
</div>
</body>
</html>
