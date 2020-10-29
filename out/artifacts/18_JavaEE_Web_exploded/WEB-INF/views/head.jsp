<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextpath" value="${pageContext.request.contextPath}"/>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation" style="min-width: 1030px">
    <div class="container-fluid">
        <div class="navbar-header" style="min-height: 0px;height: 70px">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#example-navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="index" style="margin-left: 120px"><img src="${contextpath}/static/img/logo/logo5.png"
                                                            style="height: 70px;width: 200px;border-radius: 1px 30px"></a>
        </div>
        <div class="collapse navbar-collapse">
            <div style="height: 70px;">
                <ul class="nav navbar-nav" id="top-menu" style="min-height: 0px;height: 70px;line-height: 70px">
                    <li><a href="index" style="font-size: 1.2em;margin-top: 10px;margin-left: 30px;">主页</a></li>
                    <li><a href="movie" style="font-size: 1.2em;margin-top: 10px;margin-left: 30px;">电影</a></li>
                </ul>
                <form class="navbar-form navbar-left" role="search" style="margin-top: 18px;margin-left: 40px;" id="searchmovieForm" method="get" action="searchmovie" onsubmit="return checksubmit()">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="请输入电影名" name="movielikelyname" id="searchmovielikelyname" value="">
                    </div>
                    <button type="submit" class="btn btn-default">查找</button>
                </form>
                <div>
                    <ul class="nav navbar-nav navbar-right">
                        <c:choose>
                            <c:when test="${nowUser==null}">
                                <li><a href="#" data-toggle="modal" data-target="#loginRegister"
                                       id="loginandregister" style="margin-top: 10px"><span
                                        class="glyphicon glyphicon-log-in"></span> 登录 注册 </a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="margin-top: 10px">
                                        <div style="width: 50px;height: 50px;float: left;margin-top: -15px;background: url(${nowUser.getTouxiang()});background-size: cover;border-radius: 25px"></div>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <c:out value="${nowUser.getUsername()}"/> <b
                                            class="caret"></b>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#" data-toggle="modal" data-target="#usermessage"><span
                                                class="glyphicon glyphicon-pencil"></span>&nbsp;&nbsp;&nbsp;&nbsp;个人信息</a>
                                        </li>
                                        <li class="divider"></li>
                                        <li onclick="opengouwuche()"><a data-toggle="modal"
                                                                        data-target="#gouwucheModal"><span
                                                class="glyphicon glyphicon-shopping-cart"></span>&nbsp;&nbsp;&nbsp;&nbsp;购物车</a>
                                        </li>
                                        <li class="divider"></li>
                                        <li><a href="#" id="zhuxiao"><span class="glyphicon glyphicon-off"></span>&nbsp;&nbsp;&nbsp;&nbsp;注销</a>
                                        </li>
                                    </ul>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</nav>
<script type="text/javascript">
    var jq = jQuery.noConflict();
    function checksubmit() {
        if(jq("#searchmovielikelyname").val()==""){
            bootoast({
                message: '请输入查询信息',
                type: 'warning',
                position: 'top',
                timeout: 1
            });
            return false;
        }
        return true;
    }
    
    function opengouwuche() {
        jq.ajax({
            url: "gouwuche?username=${nowUser.getUsername()}",
            //url:"1.json",
            type: "post",
            async: false,
            traditional: true,
            datatype: 'json',
            success: function (data) {
                var jsonObj=jq.parseJSON(data);
                if(jsonObj==null){
                    jq("#goupiaoqingdan").html("您还未购买任何电影票");
                }else {
                    jq("#goupiaoqingdan").html(jsonObj.tickets);
                    jq("#finalPay").text(jsonObj.finalPay);
                }
            },
            error: function () {
                bootoast({
                    message: '系统繁忙，请稍后再试',
                    type: 'danger',
                    position: 'right-bottom',
                    timeout: 1
                });
            }
        });
    }
</script>
<%@ include file="loginAndregister.jsp" %>
<%@ include file="message.jsp" %>
<%@ include file="gouwuche.jsp" %>