<%@ page contentType="text/html;charset=UTF-8" language="java" %>   <!--jsp-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    <!--jstl-->
<%
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + request.getContextPath() + "/";
%>  <!--取base-->
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>" />
    <meta charset="utf-8">
    <title>学生管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="layuimini/lib/layui-v2.6.3/css/layui.css" media="all">
    <link rel="stylesheet" href="layuimini/css/public.css" media="all">
    <script src="layuimini/lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
    <script src="layuimini/lib/jquery-3.4.1/jquery-3.4.1.min.js" charset="utf-8"></script>
</head>
<body>
<!--编辑弹出框-->
<div class="site-text" style="margin: 5%; display: none" id="edit_window">
    <div class="layui-form" style="width: 400px; float: left" lay-filter="editForm">
        <!--隐藏域，sid-->
        <input type="hidden" id="sid" name="sid" class="layui-input" value="null">
        <!--隐藏域，pic（头像地址）-->
        <input type="hidden" id="pic" name="pic" class="layui-input" value="null">
        <!--姓名-->
        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-block">
                <input type="text" id="sname" name="sname" value="" lay-verify="required" lay-reqtext="姓名不能为空" placeholder="请输入姓名" class="layui-input">
            </div>
        </div>
        <!--电话号-->
        <div class="layui-form-item">
            <label class="layui-form-label">手机号</label>
            <div class="layui-input-block">
                <input type="number" id="snum" name="snum" value="" lay-verify="required" lay-reqtext="手机号不能为空" placeholder="请输入学号" class="layui-input">
            </div>
        </div>
        <!--性别-->
        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block">
                <input type="radio" name="ssex" value="男" title="男" checked="checked">
                <input type="radio" name="ssex" value="女" title="女">
            </div>
        </div>
        <!--年龄-->
        <div class="layui-form-item">
            <label class="layui-form-label">年龄</label>
            <div class="layui-input-block">
                <input type="number" id="sage" name="sage" value="" placeholder="请输入年龄" class="layui-input">
            </div>
        </div>
        <!--居住地址-->
        <div class="layui-form-item">
            <label class="layui-form-label">居住地址</label>
            <div class="layui-input-block">
                <input type="text" id="cid" name="cid" value="" placeholder="请输入居住地址" class="layui-input">
            </div>
        </div>
        <!--有无居住证-->
        <div class="layui-form-item">
            <label class="layui-form-label">有无居住证</label>
            <div class="layui-input-block">
                <input type="text" id="sstatus" name="sstatus" value="" placeholder="请输入是否拥有居住证" class="layui-input">
            </div>
        </div>
        <!--备注-->
        <div class="layui-form-item">
            <label class="layui-form-label">目的</label>
            <div class="layui-input-block">
                <input type="text" id="sremark" name="sremark" value="" placeholder="请输入备注" class="layui-input">
            </div>
        </div>
        <!--到访时间-->
        <div class="layui-form-item">
            <label class="layui-form-label">到访时间</label>
            <div class="layui-input-block">
                <input type="text" id="entime" name="entime" value="" lay-verify="date" placeholder="请选择到访时间" class="layui-input">
            </div>
        </div>
        <!--地址-->
        <div class="layui-form-item">
            <label class="layui-form-label">户籍所在地</label>
            <div class="layui-input-block">
                <input type="text" id="address" name="address" value="" placeholder="请输入家庭地址" class="layui-input">
            </div>
        </div>
    </div>

</div>
<!--数据表格布局-->
<div class="layuimini-container">
    <div class="layuimini-main">
        <!--搜索信息-->
        <fieldset class="table-search-fieldset">
            <legend>搜索信息</legend>
            <div style="margin: 10px 10px 10px 10px">
                <form class="layui-form layui-form-pane" action="" lay-filter="searchForm">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">姓名</label>
                            <div class="layui-input-inline">
                                <input type="text" name="sname" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">电话号</label>
                            <div class="layui-input-inline">
                                <input type="text" name="snum" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <button type="submit" class="layui-btn layui-btn-primary"  lay-submit lay-filter="data-search-btn"><i class="layui-icon"></i> 搜　　索 </button>
                        </div>
                        <div class="layui-inline">
                            <button type="submit" class="layui-btn layui-btn-primary"  lay-submit lay-filter="data-all-btn"><i class="layui-icon"></i> 显示全部 </button>
                        </div>
                    </div>
                </form>
            </div>
        </fieldset>
        <!--头部工具栏-->
        <script type="text/html" id="toolbarDemo">
            <div class="layui-btn-container">
                <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="add"> 添加人员 </button>
                <button class="layui-btn layui-btn-sm layui-btn-danger data-delete-btn" lay-event="delete"> 删除人员 </button>
            </div>
        </script>
        <!--表格容器-->
        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>
    </div>
