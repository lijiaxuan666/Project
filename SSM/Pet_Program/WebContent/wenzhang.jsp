<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>文章详情</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/wenzhang.css">
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/Y_daohang.js"></script>
    <link type="text/css" rel="stylesheet" href="css/style.css"/>
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="css/bootstrap-theme.css"/>
    <link type="text/css" rel="stylesheet" href="css/bootstrap-theme.min.css"/>
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="css/style.css"/>
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="css/bootstrap-theme.css"/>
    <link type="text/css" rel="stylesheet" href="css/bootstrap-theme.min.css"/>
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
    <script type="text/javascript" src="scripts/function.js"></script>
    <script type="text/javascript" src="scripts/bootstrap.js"></script>
    <script type="text/javascript" src="scripts/bootstrap.min.js"></script>
    <script type="text/javascript" src="scripts/npm.js"></script>

    <style type="text/css">
        #magnifier {
            width: 300px;
            height: 300px;
            position: absolute;
            /*top:200px;
            left:400px;*/
            font-size: 0;
            border: 1px solid #000;
        }

        #img {
            width: 300px;
            height: 300px;
        }

        #Browser {
            border: 1px solid #000;
            z-index: 100;
            position: absolute;
            background: #555;
        }

        #mag {
            border: 1px solid #000;
            overflow: hidden;
            z-index: 100;
        }
    </style>
</head>
<body >
<div class="daohang">
<div>
    <img src="images/logo.png" alt="宠物计划">

    <ul>
        <li  onclick="shouye()">首页</li>
        <li  onclick="lingyang()">领养</li>
        <li  onclick="xunchong()">寻宠</li>
        <li  onclick="baike()">宠物百科</li>
        <li  onclick="gerenzhongxin()">个人中心</li>
        <li  onclick="xiaoxitixing()">消息提醒</li>
    </ul>
</div>
</div>
<div class="tupian">
    <img src="${file_name}" alt="">
</div>

<div class="biaoti1">
    <div>
        <h1 class="wenzi">${title}</h1>
        <p class="wenzi">发表时间：${time}</p>
    </div>
</div>
<div class="biaoti2">
    <div>
        <p class="wenzi1">${contnet}</p>
    </div>
</div>
</body>
</html>
