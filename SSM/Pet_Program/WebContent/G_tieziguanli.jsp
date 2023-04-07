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
    <link rel="stylesheet" href="css/tiezishenhe.css">
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/G_daohang.js"></script>
    <script src="js/G_all.js"></script>
</head>
<body>
<div class="daohang">
    <div>
        <img src="images/logo.png" alt="宠物计划">

        <ul>
            <li onclick="shouye()">首页</li>
            <li onclick="selectTieZi()">帖子管理</li>
            <li onclick="redianguanli()">热点管理</li>

        </ul>
    </div>
</div>
<div class="tupian">
    <img src="images/img27.jpg" alt="">
</div>
<div class="content">
    <div class="liehang">
        <ul>
            <li onclick="tiezishenhe()">帖子审核</li>
        </ul>
    </div>
    <div class="dakuang">
        <div>
            <ul>
                <li>分类：</li>
                <li onclick="selectTieZi()">全部帖子</li>
                <li onclick="select1()">已审核</li>
                <li onclick="select2()">待审核</li>
                <li onclick="select3()">已删除</li>
            </ul>
        </div>
        <div class="liebiao">
            <c:if test="${not empty list}">
                <table>
                    <tr>
                        <th>发帖时间</th>
                        <th>分类</th>
                        <th>标题</th>
                        <th>状态</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach var="d" items="${list}">
                        <tr align="center">
                            <td>${d.time}</td>
                            <td>${d.type}</td>
                            <td>${d.title}</td>
                            <td>${d.status}</td>
                            <td><button type="button" class="shanchu" onclick="update2(${d.tid},'${d.user}')">删除帖子</button>
                                <button type="button" class="tongguo" onclick="update1(${d.tid},'${d.user}')">通过</button></td>
                        </tr>
                    </c:forEach>
                </table>
            </c:if>
        </div>
    </div>

</div>
<div class="footer">@宠物计划 联系热线11011001</div>
<script>
    function selectTieZi() {
        location.href = 'selectTieZi';
    }
    function select1() {
        console.log("已审核");
        location.href = 'selectTieZi?status=已审核';
    }
    function select2() {
        console.log("未审核");
        location.href = 'selectTieZi?status=未审核';
    }
    function select3() {
        console.log("已删除");
        location.href = 'selectTieZi?status=已删除';
    }
    function update1(id,user) {
        console.log(id);
        location.href = 'updateTieZi?id=' +id+'&status=已审核'+'&user='+user;
    }
    function update2(id,user) {
        location.href = 'updateTieZi?id=' +id+'&status=已删除'+'&user='+user;
    }
</script>
</body>
</html>
