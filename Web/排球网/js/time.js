
    function setTime(){
        var today=new Date();
        var year=today.getFullYear();
        var mon=today.getMonth()+1;
        var date=today.getDate();
        var day=today.getDay();
        
        var days=new Array("日","一","二","三","四","五","六");
        if(mon<10){
            mon="0"+mon;
        }
        if(date<10){
            date="0"+date;
        }
        document.getElementById('txt1').innerHTML=year+"年"+mon+"月"+date+"日"+"(星期"+days[day]+"）";
}
        function getTime(){
            var today=new Date();
            var hour=today.getHours();
            var min=today.getMinutes();
            var sec=today.getSeconds();
            if(hour<10){
                hour="0"+hour;
            }
            if(min<10){
                min="0"+min;
            }
            if(sec<10){
                sec="0"+sec;
            }
            document.getElementById('txt2').innerHTML=hour+":"+min+":"+sec;
        }
        var myt=setInterval("setTime();getTime();",1000);
