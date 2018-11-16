<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextpath" value="${pageContext.request.contextPath}"/>
<html>
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
    <script type="text/javascript">

    </script>
    <style type="text/css">
        @import url("${contextpath}/static/css/index.css");
    </style>
</head>

<body>
<%@ include file="head.jsp" %>


<div style="margin-top: 70px;min-width: 768px;" class="container">
    <div class="row">
        <div class="col-md-12 col-sm-12 col-lg-12 col-xs-12">
            <div id="shouye-zhengwen">
                <div id="shouye-zhengwen-right">
                    <div class="xuanchaunyemian">
                        <a href="singlemovie?movieId=24"><img src="${contextpath}/static/img/other/honghaixingdong.jpg"
                                                              name="pic"></a>
                        <a href="singlemovie?movieId=23"><img src="${contextpath}/static/img/other/bahuoliwang.jpg"
                                                              name="pic"></a>
                        <a href="singlemovie?movieId=25"><img src="${contextpath}/static/img/other/zzj.jpg" name="pic"></a>
                    </div>
                    <center>
                        <div class="ul">
                            <ul>
                                <li name="imgli"></li>
                                <li name="imgli"></li>
                                <li name="imgli"></li>
                            </ul>
                        </div>
                    </center>
                    <div class="leftnaniu" id="leftanniu">
                        <
                    </div>
                    <div class="rightnaniu" id="rightanniu">
                        >
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div style="min-width: 768px" class="container">
    <div class="row">
        <div class="shouye-xia">
            <h3 style="text-shadow:orange 5px 3px 3px; margin-left:100px;font-family: 微软雅黑;color:red;">正在热映</h3>
            <a href="movie?movietype=1" style="float: right;margin-right: 50px;margin-top: -35px">查看全部 ></a>
            <c:forEach items="${showingMovie}" var="showingmovies">
                <div class="shouye-xiadaohang">
                    <div class="shouye-xiadaohang-1">
                        <a href="#"><img src="${contextpath}${showingmovies.movieHaibao}"
                                         style="width: 100%;height: 260px;" name="${showingmovies.id}"></a>
                        <a href="#">
                            <div class="shouye-xiadaohang-2">查看信息</div>
                        </a>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div style="width:66%;margin-top: 20px;height: 730px;padding-top: 1px;border-radius: 20px;box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.3);float: left;margin-left: 20px">
            <h3 style="text-shadow:darkgrey 5px 3px 3px; margin-left:100px;font-family: 微软雅黑;color:black;">经典影片</h3>
            <a href="movie?movietype=13" style="float: right;margin-right: 50px;margin-top: -35px">查看全部 ></a>
            <c:forEach items="${niceMovie}" var="nicemovies">
                <div class="shouye-xiadaohang" style="width: 33%">
                    <div class="shouye-xiadaohang-1">
                        <a href="#"><img src="${contextpath}${nicemovies.movieHaibao}"
                                         style="width: 100%;height: 260px;" name="${nicemovies.id}"></a>
                        <a href="#">
                            <div class="shouye-xiadaohang-2">查看信息</div>
                        </a>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div style="width:29%;margin-top: 20px;height: 730px;padding-top: 1px;border-radius: 20px;box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.3);float: right;margin-right: 20px;overflow-y: auto">
            <h5 style="margin-left:150px;font-family: 微软雅黑;color:black;float: left;margin-top: 30px">用户评分</h5>
            <h3 style="text-shadow:darkgrey 5px 3px 3px; margin-right:30px;font-family: 微软雅黑;color:gold;float: right;font-style: italic">
                TOP 10</h3>
            <div style="margin-top: 80px;padding-left: 10px;width: 100%;padding-right: 10px;">
                <table class="table table-hover">
                    <c:forEach items="${top10movie}" var="topmovie" varStatus="con">
                    <tr style="width: 100%;height: 45px;">
                        <th style="width: 50px;line-height: 45px">
                            <font style="color:gray;font-size: 1.75em;font-style: italic;">${con.count}</font>
                        </th>
                        <td width="75%" style="line-height: 45px;overflow: hidden">
                            <a href="singlemovie?movieId=${topmovie.movieId}">${topmovie.moviename}</a>
                        </td>
                        <td style="font-size: 1.5em;color: gold;font-style: italic;line-height: 45px;">
                            ${topmovie.avg}
                        </td>
                    </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
</div>
<%@ include file="foot.jsp" %>
</body>
<script type="text/javascript" src="${contextpath}/static/js/Lunbo.js"></script>
<script type="text/javascript" src="${contextpath}/static/js/mainDo.js"></script>
</html>
