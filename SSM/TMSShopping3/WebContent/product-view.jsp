<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>商城-首页</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/xiaoxitixing.css">
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/xiaoxitixing.js"></script>
    <script src="js/Y_daohang.js"></script>
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
    <script type="text/javascript">
        function searchHot(name) {
            location.href = 'selectProductList?name=' + name;
        }

        function getEventObject(W3CEvent) {//事件标准化函数
            return W3CEvent || window.event;
        }

        function getPointerPosition(e) {//兼容浏览器的鼠标x,y获得函数
            e = e || getEventObject(e);
            var x = e.pageX || (e.clientX + (document.documentElement.scrollLeft || document.body.scrollLeft));
            var y = e.pageY || (e.clientY + (document.documentElement.scrollTop || document.body.scrollTop));

            return {'x': x, 'y': y};
        }

        function setOpacity(elem, level) {//兼容浏览器设置透明值
            if (elem.filters) {
                elem.style.filter = 'alpha(opacity=' + level * 100 + ')';
            } else {
                elem.style.opacity = level;
            }
        }

        function css(elem, prop) {	//css设置函数,可以方便设置css值,并且兼容设置透明值
            for (var i in prop) {
                if (i == 'opacity') {
                    setOpacity(elem, prop[i]);
                } else {
                    elem.style[i] = prop[i];
                }
            }
            return elem;
        }

        var magnifier = {
            m: null,

            init: function (magni) {
                var m = this.m = magni || {
                    cont: null,	//装载原始图像的div
                    img: null,	//放大的图像
                    mag: null,	//放大框
                    scale: 20	//比例值,设置的值越大放大越大,但是这里有个问题就是如果不可以整除时,会产生些很小的白边,目前不知道如何解决
                }

                css(m.img, {
                    'position': 'absolute',
                    'width': (m.cont.clientWidth * m.scale) + 'px',				//原始图像的宽*比例值
                    'height': (m.cont.clientHeight * m.scale) + 'px'				//原始图像的高*比例值
                })

                css(m.mag, {
                    'display': 'none',
                    'width': m.cont.clientWidth + 'px',	//m.cont为原始图像,与原始图像等宽
                    'height': m.cont.clientHeight + 'px',
                    'position': 'absolute',
                    'left': m.cont.offsetLeft + m.cont.offsetWidth + 10 + 'px',//放大框的位置为原始图像的右方远10px
                    'top': m.cont.offsetTop + 'px'
                })

                var borderWid = m.cont.getElementsByTagName('div')[0].offsetWidth - m.cont.getElementsByTagName('div')[0].clientWidth;		//获取border的宽

                css(m.cont.getElementsByTagName('div')[0], {			//m.cont.getElementsByTagName('div')[0]为浏览框
                    'display': 'none',								//开始设置为不可见
                    'width': m.cont.clientWidth / m.scale - borderWid + 'px',			//原始图片的宽/比例值 - border的宽度
                    'height': m.cont.clientHeight / m.scale - borderWid + 'px',//原始图片的高/比例值 - border的宽度
                    'opacity': 0.5//设置透明度
                })

                m.img.src = m.cont.getElementsByTagName('img')[0].src;//让原始图像的src值给予放大图像
                m.cont.style.cursor = 'crosshair';

                m.cont.onmouseover = magnifier.start;

            },

            start: function (e) {

                if (document.all) {//只在IE下执行,主要避免IE6的select无法覆盖
                    magnifier.createIframe(magnifier.m.img);
                }

                this.onmousemove = magnifier.move;//this指向m.cont
                this.onmouseout = magnifier.end;
            },

            move: function (e) {
                var pos = getPointerPosition(e);		//事件标准化

                this.getElementsByTagName('div')[0].style.display = '';

                css(this.getElementsByTagName('div')[0], {
                    'top': Math.min(Math.max(pos.y - this.offsetTop - parseInt(this.getElementsByTagName('div')[0].style.height) / 2, 0), this.clientHeight - this.getElementsByTagName('div')[0].offsetHeight) + 'px',
                    'left': Math.min(Math.max(pos.x - this.offsetLeft - parseInt(this.getElementsByTagName('div')[0].style.width) / 2, 0), this.clientWidth - this.getElementsByTagName('div')[0].offsetWidth) + 'px'			//left=鼠标x - this.offsetLeft - 浏览框宽/2,Math.max和Math.min让浏览框不会超出图像
                })

                magnifier.m.mag.style.display = '';

                css(magnifier.m.img, {
                    'top': -(parseInt(this.getElementsByTagName('div')[0].style.top) * magnifier.m.scale) + 'px',
                    'left': -(parseInt(this.getElementsByTagName('div')[0].style.left) * magnifier.m.scale) + 'px'
                })

            },

            end: function (e) {
                this.getElementsByTagName('div')[0].style.display = 'none';
                magnifier.removeIframe(magnifier.m.img);		//销毁iframe

                magnifier.m.mag.style.display = 'none';
            },

            createIframe: function (elem) {
                var layer = document.createElement('iframe');
                layer.tabIndex = '-1';
                layer.src = 'javascript:false;';
                elem.parentNode.appendChild(layer);

                layer.style.width = elem.offsetWidth + 'px';
                layer.style.height = elem.offsetHeight + 'px';
            },

            removeIframe: function (elem) {
                var layers = elem.parentNode.getElementsByTagName('iframe');
                while (layers.length > 0) {
                    layers[0].parentNode.removeChild(layers[0]);
                }
            }
        }
        window.onload = function () {
            magnifier.init({
                cont: document.getElementById('magnifier'),
                img: document.getElementById('magnifierImg'),
                mag: document.getElementById('mag'),
                scale: 3
            });
        }

        function jian() {
            var count = parseInt(document.getElementById("count").value);
            if (count > 0) {
                count--;
            }
            if (count == 0) {
                count = 1;
            }
            document.getElementById("count").value = count;
        }

        function jia() {
            var count = parseInt(document.getElementById("count").value);
            var stock = parseInt(document.getElementById("stock").innerHTML);
            if (count < stock) {
                count++;
            }
            document.getElementById("count").value = count;
        }

        function checkcount() {
            var count = parseInt(document.getElementById("count").value);
            var stock = parseInt(document.getElementById("stock").innerHTML);
            if (count > stock) {
                alert('库存不足');
                document.getElementById("count").value = stock;
            }
            if (count == 0) {
                alert('购买数量不能小于1哦,亲');
                document.getElementById("count").value = 1;
            }
            if (count < 0) {
                alert('数量非法');
                document.getElementById("count").value = 1;
            }
        }

        function shopAdd(idd) {
            var id = idd;
            var count = parseInt(document.getElementById("count").value);
            location.href = 'shopAdd?id=' + id + '&count=' + count;
        }

        function shopAdd2(idd) {
            var id = idd;
            var count = parseInt(document.getElementById("count").value);
            location.href = 'shopAdd2?id=' + id + '&count=' + count;
        }
    </script>
    <script type="text/javascript">
        function selectname() {
            var name = document.getElementById("selectname").value;
            location.href = 'selectProductList?name=' + name;
        }
    </script>
