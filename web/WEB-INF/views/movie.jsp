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
    <script src="${contextpath}/static/js/bootstrap.min.js"></script>
    <script src="${contextpath}/static/js/bootoast.js"></script>
    <script src="${contextpath}/static/js/movieLink.js"></script>
    <script type="text/javascript" src="${contextpath}/static/js/mainDo.js"></script>
    <script type="text/javascript">
        var jq = jQuery.noConflict();
        jq(document).ready(function () {
            jq(".leixingdaohangxuanxiang").each(function () {
                jq(this).css({background: 'white', color: 'black'});
                if (jq(this).attr("typeId") ==${movietypeId}) {
                    jq(this).css({background: 'orange', color: 'white'});
                }
            });
        });
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
    </script>
    <style type="text/css">
        @import url("${contextpath}/static/css/moviecss.css");

        .leixingdaohang {
            margin-top: 115px;
            min-width: 768px;
            height: 100px;
            border-radius: 15px;
            box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.3);
            border-color: black;
            background-color: white;
            padding: 20px;
        }

    </style>
</head>

<body>
<%@include file="head.jsp" %>

<div class="container leixingdaohang">
    &nbsp;&nbsp;<b style="color: #767575;font-size: 1.1em;float: left;line-height: 30px"> 类型 : </b>
    <div class="leixingdaohangnei">
        <a href="movie?movietype=0">
            <div class="leixingdaohangxuanxiang" typeId="0">全部</div>
        </a>
        <a href="movie?movietype=13">
            <div class="leixingdaohangxuanxiang" typeId="13">经典</div>
        </a>
        <a href="movie?movietype=2">
            <div class="leixingdaohangxuanxiang" typeId="2">爱情</div>
        </a>
        <a href="movie?movietype=3">
            <div class="leixingdaohangxuanxiang" typeId="3">喜剧</div>
        </a>
        <a href="movie?movietype=4">
            <div class="leixingdaohangxuanxiang" typeId="4">动画</div>
        </a>
        <a href="movie?movietype=5">
            <div class="leixingdaohangxuanxiang" typeId="5">惊悚</div>
        </a>
        <a href="movie?movietype=6">
            <div class="leixingdaohangxuanxiang" typeId="6">科幻</div>
        </a>
        <a href="movie?movietype=7">
            <div class="leixingdaohangxuanxiang" typeId="7">动作</div>
        </a>
        <a href="movie?movietype=8">
            <div class="leixingdaohangxuanxiang" typeId="8">悬疑</div>
        </a>
        <a href="movie?movietype=9">
            <div class="leixingdaohangxuanxiang" typeId="9">犯罪</div>
        </a>
        <a href="movie?movietype=10">
            <div class="leixingdaohangxuanxiang" typeId="10">冒险</div>
        </a>
        <a href="movie?movietype=11">
            <div class="leixingdaohangxuanxiang" typeId="11">战争</div>
        </a>
        <a href="movie?movietype=12">
            <div class="leixingdaohangxuanxiang" typeId="12">奇幻</div>
        </a>
        <a href="movie?movietype=14">
            <div class="leixingdaohangxuanxiang" typeId="14">家庭</div>
        </a>
        <a href="movie?movietype=15">
            <div class="leixingdaohangxuanxiang" typeId="15">励志</div>
        </a>
        <a href="movie?movietype=16">
            <div class="leixingdaohangxuanxiang" typeId="16">古装</div>
        </a>
        <a href="movie?movietype=17">
            <div class="leixingdaohangxuanxiang" typeId="17">西部</div>
        </a>
        <a href="movie?movietype=18">
            <div class="leixingdaohangxuanxiang" typeId="18">其他</div>
        </a>
        <a href="movie?movietype=1">
            <div class="leixingdaohangxuanxiang" typeId="1">热映中</div>
        </a>
    </div>
</div>
<div style="min-width: 768px;min-height: 610px" class="container">
    <div class="row">
        <div class="shouye-xia">
            <c:choose>
                <c:when test="${empty movies}">
                    抱歉，还没有改本站还没有该类型的电影......
                </c:when>
                <c:otherwise>
                    <c:forEach items="${movies}" var="movielist">
                        <div class="shouye-xiadaohang">
                            <div class="shouye-xiadaohang-1">
                                <a href="#"><img src="${contextpath}${movielist.movieHaibao}"
                                                 style="width: 100%;height: 260px;" name="${movielist.id}"></a>
                                <a href="#">
                                    <div class="shouye-xiadaohang-2">查看信息</div>
                                </a>
                            </div>
                        </div>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    <br><br>
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
                <select class="form-control" style="width:70px;margin-left: 480px" id="pageSelect"
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
</div>
<%@include file="foot.jsp" %>
</body>
</html>