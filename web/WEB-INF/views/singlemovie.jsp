<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextpath" value="${pageContext.request.contextPath}"/>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>时影社</title>
    <script src="${contextpath}/static/JQuery/jquery.js"></script>
    <link rel="stylesheet" href="${contextpath}/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="${contextpath}/static/css/bootoast.css">
    <link  rel="stylesheet" href="${contextpath}/static/css/main.css" />
    <link rel="stylesheet" type="text/css" href="${contextpath}/static/css/sinaFaceAndEffec.css" />
    <script src="${contextpath}/static/js/bootstrap.min.js"></script>
    <script src="${contextpath}/static/js/bootoast.js"></script>
    <script src="${contextpath}/static/js/movieLink.js"></script>
    <script type="text/javascript">

        var jq = jQuery.noConflict();
        jq(document).ready(function () {
            jq("#tijiaopingfen").click(function () {
                jq.ajax({
                    url: "pingfen",
                    type: "post",
                    async: false,
                    traditional: true,
                    data: jq("#pingfenform").serialize(),
                    datatype: "text",
                    success: function () {
                        alert("评分成功");
                        window.location.reload();
                    },
                    error: function () {
                        bootoast({
                            message: '系统繁忙，请稍后再试',
                            type: 'danger',
                            position:'right-bottom',
                            timeout:1
                        });
                    }
                });
            });
            jq("#liuyantijiao").click(function () {
                jq.ajax({
                    url: "liuyan",
                    type: "post",
                    async: false,
                    traditional: true,
                    data: jq("#messageBoardForm").serialize(),
                    datatype: "text",
                    success: function () {
                        alert("留言成功");
                        window.location.reload();
                    },
                    error: function () {
                        bootoast({
                            message: '系统繁忙，请稍后再试',
                            type: 'danger',
                            position:'right-bottom',
                            timeout:1
                        });
                    }
                });
            });
            jq("#jieshao").click(function () {
                jq("#jieshao").attr({
                    size: "5em",
                    color: "red"
                });
                jq("#pinglun").attr({
                    size: "4em",
                    color: "black"
                });
                jq("#payMoviePage").attr({
                    size: "4em",
                    color: "black"
                });
                jq("#jianjiediv").slideDown("slow");
                jq("#pinglundiv").css("display", "none");
                jq("#payMoviePageDiv").css("display", "none");
            });
            // jq("#changenight").click(function(){
            // 	jq("#topbak").css({
            // 		"background":"url(static/img/anbeijing1.jpg)no-repeat",
            // 		"background-size":"100% 100%",
            // 		"background-attachment":"fixed"
            // 	});
            // 	jq("#changenight").css("display","none");
            // 	jq("#changeday").css("display","block");
            // 	jq("body").css({
            // 		"color":"white",
            // 		"background-color":"#6B6B6B"
            // 	});
            // 	jq(".hongseshugang").css("color","lightblue");
            // });
            // jq("#changeday").click(function(){
            // 	jq("#topbak").css({
            // 		"background":"url(static/img/beijing1.jpg)no-repeat",
            // 		"background-size":"100% 100%",
            // 		"background-attachment":"fixed"
            // 	});
            // 	jq("#changenight").css("display","block");
            // 	jq("#changeday").css("display","none");
            // 	jq("body").css({
            // 		"color":"black",
            // 		"background-color":"white"
            // 	});
            // 	jq(".hongseshugang").css("color","red");
            // });
            var stars = jq(".modal-body").find(".glyphicon-star-empty");
            jq(".glyphicon-star-empty").each(function (i) {
                jq(this).click(function () {
                    jq("#tijiaoscore").attr("value", i + 1);
                    jq("#pingfenfengshu").text(i + 1);
                    for (var j = 0; j < 5; j++) {
                        jq(stars[j]).css("color", "black");
                    }
                    for (var k = 0; k < i + 1; k++) {
                        jq(stars[k]).css("color", "gold");
                    }
                });
            });
        });

        function pinglun() {
            jq("#jieshao").attr({
                size: "4em",
                color: "black"
            });
            jq("#pinglun").attr({
                size: "5em",
                color: "red"
            });
            //jq("#jianjiediv").slideUp("slow");
            jq("#jianjiediv").css("display", "none");
            jq("#pinglundiv").slideDown("slow");
//            jq("#pinglundiv").css("display", "block");
            jq("#payMoviePage").attr({
                size: "4em",
                color: "black"
            });
            jq("#payMoviePageDiv").css("display", "none");
        }

        function goupiao() {
            jq("#jieshao").attr({
                size: "4em",
                color: "black"
            });
            jq("#pinglun").attr({
                size: "4em",
                color: "black"
            });
            jq("#jianjiediv").css("display", "none");
            jq("#pinglundiv").css("display", "none");
            jq("#payMoviePage").attr({
                size: "5em",
                color: "red"
            });
            jq("#payMoviePageDiv").slideDown("slow");
        }

        function nologin() {
            bootoast({
                message: '您还未登录请您先登录',
                type: 'danger',
                position:'top',
                timeout:1
            });
        }

        function prewPage() {
            var nextpage = jq("#pageSelect option:selected").val();
            nextpage = nextpage * 1 - 1;
            jq("#pageSelect").find("option[value=" + nextpage + "]").attr("selected", true);
            jq("#pageForm").submit();
        }

        function nextPage() {
            var nextpage = jq("#pageSelect option:selected").val();
            nextpage = nextpage * 1 + 1;
            jq("#pageSelect").find("option[value=" + nextpage + "]").attr("selected", true);
            jq("#pageForm").submit();
        }

        function changePage() {
            jq("#pageForm").submit();
        }

        function juchangzuowei(obj) {
            if (jq(obj).attr("IsClicked") == '0') {
                jq(obj).attr("src", "${contextpath}/static/img/seat/seat2.png");
                jq(obj).attr("IsClicked", '1');

            } else if (jq(obj).attr("IsClicked") == '1') {
                jq(obj).attr("src", "${contextpath}/static/img/seat/seat1.png");
                jq(obj).attr("IsClicked", '0');
            }
//            console.log(seatIds);
            //alert(jq(obj).attr("seatNum"));
            var row = Math.floor(jq(obj).attr("seatNum") / 12) + 1;
            var column = jq(obj).attr("seatNum") % 12;
            if (column == 0) {
                row = row - 1;
                column = 12;
            }
            jq("#seatrow" + jq(obj).attr("moviejuchangtingmu")).text(" " + row);
            jq("#seatcolumn" + jq(obj).attr("moviejuchangtingmu")).text(" " + column);
        }

        function xuanzuogoupiao(obj) {
            jq.ajax({
                url: "zuoweixinxi?movieTingmuId=" + jq(obj).attr("movieTingmuId"),
                type: "post",
                async: false,
                traditional: true,
                success: function (data) {
                    var seat = JSON.parse(data);
                    jq("#zuoweixinxi" + jq(obj).attr("movieTingmuId")).html(seat);
                },
                error: function () {
                    bootoast({
                        message: '系统繁忙，请稍后再试',
                        type: 'danger',
                        position:'right-bottom',
                        timeout:1
                    });
                }
            });
        }
    </script>
    <style type="text/css">
        @import url("${contextpath}/static/css/index.css");

        .juchangzuowei:hover {
            cursor: pointer;
            user-select: none;
        }

        .changtiaoxuxian {
            height: 0.01px;
            width: 100%;
            margin: 10px auto 10px auto;
            border: solid;
            border-width: thin;
            border-color: rgbA(0, 0, 0, 0.2);
        }

        .jieshaopinglun:hover {
            cursor: pointer;
            user-select: none;
        }

        /*.changestyle{
            width: 66px;
            position: fixed;
            bottom: 20px;
            right: 25px;
            z-index: 100;
            height: 66px;
            color:white;
            background-color: black;
            border-radius: 33px;
            text-align: center;
            line-height: 66px;
            font-weight: bold;
        }
        .changestyle:hover{
            cursor: pointer;
            user-select: none;
            }*/
        .hongseshugang {
            font-weight: bold;
            color: red;
            font-size: 1.5em;
        }
    </style>