</head>
<body>
<div class="daohang">
    <div>
        <img src="images/logo.png" alt="宠物计划">
        <ul>
            <li><a href="indexSelect">首页</a></li>
            <li><a href="login.jsp">登录</a></li>
            <li><a href="manage/index.jsp">去后台</a></li>
            <li><a href="selectdd?dd=${name.EU_USER_ID }">个人订单</a></li>
            <li><a href="ShopSelect">购物车</a></li>
        </ul>
    </div>
</div>
<div class="daohang">
    <div>
        <ul>
            <li class="first"><a style="color: black">热门搜索</a></li>
            <li><a href="javascript:searchHot('瓜子')">瓜子</a></li>
            <li><a href="javascript:searchHot('辣条')">辣条</a></li>
            <li><a href="javascript:searchHot('泡面')">泡面</a></li>
            <li><a href="javascript:searchHot('巧克力')">巧克力</a></li>
            <li><a href="javascript:searchHot('薯片')">薯片</a></li>
            <li><a href="javascript:searchHot('糖果')">糖果</a></li>
            <li><a href="javascript:searchHot('肉脯')">肉</a></li>
            <li class="last"><a href="javascript:searchHot('牛奶')">牛奶</a></li>
            <li style="border: 0"><input style="margin-left: 90px" type="text" id="selectname"
                                         value="${search_words}"/><a style="margin-left: 2px"
                                                                     href="javascript:selectname()">搜索</a></li>
        </ul>
    </div>
</div>
<div id="position" class="wrap">
    您现在的位置：<a href="indexSelect">商城</a> &gt; <a href="selectProductList">商品分类</a>
    &gt; ${title }
</div>
<div id="main" class="wrap">
    <div class="lefter">
    </div>
    <div id="product" class="main">
        <h1>${p.EP_NAME }</h1>
        <div class="infos">
            <div id="magnifier">
                <img src="images/product/${p.EP_FILE_NAME }" id="img"/>
                <div id="Browser"></div>
            </div>
            <div id="mag">
                <img id="magnifierImg"/>
            </div>

            <div class="buy">
                <p>
                    价格：<span class="price">￥${p.EP_PRICE }.00</span>
                </p>
                <p>
                    商品介绍：<span class="text">${p.EP_DESCRIPTION }</span>
                </p>
                <p>
                    邮递方式：<font color="red">顺丰速递</font>
                </p>
                <p>
                    剩余库存：<span id="stock">${p.EP_STOCK }</span>
                </p>
                <p>
                    购买数量：<input type="button" value="  -  " onclick="jian()"/><input
                        align="middle" type="text" value="1" id="count" name="count"
                        style="font-size: 18px;width: 100px"
                        onblur="checkcount()"/><input type="button" value="  +  "
                                                      onclick="jia()"/>
                </p>
                <div class="button">
                    <input type="button" name="button" value=""
                           onclick="shopAdd(${p.EP_ID})"/>
                    <a style="position: relative;top: 5px" href="javascript:shopAdd2(${p.EP_ID})">
                    </a>
                </div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
    <div class="clear"></div>
</div>
</body>
</html>

