
function check() {
    var phone = document.getElementById('phone').value;
    var password = document.getElementById('password').value;
    var acpassword = document.getElementById('acpassword').value;
    console.log(password,acpassword)
    if (password !== acpassword) {
        alert("两次输入密码不相同");
        return false;
    }
    if (!(/^1\d{10}$/.test(phone))) {
        alert("手机号码格式错误");
        return false;
    }
    else {
        alert("登录成功");
        window.location.href = './index.html'
        return;
    }
}