</head>

<body>
<%@include file="head.jsp" %>

<div style="width: 100%;height: 410px;background: url(${contextpath}/static/img/other/anbeijing1.jpg)no-repeat;background-size: 100% 100%;padding-top: 100px;min-width: 768px;background-attachment: fixed;"
     id="topbak">
    <div style="width: 768px;margin: auto;">
        <div style="height: 320px;width: 240px;background-color: white;box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.3);padding: 2px;float: left;">
            <img src="${contextpath}${movieMessage.movieHaibao}" alt="复仇者联盟3：无限战争"
                 style="height: 100%;width: 100%;">
        </div>
        <div style="margin-left: 30px;height: 250px;width: 430px;padding: 2px;float: left;position:relative;color: white;padding-left: 60px">
            <h2>${movieMessage.movieName}</h2>
            <h4>${movieMessage.movieEnglishName}</h4>
            <h7>${movieMessage.movieType}</h7>
            <br>
            <h7>${movieMessage.movieCountry} \ ${movieMessage.movieHowlong}</h7>
            <br>
            <h7 style="float: right;margin-top: -20px;">票价区间&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="gold" size="5">￥
                30~40</font></h7>
            <br>
            <br>
            <h7 style="float: right;margin-top: -25px;">用户评分&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="gold"
                                                                                                size="5">${movieScore}</font>
            </h7>
            <div style="height: 140px;width: 300px;float: left;padding-top: 25px;">
                <c:choose>
                    <c:when test="${nowUser.getUsername()!=null}">
                        <button style="float: left;width: 140px;height: 40px;" class="btn btn-primary"
                                data-toggle="modal" data-target="#pingfeng"><span
                                class="glyphicon glyphicon-heart"></span>&nbsp;&nbsp;评分
                        </button>
                        <button style="float: left;width: 140px;height: 40px;margin-left: 5px;" class="btn btn-primary"
                                id="pingjiaBtn" onclick="pinglun()"><span
                                class="glyphicon glyphicon-pencil"></span>&nbsp;&nbsp;评价
                        </button>
                        <button style="width: 285px;height: 40px;margin-top: 5px;" class="btn btn-danger"
                                onclick="goupiao()"><span
                                class="glyphicon glyphicon-shopping-cart"></span>&nbsp;&nbsp;购票
                        </button>
                    </c:when>
                    <c:otherwise>
                        <button style="float: left;width: 140px;height: 40px;" class="btn btn-primary"
                                onclick="nologin()"><span
                                class="glyphicon glyphicon-heart"></span>&nbsp;&nbsp;评分
                        </button>
                        <button style="float: left;width: 140px;height: 40px;margin-left: 5px;" class="btn btn-primary"
                                id="pingjiaBtn" onclick="nologin()"><span
                                class="glyphicon glyphicon-pencil"></span>&nbsp;&nbsp;评价
                        </button>
                        <button style="width: 285px;height: 40px;margin-top: 5px;" class="btn btn-danger"
                                onclick="nologin()"><span
                                class="glyphicon glyphicon-shopping-cart"></span>&nbsp;&nbsp;购票
                        </button>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="pingfeng" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <div style="width: 100%;height: 150px;padding-top: 30px;text-align: center;">
                    <form id="pingfenform" method="post">
                        <font style="color: gold;font-size: 3em;font-style: italic;" id="pingfenfengshu"></font>
                        <br>
                        <span class="glyphicon glyphicon-star-empty"
                              style="font-size: 2.5em;margin-left: 20px;margin-right: 20px;"></span>
                        <span class="glyphicon glyphicon-star-empty"
                              style="font-size: 2.5em;margin-left: 20px;margin-right: 20px;"></span>
                        <span class="glyphicon glyphicon-star-empty"
                              style="font-size: 2.5em;margin-left: 20px;margin-right: 20px;"></span>
                        <span class="glyphicon glyphicon-star-empty"
                              style="font-size: 2.5em;margin-left: 20px;margin-right: 20px;"></span>
                        <span class="glyphicon glyphicon-star-empty"
                              style="font-size: 2.5em;margin-left: 20px;margin-right: 20px;"></span>
                        <input type="hidden" name="username" value="${nowUser.getUsername()}">
                        <input type="hidden" name="movieId" value="${movieMessage.id}">
                        <input type="hidden" name="score" id="tijiaoscore" value="">
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="tijiaopingfen">提交评分</button>
            </div>
        </div>
    </div>
