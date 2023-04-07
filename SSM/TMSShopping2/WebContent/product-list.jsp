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
    <script type="text/javascript">
        function jump(p) {
            location.href = 'selectProductList?cp=' + p;
        }
    </script>
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
<body style="background-color: wheat">
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
<div id="position" class="wrap">
    您现在的位置：<a href="indexSelect">商城</a> &gt; <a href="selectProductList">商品分类</a>
    &gt; ${title }
</div>
<div id="main" class="wrap">
    <div class="lefter">
    </div>
    <div class="main">
        <div class="product-list">
            <h2>${title }</h2>
            <div class="pager">
            </div>
            <div class="clear"></div>
            <ul class="product clearfix">
                <c:forEach var="p" items="${list}">
                    <li>
                        <dl>
                            <dt>
                                <a href="selectProductView?id=${p.EP_ID }" target="_blank"><img
                                        src="images/product/${p.EP_FILE_NAME }"/></a>
                            </dt>
                            <dd class="title">
                                <a href="selectProductView?id=${p.EP_ID }" target="_blank">${p.EP_NAME }</a>
                            </dd>
                            <dd class="price">￥${p.EP_PRICE }.00</dd>
                        </dl>
                    </li>
                </c:forEach>

            </ul>
            <div class="clear"></div>
            <div class="pager">
                <ul class="clearfix">
                    <li style="position: relative;top: 7px;">当前:${cpage}/${tpage }页</li>
                    <li><a href="selectProductList?cp=1">首页</a></li>
                    <li><a
                            href="selectProductList?cp=${cpage-1<=0 ? 1 : cpage-1 }">上一页</a></li>
                    <li><a
                            href="selectProductList?cp=${cpage+1>=tpage ? tpage : cpage+1 }">下一页</a></li>
                    <li><a href="selectProductList?cp=${tpage }">尾页</a></li>
                    <li style="position: relative;top: 7px;"><select onchange="jump(this.value)">
                        <c:forEach var="i" begin="1" end="${tpage}">
                            <option ${i==cpage ? "selected" : "" } value="${i}">${i }页</option>
                        </c:forEach>
                    </select></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="clear"></div>
</div>
</body>
</html>
