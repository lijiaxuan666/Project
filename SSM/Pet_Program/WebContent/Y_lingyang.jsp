<%--
  Created by IntelliJ IDEA.
  User: Lee
  Date: 2023/4/2
  Time: 21:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>宠物计划</title>
    <link rel="stylesheet" href="css/lingyang.css">
    <link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/Y_daohang.js"></script>
    <script src="js/lingyang.js"></script>
</head>
<body>
<div class="daohang">
    <div>
        <img src="images/logo.png" alt="宠物计划">
        <ul>
            <li onclick="shouye()">首页</li>
            <li onclick="window.location.href='userSelectTieZi?type=全部&kind=全部&index=领养'">领养</li>
            <li onclick="window.location.href='userSelectTieZi?type=全部&kind=全部&index=寻宠'">寻宠</li>
            <li  onclick="baike()">宠物百科</li>
            <li  onclick="window.location.href='selectTieZiByUser?type=全部&kind=全部'">个人中心</li>
            <li onclick="window.location.href='selectXiaoXi'">消息提醒</li>
        </ul>
    </div>
</div>
<div class="tupian">
    <img src="images/img161.png" alt="">
</div>
<div class="citiao">
    <dl>
        <dt><img src="images/zhua.png" alt=""></dt>
        <dd>——————— 分类搜索 ———————</dd>
        <dd>Categorical search</dd>
    </dl>
</div>
<div class="zhonglei">
    <ul>
        <span>种类：</span>
        <li onclick="selectByKind('狗狗')">狗狗</li>
        <li onclick="selectByKind('猫咪')">猫咪</li>
    </ul>
</div>
<div class="zhonglei2">
    <ul>
        <span>供求：</span>
        <li onclick="selectByType('领养')">领养</li>
        <li onclick="selectByType('送养')">送养</li>
    </ul>
</div>
<div class="sousuo">
    <div>
        <p ><a href="Y_fabulingyang.jsp">发布信息</a></p>
        <div class="wrap">
            <div class="search">
                <input type="text" class="searchTerm" id="like" placeholder="请输入您要搜索的宠物">
                <button type="submit" class="searchButton" onclick="like()">
                    <i class="fa fa-search"></i>
                </button>
            </div>
        </div>
    </div>
</div>
<div class="xinxi">
    <c:forEach var="d" items="${list}">
    <div>
        <div>
            <img src="images/${d.imag}" alt="">
        </div>
        <div>
            <table>
                    <tr>
                        <td><span>宠物信息</span></td>
                        <td class="you"><c:if test="${d.status2=='未领养'}"><button type="button" onclick="select('${d.tid}','${d.user}')"></c:if>
                            <c:if test="${d.status2=='已领养'}"><button type="button" disabled="disabled"></c:if>
                                ${d.status2}</button></td>
                    </tr>
                    <tr>
                        <td>品种：${d.kind}</td>
                        <td class="you">${d.time}</td>
                    </tr>
                    <tr>
                        <td>类型：${d.type}</td>
                    </tr>
                    <tr>
                        <td>联系方式：${d.phone}</td>
                    </tr>
                    <tr>
                        <td>宠物描述：${d.title}</td>
                    </tr>
            </table>
        </div>
    </div>
    </c:forEach>
</div>
<script>
    function like() {
        let key=document.getElementById("like").value;
        window.location.href='userSelectTieZi?like=like&index=领养&key='+key;
    }
    function select(id,user) {
        localStorage.setItem("id",id);
        localStorage.setItem("user",user);
        window.location.href='Y_dianjilingyang.html';
    }
    function selectByType(type){
        window.location.href='userSelectTieZi?type='+type+'&index=领养';
    }
    function selectByKind(kind){
        window.location.href='userSelectTieZi?kind='+kind+'&index=领养';
    }
</script>
</body>
</html>
