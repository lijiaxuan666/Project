$(function () {
    var a = true;
        //全选
        $("#qx").click(function () {
            a=!a;
            if (a) {   //选中时
                // $("#qx").toggleClass("yangshi");
                $("#qx").addClass("yangshi");
                $(".xiaoxi div input").prop('checked', true);
            } else {
                $("#qx").removeClass("yangshi");
                $(".xiaoxi div input").prop('checked', false);
                
            }
            
        })

        //反全选
        $(".xiaoxi :checkBox").click(function () {
            var flag = true;
            $(".xiaoxi :checkBox").each(function () {
                if (!$(this).is(":checked")) {
                    
                    flag = false;
                }
            })
            //根据flag的值来决定是否要选中全选按钮
            if (flag) {
                $("#qx").addClass("yangshi");
                $("#qx").prop('checked', true);
            } else {
                $("#qx").removeClass("yangshi");
                $("#qx").prop('checked', false);
            }
        })
    

    //删除
    $("#delAll").click(function () {

        $(".xiaoxi :checked").each(function () {
            $(this).parent().remove();
            //重新设置全选按钮
            $("#qx").removeClass("yangshi");
        })

    })

})