var file = document.getElementById('file');
var image = document.getElementById("img");
file.onchange = function() {
    var fileData = this.files[0];//获取到一个FileList对象中的第一个文件( File 对象),是我们上传的文件
    var pettern = /^image/;
    
    console.info(fileData.type)

    if (!pettern.test(fileData.type)) {
        alert("图片格式不正确");
        return;
    }
    var reader = new FileReader();
    reader.readAsDataURL(fileData);//异步读取文件内容，结果用data:url的字符串形式表示
    /*当读取操作成功完成时调用*/
    reader.onload = function(e) {
        console.log(e); //查看对象
        console.log(this.result);//要的数据 这里的this指向FileReader（）对象的实例reader
        image.setAttribute("src", this.result)
    }
}