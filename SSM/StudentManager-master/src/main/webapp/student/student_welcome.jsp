<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <title>学生首页</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="layuimini/lib/layui-v2.6.3/css/layui.css" media="all">
    <link rel="stylesheet" href="layuimini/lib/font-awesome-4.7.0/css/font-awesome.min.css" media="all">
    <link rel="stylesheet" href="layuimini/css/public.css" media="all">
    <script src="layuimini/lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
    <script src="layuimini/js/lay-config.js?v=1.0.4" charset="utf-8"></script>

    <style>
        .layui-card {border:1px solid #f2f2f2;border-radius:5px;}
        .icon {margin-right:10px;color:#1aa094;}
        .icon-blue {color:#1e9fff!important;}
        .layuimini-qiuck-module {text-align:center;margin-top: 10px}
        .layuimini-qiuck-module a i {display:inline-block;width:100%;height:60px;line-height:60px;text-align:center;border-radius:2px;font-size:30px;background-color:#F8F8F8;color:#333;transition:all .3s;-webkit-transition:all .3s;}
        .layuimini-qiuck-module a cite {position:relative;top:2px;display:block;color:#666;text-overflow:ellipsis;overflow:hidden;white-space:nowrap;font-size:14px;}
        .welcome-module {width:100%;height:210px;}
        .panel {background-color:#fff;border:1px solid transparent;border-radius:3px;-webkit-box-shadow:0 1px 1px rgba(0,0,0,.05);box-shadow:0 1px 1px rgba(0,0,0,.05)}
        .panel-body {padding:10px}
        .panel-title {margin-top:0;margin-bottom:0;font-size:12px;color:inherit}
        .label {display:inline;padding:.2em .6em .3em;font-size:75%;font-weight:700;line-height:1;color:#fff;text-align:center;white-space:nowrap;vertical-align:baseline;border-radius:.25em;margin-top: .3em;}
        .main_btn > p {height:40px;}
        .layui-bg-number {background-color:#F8F8F8;}
    </style>
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">
        <div class="layui-row layui-col-space15">
            <div class="layui-col-md4">
                <!-- 数据统计 -->
                <div class="layui-card" style="height: 170px;">
                    <div class="layui-card-header"><i class="fa fa-warning icon"></i>数据统计</div>
                    <div class="layui-card-body">
                        <div class="welcome-module">
                            <div class="layui-row layui-col-space10">
                                <div class="layui-col-xs6">
                                    <div class="panel layui-bg-number">
                                        <div class="panel-body">
                                            <div class="panel-title">
                                                <span class="label pull-right layui-bg-blue">实时</span>
                                                <h5>开课统计</h5>
                                            </div>
                                            <div class="panel-content">
                                                <h1 class="no-margins" id="open_course_count">等待加载</h1>
                                                <small>当前开课总数</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 快捷入口 -->
                <div class="layui-card" style="height: 170px">
                    <div class="layui-card-header"><i class="fa fa-credit-card icon icon-blue"></i>快捷入口</div>
                    <div class="layui-card-body">
                        <div class="welcome-module">
                            <div class="layui-row layui-col-space10 layuimini-qiuck">
                                <div class="layui-col-xs3 layuimini-qiuck-module">
                                    <a href="javascript:;" layuimini-content-href="student/student_information.jsp" data-title="个人信息" data-icon="fa fa-pencil">
                                        <i class="fa fa-pencil"></i>
                                        <cite>学生信息</cite>
                                    </a>
                                </div>
                                <div class="layui-col-xs3 layuimini-qiuck-module">
                                    <a href="javascript:;" layuimini-content-href="student/student_table_show.jsp" data-title="课表查看" data-icon="fa fa-table">
                                        <i class="fa fa-table"></i>
                                        <cite>课表查看</cite>
                                    </a>
                                </div>
                                <div class="layui-col-xs3 layuimini-qiuck-module">
                                    <a href="javascript:;" layuimini-content-href="student/student_score.jsp" data-title="成绩查询" data-icon="fa fa-graduation-cap">
                                        <i class="fa fa-graduation-cap"></i>
                                        <cite>成绩查询</cite>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    layui.use(['layer', 'miniTab', 'form', 'table','laydate'], function () {
        var $ = layui.jquery,
            layer = layui.layer,
            miniTab = layui.miniTab,
            form = layui.form,
            date = layui.laydate,
            table = layui.table;

        miniTab.listen();

        $.ajax({
            url: 'welcome/student/getAllCountByStudent.do',
            data: {sid: ${sessionScope.loginObj.sid}},
            type: 'get',
            datatype: 'json',
            success: function (res) {
                console.log(res);
                $("#open_course_count").html(res.openCourseCount);
                $("#approval_count").html(res.approvalCount);
            }
        });

        date.render({
            elem: '#search_date'
        });

        //监听单元格事件
        table.on('tool(currentTableFilter)', function(obj){
            if(obj.event === 'show') {
                var mdata = obj.data;
                layer.open({
                    title: mdata.title,
                    type: 2,    //iframe
                    shadeClose: true,
                    area: ['95%', '95%'],
                    scrollbar: false,
                    content: mdata.url
                })
            }
        });

    });

</script>
</body>
</html>
