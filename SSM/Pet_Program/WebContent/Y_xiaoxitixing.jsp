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
    <link rel="stylesheet" href="css/xiaoxitixing.css">
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/xiaoxitixing.js"></script>
    <script src="js/Y_daohang.js"></script>
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
    <img src="images/img24.png" alt="">
</div>
<div class="yonghu">
    <ul>
        <li>
            <img src="images/img7.1.png" alt="">
        </li>
        <li>
            <div>
                <h3>用户名：${name}</h3>
                <p>
                    领养代替购买
                    领养一只猫狗，拯救一条生命！
                    宠物计划为了宠物健康，会做基本医疗，有的甚至会做绝育手术减少不良养殖场获利，减少虐宠事件的产生，混血的更加健康。
                    请给他们一个温暖的家，你的行动会影响到他人！
                </p>
            </div>
        </li>
    </ul>
</div>
<div class="tongzhi">
    <div>
        <img src="images/laba.png" alt=""><span>消息通知</span>
    </div>
</div>
<div class="caozuo">
    <ul>
        <li><img src="images/zhua2.png" alt=""></li>
        <li><span>选择操作：</span></li>
        <li><p id="qx">全选</p></li>
        <li><p id="swyd">设为已读</p></li>
        <li><p id="delAll">删除</p></li>

    </ul>
</div>
<div class="xiaoxi">
    <c:forEach var="d" items="${list}">
        <div>
            <input type="checkbox" id="${d.xid}" name="interest"/>
            <label for="${d.xid}" class="qiri">
                <c:if test="${d.read==0}"><span class="tishi"></c:if>
                    <c:if test="${d.read==1}"><span></c:if>
                        ${d.content}</span><span class="riqi">${d.time}</span></label>
        </div>
    </c:forEach>+
</div>
</body>
</html>