</div>
<div style="min-height:580px;width: 1200px;margin: auto;padding-top: 60px;padding-left: 100px;padding-right: 100px;">
    <font size="5em" color="red" id="jieshao" class="jieshaopinglun">介绍</font>
    <c:if test="${nowUser.getUsername()!=null}">
        <font size="4em" style="margin-left: 200px;" id="pinglun" class="jieshaopinglun"
              onclick="pinglun()">评论</font>
    </c:if>
    <c:if test="${nowUser.getUsername()!=null}">
        <font size="4em" style="margin-left: 200px;" id="payMoviePage" class="jieshaopinglun"
              onclick="goupiao()">购票</font>
    </c:if>
    <div class="changtiaoxuxian"></div>
    <div id="jianjiediv" style="display: block;">
        <span class="hongseshugang">|</span>&nbsp;&nbsp;<font size="4em">剧情简介</font>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;${movieMessage.movieContext}</p>
        <span class="hongseshugang">|</span>&nbsp;&nbsp;<font size="4em">短评</font><br><br>
        <c:choose>
            <c:when test="${empty contextList}">
                还没有任何关于该电影的评论......
            </c:when>
            <c:otherwise>
                <c:forEach items="${contextList}" var="contextlists">
                    <div style="width: 60px;float: left;height: 60px;border-radius: 30px;background: url(${contextpath}${contextlists.userTouxiang});background-size: 100% 100%;margin-top: 20px;"></div>
                    <div style="width: 940px;float: left;margin-top: 20px;margin-bottom: 20px;padding-left: 50px;">
                        <span style="font-weight: bold;color: lightblue;font-size: 1.5em">|</span>&nbsp;&nbsp;<font
                            size="5em">${contextlists.username}</font><br>
                        &nbsp;&nbsp;&nbsp;&nbsp;<font size="2em" color="#828181">${contextlists.publishTime}</font>
                        <p>${contextlists.context}</p>
                    </div>
                    <div class="changtiaoxuxian" style="float: left;"></div>
                </c:forEach>
                <ul class="pager">
                    <c:choose>
                        <c:when test="${page.hasPrev}">
                            <li class="previous" onclick="prewPage()"><a>&larr; 上一页</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="previous disabled"><a>&larr; 上一页</a></li>
                        </c:otherwise>
                    </c:choose>
                    <form role="form" style="float: left;" id="pageForm" method="get">
                        <div class="form-group">
                            <select class="form-control" style="width:70px;margin-left: 380px" id="pageSelect"
                                    name="pageNum" onchange="changePage()">
                                <c:forEach var="a" end="${page.maxPage}" begin="1">
                                    <%--<option>${a}</option>--%>
                                    <c:choose>
                                        <c:when test="${page.page==a}">
                                            <option selected value="${a}">${a}</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${a}">${a}</option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                        </div>
                        <input type="hidden" name="movieId" value="${movieMessage.id}">
                    </form>
                    <c:choose>
                        <c:when test="${page.hasNext}">
                            <li class="next" onclick="nextPage()"><a>下一页 &rarr;</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="next disabled"><a>下一页 &rarr;</a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </c:otherwise>
        </c:choose>
    </div>
    <div style="display: none;" id="pinglundiv">
        <div style="width: 60px;float: left;height: 60px;border-radius: 30px;background: url(${contextpath}${nowUser.getTouxiang()});background-size: 100% 100%;margin-top: 20px;"></div>
        <div style="width: 940px;float: left;margin-top: 20px;margin-bottom: 20px;padding-left: 50px;">
            <span class="glyphicon glyphicon-pencil"></span>&nbsp;&nbsp;<font size="5em">写短评</font><br>
            &nbsp;&nbsp;&nbsp;&nbsp;<font size="2em" color="#828181">${nowUser.getUsername()}</font>
            <br>
            <br>
            <form method="post" role="form" id="messageBoardForm">
                <textarea style="width: 820px;height: 300px;resize: none;" placeholder="对这个电影您有什么独到的见解呢？写出来与大家一起分享分享！"
                          class="form-control" name="message"></textarea>
                    <%--<div class="content">--%>
                        <%--<div class="cont-box">--%>
                            <%--<textarea class="text" placeholder="请输入..." name="message"></textarea>--%>
                        <%--</div>--%>
                        <%--<div class="tools-box">--%>
                            <%--<div class="operator-box-btn"><span class="face-icon"  >☺</span></div>--%>
                            <%--<div class="submit-btn"><input type="button" name="liuyantijiao" onClick="out()" value="提交评论" id="liuyantijiao"></div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <input type="hidden" name="username" value="${nowUser.getUsername()}">
                <input type="hidden" name="movieId" value="${movieMessage.id}">
                <input type="hidden" name="userTouxiang" value="${nowUser.getTouxiang()}">
                <input type="button" name="liuyantijiao" id="liuyantijiao" class="btn btn-danger" value="提交"
                       style="width: 100px;margin-left: 730px;margin-top: 5px">
            </form>
        </div>
    </div>
    <div style="display: none;" id="payMoviePageDiv">
        <span class="hongseshugang">|</span>&nbsp;&nbsp;<font size="4em">影院列表</font><br><br>
        <c:choose>
            <c:when test="${empty moviejuchangtingList}">
                还没有任何关于该电影的影院信息......
            </c:when>
            <c:otherwise>
                <c:forEach items="${moviejuchangtingList}" var="moviejuchangtingLists">
                    <div style="height: 90px;">
                        <div style="height: 90px;padding-top: 10px;float: left">
                            <font style="font-size: 1.5em;">${moviejuchangtingLists.juchang}</font><br>
                            <font style="color: #5e5e5e">时间：${moviejuchangtingLists.showtime}<br>
                                厅目：${moviejuchangtingLists.tingmu}&nbsp;&nbsp;&nbsp;&nbsp;类型：${moviejuchangtingLists.type}
                            </font>
                        </div>
                        <div style="float: right;width: 200px;height: 90px;line-height: 90px">
                            <font style="font-size: 1.5em;color: orangered;">￥${moviejuchangtingLists.price}</font>
                            <button class="btn btn-danger pull-right" style="margin-top: 27px" data-toggle="modal"
                                    data-target="#moviejuchangting${moviejuchangtingLists.id}"
                                    movieTingmuId="${moviejuchangtingLists.id}" onclick="xuanzuogoupiao(this)">选座购票
                            </button>
                        </div>
                    </div>
                    <div class="changtiaoxuxian"></div>
                    <div class="modal fade" id="moviejuchangting${moviejuchangtingLists.id}" tabindex="-1" role="dialog"
                         aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                        &times;
                                    </button>
                                    <h4 class="modal-title" id="xuanzuogoupiao${moviejuchangtingLists.id}">选座购票</h4>
                                </div>
                                <div class="modal-body" style="height: 390px">
                                    <div style="margin-left:30px;float: left">
                                        <font style="font-size: 1.5em;">${moviejuchangtingLists.juchang}</font><br>
                                        <font style="color: #5e5e5e">时间：${moviejuchangtingLists.showtime}<br>
                                            厅目：${moviejuchangtingLists.tingmu}&nbsp;&nbsp;&nbsp;&nbsp;类型：${moviejuchangtingLists.type}
                                        </font>
                                        <font style="font-size: 1.5em;color: orangered;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;￥${moviejuchangtingLists.price}</font>
                                        <div style="float: right;height: 50px;width: 150px;margin-top: -35px;line-height: 50px"
                                             id="zuoweirowlinehao${moviejuchangtingLists.id}">
                                            <font style="font-size: 2em;color: red;font-style: italic;"
                                                  id="seatrow${moviejuchangtingLists.id}">&nbsp;&nbsp;&nbsp;&nbsp;</font>排<font
                                                style="font-size: 1.2em;color: red;font-style: italic;"
                                                id="seatcolumn${moviejuchangtingLists.id}">&nbsp;&nbsp;&nbsp;&nbsp;</font>坐
                                        </div>
                                        <div style="width: 506px;height: 300px;padding-top: 30px"
                                             id="zuoweixinxi${moviejuchangtingLists.id}">
                                                <%--<c:forEach var="i" begin="1" end="72">--%>
                                                <%--<div style="width: 42px;height: 42px;padding:6px;float: left;"><img src="${contextpath}/static/img/seat/seat1.png" class="juchangzuowei juchangzuowei${moviejuchangtingLists.id}" onclick="juchangzuowei(this)" style="height: 100%;width: 100%" seatNum="${i}" IsClicked='0'></div>--%>
                                                <%--</c:forEach>--%>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <form id="gouwuMessage${moviejuchangtingLists.id}">
                                        <input type="hidden" name="seatIds" id="seatIds${moviejuchangtingLists.id}">
                                        <input type="hidden" name="username" value="${nowUser.getUsername()}">
                                        <input type="hidden" name="movieTingmuId" value="${moviejuchangtingLists.id}">
                                    </form>
                                    <button type="button" class="btn btn-primary"
                                            movieTingmuId="${moviejuchangtingLists.id}" onclick="tijiaoxuanzuo(this)">
                                        确认购买
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>

    <div style="clear: both"></div>