</div>
<!--js代码-->
<script>
    layui.use(['form', 'table','laydate', "upload", "element", "layer"], function () {
        var $ = layui.jquery,
            form = layui.form,
            table = layui.table,
            layer = layui.layer;

        //加载数据表格
        table.render({
            elem: '#currentTableId',
            url: 'student/queryStudents.do',
            where: {type:"outside"},
            toolbar: '#toolbarDemo',
            defaultToolbar: ['filter', 'exports', 'print'],
            cols: [[
                {type: "checkbox"},
                {field: 'sid', title: '序号', sort: true},
                {field: 'sname', title: '姓名'},
                {field: 'snum', title: '电话号', sort: true},
                {field: 'ssex', title: '性别'},
                {field: 'sage', title: '年龄', sort: true},
                {field: 'cid', title: '居住地址'},
                {field: 'address', title: '户籍所在地'},
                {field: 'sstatus', title: '居住证'},
                {field: 'sremark', title: '目的'},
                {field: 'entime', title: '到访时间'},
            ]],
            limits: [5, 10, 15, 20, 25, 50, 100],
            limit: 10,
            page: {
                prev: '上一页',
                next: '下一页',
            },
        });

        // 监听搜索操作
        form.on('submit(data-search-btn)', function (data) {
            var result = JSON.stringify(data.field);
            console.log(result);
            //执行搜索重载
            table.reload('currentTableId', {
                url: 'student/searchStudents.do',
                where: {json:result,type:"outside"},   //把json传过去
                page: {curr: 1}, //重新从第 1 页开始
                done: function (res) {
                    layer.msg("搜索到"+res.count+"个结果", {time:800});
                    return res;
                }
            });

            return false;   //不跳转
        });

        // 监听显示全部操作
        form.on('submit(data-all-btn)', function (data) {
            form.val("searchForm", {
                'sname':null,
                'snum':null,
                'cid':null
            });
            //执行搜索重载
            table.reload('currentTableId', {
                url: 'student/queryStudents.do',
                where: {type:"outside"},
                page: {curr: 1}, //重新从第 1 页开始
                done: null
            });

            return false;   //不跳转
        });

        //toolbar监听事件
        table.on('toolbar(currentTableFilter)', function (obj) {
            if (obj.event === 'add') {  // 监听添加操作
                layer.open({
                    title:"新增",
                    type: 1,
                    maxmin:true,
                    shadeClose: true,
                    area:['800px','90%'],
                    btn: ['确定', '取消'],
                    content: $("#edit_window"),
                    success: function () {  //弹出框成功回调
                        //给表单赋值
                        form.val("editForm", {
                            "sid": null,
                            "sname": '王守仁',
                            "snum": '13592709935',
                            "ssex": '男',
                            "sage": 20,
                            "side": "广源苑小区",
                            "sstatus":'有',
                            "sremark":'走亲访友',
                            "address":'北京市海淀区知春路',
                            "entime":'2023-03-21',
                        });
                    },
                    yes: function(index,layero){ //确认的回调
                        layer.close(index); //关闭弹出框
                        var mdata = form.val('editForm');
                        //向服务器请求
                        $.getJSON({
                            url: 'student/addStudent.do',
                            data: {json:JSON.stringify(mdata),type:"outside"},    //发json
                            success:function (res) {
                                layer.msg("添加"+res+"行成功！",{time:800});
                                //获得最后一页的页码并重载
                                $.getJSON({
                                    url: 'student/getAmount.do',
                                    where: {type:"outside"},
                                    success: function (res) {
                                        //数据长度
                                        var len = res;
                                        //每页大小
                                        var size = $('.layui-laypage-limits').find('select').val();
                                        //页码: 上取整（len/size）
                                        var pageNum = Math.ceil(len / size);
                                        //重载页面
                                        table.reload('currentTableId',{page : {curr : pageNum}});
                                    }
                                });
                            }
                        });
                    }
                });
            } else if (obj.event === 'delete') {  // 监听删除操作
                layer.confirm('确定要删除选中行吗？', function(index){
                    var checkStatus = table.checkStatus('currentTableId')
                        , data = checkStatus.data;
                    layer.close(index); //关闭提示框
                    //向服务器请求
                    $.getJSON({
                        url: 'student/deleteStudents.do',
                        data: {json:JSON.stringify(data),type:"outside"},   //发json过去
                        success:function (res) {
                            layer.msg("删除"+res+"行成功！",{time:800});
                            //重载表格
                            table.reload('currentTableId',{page:{curr:1}});
                        }
                    });
                });
            }
        });

    });
</script>

</body>
</html>
