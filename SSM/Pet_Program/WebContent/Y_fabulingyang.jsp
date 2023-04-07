<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link rel="stylesheet" href="css/denlu.css">
    <link rel="stylesheet" href="css/all.css">
    <script src="js/jquery-3.3.1.min.js"></script>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>宠物计划</title>
    <link rel="stylesheet" href="css/lingyang.css">
    <link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/Y_daohang.js"></script>
    <script src="js/lingyang.js"></script>
    <link rel="stylesheet" href="css/fabu.css">
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/all.js"></script>
</head>
<body>
<div class="tupian">
    <img src="images/img16.jpg" alt="">
</div>
<div class="biaoti">发布领养信息</div>
<div class="conten">
    <form onclick="return false">
        <table>
            <tr>
                <td>
                    <img src="images/img26.jpg" alt="" id="img">
                    <a href="javascript:;" class="file"><input type="file" name="" id="file">添加图片</a>
                </td>
                <td>
                    <div>
                        <span>品种：</span>
                        <select id="browsers">
                            <option selected="selected">狗狗</option>
                            <option>猫咪</option>
                        </select>
                    </div>
                    <div>
                        <span>类型：</span>
                        <select id="chongwu">
                            <option selected="selected">领养</option>
                            <option>送养</option>
                            <option>找主人</option>
                            <option>找宠物</option>
                        </select>
                    </div>
                    <div>
                        <span>联系方式：</span>
                        <input type="text " id="phone">
                    </div>
                    <div>
                        <span>宠物描述：</span>
                        <input type="text" id="title">
                    </div>
                    <button class="dab" onclick="insert()">提交</button>
                    <button class="dab" onclick="window.open('Y_lingyang.jsp')">返回</button>
                </td>
            </tr>
        </table>
    </form>

</div>
<div class="footer">@宠物计划 联系热线11011001</div>

<script src="js/fabu.js"></script>
<script type="text/javascript">
    function insert(){
        var phone=document.getElementById("phone").value;
        var title=document.getElementById("title").value;
        var obj=document.getElementById("chongwu");
        var index=obj.selectedIndex;
        var key=obj.options[index].text;
        var obj2=document.getElementById("browsers");
        var index2=obj2.selectedIndex;
        var key2=obj2.options[index2].text;
        var status2;
        if(key==="领养"||key==="送养"){
            status2="未领养";
        }else {
            status2="未找到";
        }
        var imag="img26.jpg";
        var url="insertTieZi?phone="+ phone +"&title="+ title +"&type="+ key+"&kind="+ key2+"&status2="+ status2+"&imag="+ imag;
        console.log(url);
        location.href=url;
    }
</script>
</body>
</html>
