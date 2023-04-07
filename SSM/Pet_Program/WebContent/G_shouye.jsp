<%--
  Created by IntelliJ IDEA.
  User: Lee
  Date: 2023/4/2
  Time: 21:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>宠物计划</title>
    <link rel="stylesheet" href="css/guanliyuan.css">
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/G_daohang.js"></script>
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
    <img src="images/shouye.png" alt="">
</div>
<div class="citiao">
    <dl>
        <dt><img src="images/zhua.png" alt=""></dt>
        <dd>——————— 热搜词条 ———————</dd>
        <dd>Top search queries</dd>
    </dl>
</div>
<div id="redian">
    <div class="resou1">
        <table >
            <tr>
                <td rowspan="2" class="td3"><img src="images/img5.png" alt=""></td>
                <td class="td1"><img src="images/img8.png" alt=""></td>
                <td class="td1" onclick="selectArticle(1)"><h2>猫猫狗狗可以一起养吗？</h2>
                    </br>正常情况下是可以在一起饲养的。但是有一些情况需要注意，首先，要尽量选择攻击性低，性格温和的犬猫品种。其次最好是养年龄相近的猫狗，从小就一起饲养，当动物之间互相熟悉了对方的味道，相对来说就不会有很强的攻击性。一旦发现有打架攻击的倾向，就要隔离开，分开饲养。最后，要注意将犬猫的粮食分开饲喂，防止出现猫咪偷吃狗粮，狗狗偷吃猫粮......
            </tr>
            <tr>

                <td class="td2"><img src="images/img7.png" alt=""></td>
                <td class="td2" onclick="selectArticle(2)"><h2>猫咪发生呕吐的时候怎么办？</h2>
                    </br>首先要看猫咪是因为什么症状而发生这种情况的，吐毛球？肠胃不适？吃错东西？ 要看猫咪吐出的是什么，如果是毛球那就不需要大惊小怪，给猫咪买一些化毛膏之类的混在猫粮吃就可以，或者有化毛成分的猫粮，如果猫咪是吃错东西或者肠胃不适引起的可以禁食（包括水）不要心疼！24小时看看猫咪还会不会发生呕吐，然后再喂一些......
                </td>
            </tr>
        </table>

    </div>
    <div class="resou2">
        <table>
            <tr>
                <td class="td1-1" onclick="selectArticle(3)">
                    <h3>挑选纯种泰迪犬的一些实用技巧</h3>
                    <br/>对于现代人来说养一条狗狗已经不是什么高档消费了，特别是对于一些
                    <br/>白领一族来说养一条合适的狗狗是比较的容易的了！但是选购一条好品
                    <br/>质的狗狗确并不容易！下面瑞鹏宠物......<hr/>
                </td>
                <td  class="td1-2"><img src="images/img9.png" alt=""></td>
            </tr>
            <tr>
                <td class="td1-1" onclick="selectArticle(4)">
                    <h3>如何帮宝贝们养成良好的生活习惯</h3>
                    <br/>自从我当了宠物医生以后身边总是有很多朋友问我很多关于养狗的问题
                    <br/>比如为什么家里狗狗挑食，为什么就是不听话,怎么在家里随地大小便，
                    <br/>很多很多诸如此类的问题。那今天小编就在这里为大家简单说一下......<hr/>
                </td>
                <td class="td1-2"><img src="images/image/img11 (2).png" alt=""></td>
            </tr>
            <tr>
                <td class="td1-1" onclick="selectArticle(5)">
                    <h3>微笑天使——萨摩耶保养攻略</h3>
                    <br/>萨摩耶的颜值是靠其毛发来撑起的，所以想要萨摩耶保持高颜值，毛发
                    <br/>必须要护理好，如果毛发粗糙毛量稀少，你说这样一只萨摩耶会好看吗？
                    <br/>平时要定期给狗狗洗澡护理，多梳毛，可以喂点深海鱼油的美毛狗粮.......
                </td>
                <td class="td1-2"><img src="images/img10.png" alt=""></td>
            </tr>
        </table>

    </div>
</div>

<div class="citiao2">
    <dl>
        <dt><img src="images/zhua.png" alt=""></dt>
        <dd>——————— 关于我们 ———————</dd>
        <dd>About our introduction</dd>
    </dl>
</div>
<div class="women">
    <div>
        <img src="images/img12.png" alt="">
        <span><h2>动物是人类的朋友</h2><br/> 我们是一个致力于流浪猫狗救助、领养、文明宣传的非盈利性社会团体。我们自成立以来，遵照市农业局、民政局的指导思想，在遵守宪法、法律、法规和国家政策的前提下，尊重生命、保护动物、维护动物的生存权利，保障它们的健康与福利，减少杀戮、虐待、残害、遗弃动物的行为，并通过教育引导正确科学对待伴侣动物的观念，达到人与动物和谐共处的愿景。</span>
    </div>

</div>
<div class="footer">@宠物计划 联系热线11011001</div>
<script>
    function selectTieZi() {
        location.href = 'selectTieZi';
    }
    function selectArticle(id) {
        location.href = 'selectArticle?id='+id;
    }
</script>
</body>
</html>
