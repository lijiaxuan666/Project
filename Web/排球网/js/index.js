window.onload = function(){
	var index = 0;
	const pics = document.querySelector('.focus_image');
	const button = document.getElementById('focus_button').getElementsByTagName('li');
	function move(obj, target, speed) {
		clearInterval(obj.timer);
		obj.timer = setInterval(function () {
			var oldValue = parseInt(obj.offsetLeft);
			var newValue = oldValue + speed;
			if (newValue <= target && speed < 0) {
				obj.style.left = target;
				clearInterval(obj.timer);
			}
			else if (newValue >= target && speed > 0) {
				obj.style.left = target;
				clearInterval(obj.timer);
			}
			obj.style.left = newValue + "px";
		}, 30);
	}
	
	
	function change() {
		setInterval(function () {
			index++;
			if (index == 3) {
				index = 1;
				pics.style.left = '0px';
			}
			if(index == 1){
				button[0].style.backgroundColor = "rgba(0,0,0,0.3)";
				button[1].style.backgroundColor = "rgba(255,255,255,0.5)"
			}else{
				button[0].style.backgroundColor = ""
				button[1].style.backgroundColor = ""
			}
			move(pics, -1060 * index, -10);
		}, 4000);
	};
	change();
}