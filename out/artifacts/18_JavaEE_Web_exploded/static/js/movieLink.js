var jq = jQuery.noConflict();
jq(document).ready(function () {
    jq(".shouye-xiadaohang-1").each(function () {
        var aaa=jq(this).find('a');
        var movieImg=jq(this).find('img');
        aaa.attr("href","singlemovie?movieId="+movieImg.attr("name"));
    });
});