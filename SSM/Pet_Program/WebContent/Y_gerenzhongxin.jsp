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
    <link rel="stylesheet" href="css/gerenzhongxin.css">
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/Y_daohang.js"></script>
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
        <img src="images/laba.png" alt=""><span>帖子管理</span>
    </div>
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
        <li onclick="selectByType('找主人')">找主人</li>
        <li onclick="selectByType('找宠物')">找宠物</li>
    </ul>
</div>
<div class="liebiao">
    <table>
        <tr>
            <th>图片</th>
            <th>发帖时间</th>
            <th>种类</th>
            <th>分类</th>
            <th>联系方式</th>
            <th>宠物描述</th>
            <th>操作</th>
        </tr>
        <c:forEach var="d" items="${list}">
            <tr>
                <td><img src="images/${d.imag}" alt=""></td>
                <td>${d.time}</td>
                <td>${d.kind}</td>
                <td>${d.type}</td>
                <td>${d.phone}</td>
                <td>${d.title}</td>
                <td>
                    <button type="button" class="shanchu" onclick="updateTieZi(${d.tid},'${d.title}','${d.phone}')">修改</button>
                    <button type="button" class="tongguo" onclick="deleteTieZi(${d.tid})">删除</button>
                </td>
            </tr>
        </c:forEach>
    </table>

</div>
<div class="wu">
    <div>暂 无 更 多 信 息</div>
</div>
<div class="footer">@宠物计划 联系热线11011001</div>

<script>
    function updateTieZi(id,title,phone){
        window.location.href = 'selectTieZi?update=update&id='+id+"&title="+title+"&phone="+phone;
    }
    function deleteTieZi(id){
        window.location.href = 'updateTieZi?delete=delete&id=' + id;
    }
    function selectByType(type) {
        window.location.href = 'selectTieZiByUser?type=' + type;
    }

    function selectByKind(kind) {
        window.location.href = 'selectTieZiByUser?kind=' + kind;
    }
</script>
</body>
</html>
