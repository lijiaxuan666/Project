$(function () {

    //1.给用户名输入框绑定到失去焦点事件
    $(":text:first").blur(function () {
        check1();
    })

    //2.给密码输入框绑定到失去焦点事件
    $(":password:first").blur(function () {
        check2();
    })

    //3.给确认密码输入框绑定到失去焦点事件
    $(":password:last").blur(function () {
        check3();
    })

    //4.为注册按钮绑定提交事件   因为要写这步，所以校验函数写在下面
    $("#sub").click(function(){
        //   &     如果写一个&，当check1()为假，不管，继续校验check2()等后面的函数，提示文字都出来
        //   &&    短路与  如果写两个&&，当check1()为假，后面的check2()等函数都不走，提示文字也没有
        if(check1()&check2()&check3()){
            //3个校验都通过，则允许提交
            $("form").submit();
        }
    })

    //4.为取消绑定单击事件 把三个框都清空
    $("#qx").click(function(){
        $(":text:first").val('');
        $(":password:first").val('');
        $(":password:last").val('');
    })


})

 //校验用户名
 function check1() {
    //获取用户名输入框中的值 
    var value = $(":text:first").val();
    //非空校验
    if (value == '') {
        //添加非空校验提示文字    向上翻一级。向下翻td标签。找子元素span标签。提示文字
        $(":text:first").parent().next('td').find('span').html('用户名不能为空');
        //false意思是表单验证不通过
        return false;
    }
    //数据一致性校验（长度校验）
    if (value.length < 1 || value.length > 8) {
        //添加非空校验提示文字
        $(":text:first").parent().next('td').find('span').html('用户名长度需由1-8个字符组成');
        return false;
    }
    //判断是否重复？？



    //校验通过，清空提示文字
    $(":text:first").parent().next('td').find('span').html('');
    //当返回true时，校验通过
    return true;

}
//校验密码框
function check2() {
    //获取密码输入框中的值
    var value = $(":password:first").val();
    //非空校验
    if (value == '') {
        //添加非空校验提示文字
        $(":password:first").parent().next('td').find('span').html('密码不能为空');
        return false;
    }
    //数据一致性校验
    if (value.length < 6 || value.length > 18) {
        //添加非空校验提示文字
        $(":password:first").parent().next('td').find('span').html('密码长度需由6-18个字符组成');
        return false;
    }

    //校验通过，清空提示文字
    $(":password:first").parent().next('td').find('span').html('');
    return true;
}

//校验确认密码框
function check3() {
    //获取确认密码框中的值
    var value = $(":password:last").val();
    //非空校验
    if (value == '') {
        //添加非空校验提示文字  
        $(":password:last").parent().next('td').find('span').html('密码不能为空');
        return false;
    }
    //确认密码框的值必须跟密码框的值一致
    if ($(":password:first").val() != $(":password:last").val()) {
        //添加提示文字
        $(":password:last").parent().next('td').find('span').html('确认密码必须与密码一致！');
        return false;
    }

    //校验通过，清空提示文字
    $(":password:last").parent().next('td').find('span').html('');
    return true;
}