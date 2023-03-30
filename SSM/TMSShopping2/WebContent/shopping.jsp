<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>

<%@page import="com.bean.eb_shop" %>
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
<div id="position" class="wrap">
    您现在的位置：<a href="index.jsp">商城</a> &gt; 购物车
</div>
<div class="wrap">
    <div id="shopping">
        <form action="./shopping-result.jsp">

            <table>
                <tr>
                    <th>商品名称</th>
                    <th>商品价格</th>
                    <th>购买数量</th>
                    <th>操作</th>
                </tr>
                <c:forEach var="rs" items="${requestScope.shoplist}">

                    <tr id="product_id_1">
                        <td class="thumb"><input style="width: 20px;height: 20px" type="checkbox" name="op"
                                                 onclick="dxcheck()"/><img
                                src="images/product/${rs.es_ep_file_name }" height="100"
                                width="100"/><input style="font-size: 18px;background-color: wheat;border-style:none" name="sid" readonly="readonly"
                                                    value="${rs.es_ep_name }"/></td>
                        <td class="price" id="price_id_1"><span id="priceText"
                                                                name="priceText">${rs.es_ep_price}</span>
                            <!-- 商品单价 -->
                            <input type="hidden" name="sPPrice" value="${rs.es_ep_price}"/>
                            <input type="hidden" value="99"/></td>
                        <td class="number">
                            <dl>
                                <dt>
                                    <input type="button" value="-" onclick="sub(${rs.es_id})"/>
                                    <!-- 购物单id -->
                                    <input type="hidden" name="esID" value="${rs.es_id}"/>
                                    <!-- 商品id -->
                                    <input type="hidden" name="spID" value="${rs.es_ep_id}"/>
                                    <!-- 购买数量 -->
                                    <input id="${rs.es_id}" type="text" name="number"
                                           value="${rs.es_eod_quantity }"
                                           onblur="closeText(id,${rs.es_ep_stock})"/> <input
                                        type="button" value="+"
                                        onclick="plus(${rs.es_id},${rs.es_ep_stock}) "/>
                                </dt>

                            </dl>
                        </td>
                        <td class="delete"><a style="font-size: 18px" href="javascript:del(${rs.es_id});">删除</a></td>
                    </tr>
                </c:forEach>
            </table>
            <input style="width: 20px;height: 20px;" type="checkbox" onclick="qxcheck()" name="op2"/><span style="font-size: 18px;margin-left: 5px">全选</span>
            <div style="font-size: 18px" align="right">
                总价钱:<span id="zdzj">0</span>元
            </div>
            <input type="hidden" name="jstext" id="jstext" value="0"/>
            <div align="center">
                <span style="font-size: 18px" id="xzText">请选择物品！！！</span>
            </div>
            <div class="button">
                <input style="display: none;" type="submit" value="" id="jsbutton"/>
            </div>
        </form>
    </div>

</div>
</body>
</html>
<script>
    function plus(id, stock) {
        var va = document.getElementById(id).value;
        if (va >= stock) {
            return;
        }
        location.href = "UpdateServlet?pid=" + id + "&action=jia";

    }

    function onclick() {
        alter("购买成功！！！");

    }

    function sub(id) {
        var va = document.getElementById(id).value;
        if (va <= 1) {
            return;
        }
        location.href = "UpdateServlet?pid=" + id + "&action=jian";

    }

    function closeText(id, stock) {
        var va = document.getElementById(id).value;
        if (va < 1) {
            alert('您输入的数量不能小于1！！！')
            document.getElementById(id).value = 1;
            va = 1;
        }
        if (va > stock) {
            alert('您输入的数量超出库存！！！');
            document.getElementById(id).value = stock;
            va = stock;
        }
        location.href = "UpdateServlet?pid=" + id + "&getvalue=" + va + "&action=closeText";
    }

    function del(id) {
        if (confirm("确定要删除吗？")) {
            location.href = "UpdateServlet?pid=" + id + "&action=delText";
        }
    }


    var fxi = 0;

    function qxcheck() {

        var op2 = document.getElementsByName("op2");
        var op = document.getElementsByName("op");

        if (fxi == 0) {
            for (var i = 0; i < op.length; i++) {
                op[i].checked = true;
            }
            fxi = 1;
        } else {
            for (var i = 0; i < op.length; i++) {
                op[i].checked = false;
            }
            fxi = 0;
        }
        dxcheck();
    }

    function dxcheck() {
        var sum = 0;
        var op = document.getElementsByName("op");
        var price = document.getElementsByName("priceText");
        var number = document.getElementsByName("number");
        for (var i = 0; i < op.length; i++) {
            if (op[i].checked) {
                sum += parseInt(parseInt(price[i].innerText) * parseInt(number[i].value));
            }
        }

        document.getElementById("zdzj").innerHTML = sum;
        document.getElementById("jstext").value = sum;
        var money = document.getElementById("zdzj").innerText;
        if (money == "0") {
            document.getElementById("jsbutton").style.display = 'none';
            document.getElementById("xzText").hidden = false;
        } else {
            document.getElementById("xzText").hidden = true;
            document.getElementById("jsbutton").style.display = 'inline';
        }
    }

</script>
