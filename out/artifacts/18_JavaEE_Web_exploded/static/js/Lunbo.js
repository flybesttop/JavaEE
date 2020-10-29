var jq = jQuery.noConflict();
var index = 0;
var timer = null;
var libox = document.getElementsByName("imgli");
var container = jq("#shouye-zhengwen-right");
var img = document.getElementsByName("pic");
var left = jq("#leftanniu");
var right = jq("#rightanniu");

for (var i = 0; i < libox.length; i++) {
    img[i].style.display = "none";
    //jq(img[i]).slideUp("slow");
    libox[i].className = "";
}
img[index].style.display = "block";
//jq(img[index]).slideDown("slow");
libox[index].className = "on";

left.click(function(){
    index--;
    if (index < 0) {
        index = libox.length - 1;
    }
    xunhuan();
});

right.click(function(){
    tupianxunhuanzhuanhuan()
});

for (var i = 0; i < libox.length; i++) {
    libox[i].num = i;
    libox[i].onclick = function () {
        index = this.num;
        xunhuan();
    }
}

function xunhuan() {
    for (var i = 0; i < libox.length; i++) {
        jq(img[i]).slideUp("slow");
        libox[i].className = "";
    }
    jq(img[index]).slideDown("slow");
    libox[index].className = "on";
}

function tupianxunhuanzhuanhuan() {
    index++;
    if (index >= libox.length) {
        index = 0;
    }
    xunhuan();
}

container.mouseover(function(){
    clearInterval(timer);
});

container.mouseout(function(){
    timer = setInterval("tupianxunhuanzhuanhuan()", 8000);
});
timer = setInterval("tupianxunhuanzhuanhuan()", 8000);