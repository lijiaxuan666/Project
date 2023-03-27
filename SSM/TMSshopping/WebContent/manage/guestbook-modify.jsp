<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@page import="com.bean.EASYBUY_COMMENT" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>商城</title>
    <link type="text/css" rel="stylesheet" href="../css/style.css"/>
    <link type="text/css" rel="stylesheet" href="../css/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="../css/bootstrap-theme.min.css"/>
    <link type="text/css" rel="stylesheet" href="../css/bootstrap-theme.css"/>
    <link type="text/css" rel="stylesheet" href="../css/bootstrap.css"/>
    <link href="../css/materialdesignicons.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/multitabs.min.css">
    <link href="../css/style.min.css" rel="stylesheet">
    <script type="text/javascript" src="../scripts/function-manage.js"></script>
    <script type="text/javascript" src="../scripts/npm.js"></script>
</head>
<body>
<div id="header" class="wrap">
    <div class="help"><a href="../indexSelect">
        <button>返回前台页面</button>
    </a></div>
    <a href="index.jsp">
        <button>首页</button>
    </a>

</div>
<div id="childNav1">
    <div align="center">
    </div>
    <div align="left">
        管理员${name.EU_USER_ID}您好，欢迎回到管理后台。

    </div>
</div>
<div id="position" class="wrap">
    您现在的位置：商城<a href="index.jsp">>管理后台</a>
</div>
<div id="main" class="lefter">
    <div id="menu-mng" class="lefter">
        <div class="box">
            <div class="lyear-layout-sidebar-scroll">
                <nav class="sidebar-main">
                    <ul class="nav nav-drawer">
                        <li><a class="multitabs"><i
                                class="mdi mdi-home"></i><span>后台首页</span></a></li>
                        <li class="nav-item nav-item-has-subnav"><a href="javascript:void(0)"><i
                                class="mdi mdi-palette"></i><span>账号管理</span></a>
                            <ul class="nav nav-subnav">
                                <li><a class="multitabs" href="user-add.jsp">新增</a></li>
                                <li><a class="multitabs" href="user">用户管理</a></li>
                            </ul>
                        </li>
                        <li class="nav-item nav-item-has-subnav"><a href="javascript:void(0)"><i
                                class="mdi mdi-format-align-justify"></i>
                            <span>商品信息</span></a>
                            <ul class="nav nav-subnav">
                                <li><a class="multitabs" href="productClassAdd">新增</a></li>
                                <li><a class="multitabs" href="productSelect">分类管理</a></li>
                            </ul>
                        </li>
                        <li class="nav-item nav-item-has-subnav"><a href="javascript:void(0)"><i
                                class="mdi mdi-file-outline"></i>
                            <span>订单管理</span></a>
                            <ul class="nav nav-subnav">
                                <li><a class="multitabs" href="ordersel">订单管理</a></li>
                            </ul>
                        </li>
                        <li class="nav-item nav-item-has-subnav"><a href="javascript:void(0)"><i
                                class="mdi mdi-format-align-justify"></i>
                            <span>留言管理</span></a>
                            <ul class="nav nav-subnav">
                                <li><a class="multitabs" href="SelManage">留言管理</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>
</div>
<div class="main">
    <h2>回复留言</h2>
    <div class="manage">
        <form action="UpManage" method="post">
            <%EASYBUY_COMMENT comment = (EASYBUY_COMMENT) request.getAttribute("list"); %>
            <table class="form">
                <tr>
                    <td class="field">留言ID：</td>
                    <td><input type="text" class="text" name="orderId" readonly="readonly"
                               value="<%=comment.getEC_ID() %>"/></td>
                </tr>
                <tr>
                    <td class="field">留言姓名：</td>
                    <td><input type="text" class="text" name="name" readonly="readonly"
                               value="<%=comment.getEC_NICK_NAME() %>"/></td>
                </tr>
                <tr>
                    <td class="field">留言内容：</td>
                    <td><textarea name="Content" readonly="readonly"
                                  style="height: 100px;width: 400px;resize: none;"><%=comment.getEC_CONTENT()%></textarea>
                    </td>
                </tr>
                <tr>
                    <td class="field">回复内容：</td>
                    <td><textarea name="replyContent" style="height: 100px;width: 400px;resize: none;" required
                                  oninvalid="setCustomValidity('商店都被诋毁了，店主你得说说话啊！！');"
                                  oninput="setCustomValidity('');"></textarea></td>
                </tr>
                <tr>
                    <td></td>
                    <td><label class="ui-blue"><input type="submit" name="submit" value="更新"/></label></td>
                </tr>
            </table>
        </form>
    </div>
</div>
<div class="clear"></div>
</div>
<script type="text/javascript" src="../scripts/jquery.min.js"></script>
<script type="text/javascript" src="../scripts/bootstrap.min.js"></script>
<script type="text/javascript" src="../scripts/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="../scripts/bootstrap-multitabs/multitabs.js"></script>
<script type="text/javascript" src="../scripts/index.min.js"></script>
<script type="text/javascript">
    window.onload = function () {
        $('.dropdown-toggle').dropdown();
    }
</script>
</body>
</html>
