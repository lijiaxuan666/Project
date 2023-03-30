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
<div id="header" >
    <div class="wrap">
        <div class="help">
            <c:if test="${name!=null}">
                <a href="selectdd?dd=${name.EU_USER_ID }">个人订单</a>
            </c:if>
            <c:if test="${name!=null}">用户: ${name.EU_USER_ID }</c:if>
            <a href="ShopSelect"><img style="margin-bottom: 5px" src="./images/购物车.png"/>购物车</a>
            <c:if test="${name==null}">
                <a href="login.jsp">登录</a>|<a href="register.jsp">注册</a>
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
<div id="main" class="wrap">

    <div class="main">
        <div class="price-off">
            <h1 style="border-bottom: 2px solid #070707;">个人订单</h1>
            <c:if test="${not empty dan}">
                <table style="font-size: 20px" border="1" width="960px" height="100px" bordercolor="black">
                    <tr align="center">
                        <td class="field">订单号</td>
                        <td class="field">用户ID</td>
                        <td class="field">商品名称</td>
                        <td class="field">商品图片</td>
                        <td class="field">商品价格</td>
                        <td class="field">购买数量</td>
                        <td class="field">商品库存</td>
                    </tr>
                    <c:forEach var="d" items="${dan}">
                        <tr align="center">
                            <td>${d.EO_ID }</td>
                            <td>${d.EO_USER_ID }</td>
                            <td>${d.EP_NAME }</td>
                            <td><img src="images/product/${d.EP_FILE_NAME }"
                                     height="100" width="100"/></td>
                            <td>${d.EP_PRICE }</td>
                            <td>${d.EOD_QUANTITY }</td>
                            <td>${d.EP_STOCK }</td>
                        </tr>
                    </c:forEach>
                </table>
            </c:if>
            <c:if test=" ${dan==null}">
                <a href="indexSelect">去购买</a>
            </c:if>
        </div>

    </div>
</div>
</body>
</html>
