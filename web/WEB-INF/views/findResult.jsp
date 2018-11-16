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
        });
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
            padding-top: 10px;
            padding-left: 50px;
        }

    </style>
</head>

<body>
<%@include file="head.jsp" %>

<div class="container leixingdaohang">
    &nbsp;&nbsp;<b style="color: #767575;font-size: 1.1em;float: left;line-height: 30px">您的查询信息为：${searchKye}</b><br><br>
    &nbsp;&nbsp;<b style="color: #767575;font-size: 1.5em;float: left;line-height: 30px">查询结果为：找到${movielist.size()}个符合条件的电影</b>
</div>
<div style="min-width: 768px;min-height: 610px" class="container">
    <div class="row">
        <div class="shouye-xia">
            <c:choose>
                <c:when test="${empty movielist}">
                    抱歉，未查询到您输入的电影信息......
                </c:when>
                <c:otherwise>
                    <c:forEach items="${movielist}" var="movielist">
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
</div>
<%@include file="foot.jsp" %>
</body>
</html>