</div>
<!-- <div class="changestyle" id="changenight" style="display: block;">夜间模式</div>
    <div class="changestyle" id="changeday" style="display: none;">白天模式</div> -->
<%@include file="foot.jsp" %>
</body>
<script type="text/javascript" src="${contextpath}/static/js/main.js"></script>
<script type="text/javascript" src="${contextpath}/static/js/sinaFaceAndEffec.js"></script>
<script type="text/javascript">
    var jq = jQuery.noConflict();
    // 绑定表情
    jq('.face-icon').SinaEmotion(jq('.text'));
    // 测试本地解析
    function out() {
        var inputText = jq('.text').val();
//        $('#info-show ul').append(reply(AnalyticEmotion(inputText)));
    }

    var html;
    function reply(content){
        html  = '<li>';
        html += '<div class="head-face">';
        html += '<img src="images/1.jpg" / >';
        html += '</div>';
        html += '<div class="reply-cont">';
        html += '<p class="username">小小红色飞机</p>';
        html += '<p class="comment-body">'+content+'</p>';
        html += '<p class="comment-footer">2016年10月5日　回复　点赞54　转发12</p>';
        html += '</div>';
        html += '</li>';
        return html;
    }
</script>
<script type="text/javascript">
    function tijiaoxuanzuo(obj) {
        var seatIds = "";
        jq(".juchangzuowei" + jq(obj).attr("movieTingmuId")).each(function () {
            if (jq(this).attr("IsClicked") == '1') {
                seatIds = seatIds + " " + jq(this).attr("seatNum");
            }
        });
        if (seatIds != "") {
            jq("#seatIds" + jq(obj).attr("movieTingmuId")).attr("value", seatIds);
            jq.ajax({
                url: "jiarugouwuche",
                type: "post",
                async: false,
                traditional: true,
                data: jq("#gouwuMessage" + jq(obj).attr("movieTingmuId")).serialize(),
                success: function () {
                    alert("请扫描页面底部的二维码。。。。。。恭喜您已成功购买");
                    window.location.reload();
                },
                error: function () {
                    bootoast({
                        message: '系统繁忙，请稍后重试',
                        type: 'warning',
                        position:'right-bottom',
                        timeout:1
                    });
                }
            });
        }
    }
</script>
<script type="text/javascript" src="${contextpath}/static/js/mainDo.js"></script>
</html>