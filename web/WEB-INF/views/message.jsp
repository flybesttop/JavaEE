<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextpath" value="${pageContext.request.contextPath}"/>
<script type="text/javascript">

</script>
<div class="modal fade" id="usermessage" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true" id="closeMessage">×</button>
                <h4 class="modal-title" id="myMessage">个人信息</h4>
            </div>
            <div class="modal-body">
                <div style="width: 450px;height: 625px;margin: auto;">
                    <div style="height: 150px;width: 100%;">
                        <div id="myCarousel" class="carousel slide">
                            <!-- 轮播（Carousel）指标 -->
                            <ol class="carousel-indicators">
                                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                                <li data-target="#myCarousel" data-slide-to="1"></li>
                                <li data-target="#myCarousel" data-slide-to="2"></li>
                            </ol>
                            <!-- 轮播（Carousel）项目 -->
                            <div class="carousel-inner">
                                <div class="item active"
                                     style="height: 150px;width: 100%;background-color: yellow;padding-top: 110px;background: url(${contextpath}/static/img/other/banner1-3.jpg);background-size: 100% 100%;">
                                </div>
                                <div class="item"
                                     style="height: 150px;width: 100%;background-color: yellow;padding-top: 110px;background: url(${contextpath}/static/img/other/banner1-2.jpg);background-size: 100% 100%;">
                                </div>
                                <div class="item"
                                     style="height: 150px;width: 100%;background-color: yellow;padding-top: 110px;background: url(${contextpath}/static/img/other/banner1-1.jpg);background-size: 100% 100%;">
                                </div>
                            </div>
                            <!-- 轮播（Carousel）导航 -->
                            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                        <div style="height: 90px;width: 90px;border-radius: 45px;background-color:white;position: relative;margin-left: 40px;box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.3);padding: 2px;z-index: 2;margin-top: -45px;">
                            <a href="#">
                                <div style="height: 86px;width: 86px;border-radius: 43px;background: url(${nowUser.getTouxiang()});background-size: cover;"
                                     id="touxiangchange"></div>
                            </a>
                        </div>
                    </div>
                    <div style="width: 100%;margin-top: 10px;padding: 35px;height: 400px;background-color: white;box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.3);border-radius: 5px 70px;display: block; "
                         id="showmessage">
                        <img src="${contextpath}/static/img/other/biaoqian.jpg"
                             style="position: relative;margin:-35px auto auto 300px;z-index: 5;width: 50px;height: 80px;">
                        <table class="table" style="width: 100%;height: 100%;margin-top: -30px;table-layout: fixed;">
                            <tbody>
                            <tr>
                                <th width="30%" height="10%"><font color="#6F6E6E" style="font-weight: bold;">用 户
                                    名</font></th>
                                <td>${nowUser.getUsername()}</td>
                            </tr>
                            <tr>
                                <th><font color="#6F6E6E" style="font-weight: bold;">真 实 姓 名</font></th>
                                <td>${nowUser.getRealName()}</td>
                            </tr>
                            <tr>
                                <th><font color="#6F6E6E" style="font-weight: bold;">性 别</font></th>
                                <td>${nowUser.getSex()}</td>
                            </tr>
                            <tr>
                                <th><font color="#6F6E6E" style="font-weight: bold;">身份证号</font></th>
                                <td>${nowUser.getRealId()}</td>
                            </tr>
                            <tr>
                                <th><font color="#6F6E6E" style="font-weight: bold;">电 话 号 码</font></th>
                                <td>${nowUser.getPhone()}</td>
                            </tr>
                            <tr>
                                <th><font color="#6F6E6E" style="font-weight: bold;">邮 箱</font></th>
                                <td>${nowUser.getEmail()}</td>
                            </tr>
                            <tr>
                                <th><font color="#6F6E6E" style="font-weight: bold;">个 性 签 名</font></th>
                                <td height="40%">
                                    <div style="width: 100%;height: 100%;overflow: auto;">
                                        ${nowUser.getMessage()}
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div style="width: 100%;margin-top: 10px;padding: 35px;height: 400px;background-color: white;box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.3);border-radius: 5px 70px;display: none; "
                         id="updatemassage">
                        <form role="form" id="userMessageForm">
                            <input type="hidden" name="username" value="${nowUser.getUsername()}">
                            <table class="table" style="width: 100%;height: 100%;margin-top: 10px;table-layout: fixed;">
                                <tbody>
                                <tr>
                                    <th width="30%" height="10%"><font color="#6F6E6E" style="font-weight: bold;">用 户
                                        名</font></th>
                                    <td>
                                        <div class="form-group" style="height: 10px">
                                            <input type="text" class="form-control" value="${nowUser.getUsername()}"
                                                   disabled
                                                   style="height: 25px;width: 100px;">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th><font color="#6F6E6E" style="font-weight: bold;">修改密码</font></th>
                                    <td>
                                        <div class="form-group" style="height: 10px">
                                            <input type="password" class="form-control" value="${nowUser.getPassword()}" name="password"
                                                   style="height: 25px;width: 180px;float: left" id="cpassword">&nbsp;&nbsp;&nbsp;<span></span>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th><font color="#6F6E6E" style="font-weight: bold;">确认新密码</font></th>
                                    <td>
                                        <div class="form-group" style="height: 10px">
                                            <input type="password" class="form-control" value="${nowUser.getPassword()}"
                                                   style="height: 25px;width: 180px;float: left" id="cre-password">&nbsp;&nbsp;&nbsp;<span></span>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th><font color="#6F6E6E" style="font-weight: bold;">性 别</font></th>
                                    <td>
                                        <div class="form-group" style="height: 10px">
                                            <c:choose>
                                                <c:when test="${nowUser.getSex()=='男'}">
                                                    <label class="radio-inline">
                                                        <input type="radio" name="sex" value="男" checked> 男
                                                    </label>
                                                    <label class="radio-inline">
                                                        <input type="radio" name="sex" value="女"> 女
                                                    </label>
                                                </c:when>
                                                <c:otherwise>
                                                    <label class="radio-inline">
                                                        <input type="radio" name="sex" value="男"> 男
                                                    </label>
                                                    <label class="radio-inline">
                                                        <input type="radio" name="sex" value="女" checked> 女
                                                    </label>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th><font color="#6F6E6E" style="font-weight: bold;">修改号码</font></th>
                                    <td>
                                        <div class="form-group" style="height: 10px">
                                            <input type="number" class="form-control" value="${nowUser.getPhone()}" name="phone"
                                                   style="height: 25px;width: 180px;float: left;" id="cphonenumber">&nbsp;&nbsp;&nbsp;<span></span>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th><font color="#6F6E6E" style="font-weight: bold;">修改邮箱</font></th>
                                    <td>
                                        <div class="form-group" style="height: 10px">
                                            <input type="text" class="form-control" value="${nowUser.getEmail()}" name="email"
                                                   style="height: 25px;width: 180px;float: left" id="cemail">&nbsp;&nbsp;&nbsp;<span></span>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th height="40%"><font color="#6F6E6E" style="font-weight: bold;">个性签名</font>
                                    </th>
                                    <td>
                                        <div class="form-group" style="height: 10px">
                            <textarea class="form-control" rows="3" placeholder="留下属于您的个性签名！" name="userOwnMessage"
                                      style="resize: none;">${nowUser.getMessage()}</textarea>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </form>
                    </div>
                    <div style="width: 100%;margin-top: 10px;padding: 60px 35px 35px 35px;height: 400px;background-color: white;box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.3);border-radius: 5px 70px;display: none; "
                         id="updatetouxiang">
                        <form role="form" id="touxiangxuanzeform">
                            <div class="touxiangxuanze"
                                 style="width: 75px;height: 75px;float: left;margin:10px;background:url(${contextpath}/static/img/touxiang/touxiang1.jpg);background-size: cover;box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);"></div>
                            <div class="touxiangxuanze"
                                 style="width: 75px;height: 75px;float: left;margin:10px;background:url(${contextpath}/static/img/touxiang/touxiang2.jpg);background-size: cover;box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);"></div>
                            <div class="touxiangxuanze"
                                 style="width: 75px;height: 75px;float: left;margin:10px;background:url(${contextpath}/static/img/touxiang/touxiang3.jpg);background-size: cover;box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);"></div>
                            <div class="touxiangxuanze"
                                 style="width: 75px;height: 75px;float: left;margin:10px;background:url(${contextpath}/static/img/touxiang/touxiang4.jpg);background-size: cover;box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);"></div>
                            <div class="touxiangxuanze"
                                 style="width: 75px;height: 75px;float: left;margin:10px;background:url(${contextpath}/static/img/touxiang/touxiang5.jpg);background-size: cover;box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);"></div>
                            <div class="touxiangxuanze"
                                 style="width: 75px;height: 75px;float: left;margin:10px;background:url(${contextpath}/static/img/touxiang/touxiang6.jpg);background-size: cover;box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);"></div>
                            <div class="touxiangxuanze"
                                 style="width: 75px;height: 75px;float: left;margin:10px;background:url(${contextpath}/static/img/touxiang/touxiang7.jpg);background-size: cover;box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);"></div>
                            <div class="touxiangxuanze"
                                 style="width: 75px;height: 75px;float: left;margin:10px;background:url(${contextpath}/static/img/touxiang/touxiang8.jpg);background-size: cover;box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);"></div>
                            <div class="touxiangxuanze"
                                 style="width: 75px;height: 75px;float: left;margin:10px;background:url(${contextpath}/static/img/touxiang/touxiang9.jpg);background-size: cover;box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);"></div>
                            <div class="touxiangxuanze"
                                 style="width: 75px;height: 75px;float: left;margin:10px;background:url(${contextpath}/static/img/touxiang/touxiang10.jpg);background-size: cover;box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);"></div>
                            <div class="touxiangxuanze"
                                 style="width: 75px;height: 75px;float: left;margin:10px;background:url(${contextpath}/static/img/touxiang/touxiang11.jpg);background-size: cover;box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);"></div>
                            <div class="touxiangxuanze"
                                 style="width: 75px;height: 75px;float: left;margin:10px;background:url(${contextpath}/static/img/touxiang/touxiang12.jpg);background-size: cover;box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);"></div>
                            <input type="hidden" name="imgId" id="imgURL" value="">
                            <input type="hidden" name="username" value="${nowUser.getUsername()}">
                        </form>
                    </div>
                    <br>
                    <button class="btn btn-default pull-right" id="showchangemessage"
                            style="display: block;margin-right: 10px;">
                        修改个人信息
                    </button>
                    <button class="btn btn-danger pull-right" id="surechange" style="display: none;margin-right: 10px;">
                        确认修改
                    </button>
                    <button class="btn btn-danger pull-right" id="surechangetouxiang"
                            style="display: none;margin-right: 10px;">修改头像
                    </button>
                    <button class="btn btn-default pull-right" id="backmessage"
                            style="display: none;margin-right: 10px;">返回
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var jq = jQuery.noConflict();
    jq(document).ready(function () {

        jq(".touxiangxuanze").each(function () {
            jq(this).click(function () {
                jq(".touxiangxuanze").css("border", "1px hidden lightblue");
                jq(this).css("border", "1px solid lightblue");
                jq("#touxiangchange").css({
                    "background": jq(this).css("background-image"),
                    "background-size": "cover"
                });
                jq("#imgURL").attr("value", jq(this).css("background-image"));
            });
        });
        jq("#surechangetouxiang").click(function () {
            jq.ajax({
                url: "changeTouxiang",
                type: "post",
                async: false,
                traditional: true,
                data: jq("#touxiangxuanzeform").serialize(),
                success: function () {
                    alert("您的个人信息修改成功");
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
        });
        var check=true;
        var passwordTest = /\w{6,9}/;
        var phoNumTest = /((^130)|(^131)|(^132)|(^155)|(^156)|(^185)|(^186)|(^145)|(^176)|(^134)|(^135)|(^136)|(^137)|(^138)|(^139)|(^150)|(^151)|(^152)|(^157)|(^158)|(^159)|(^182)|(^183)|(^184)|(^187)|(^188)|(^147)|(^178)|(^133)|(^153)|(^180)|(^189)|(^177)|(^181))\d{8}/;
        var EmailTest = /^\w(\w|-|_|.)*@\w*.\w*/;
        if (!passwordTest.test(jq("#cpassword").val())) {
            jq("#cpassword").next().attr({"class":"glyphicon glyphicon-remove","style":"color:red"});
            check=false;
        }
        if (!phoNumTest.test(jq("#cphonenumber").val())) {
            jq("#cphonenumber").next().attr({"class":"glyphicon glyphicon-remove","style":"color:red"});
            check=false;
        }
        if (!EmailTest.test(jq("#cemail").val())) {
            jq("#cemail").next().attr({"class":"glyphicon glyphicon-remove","style":"color:red"});
            check=false;
        }
        if(jq("#cpassword").val()!=jq("#cre-password").val()){
            jq("#cre-password").next().attr({"class":"glyphicon glyphicon-remove","style":"color:red"});
            check=false;
        }
        if(check) {
            jq("#surechange").click(function () {
                jq.ajax({
                    url: "changeUserMessage",
                    type: "post",
                    async: false,
                    traditional: true,
                    data: jq("#userMessageForm").serialize(),
                    success: function () {
                        alert("您的个人信息修改成功");
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
            });
        }
        jq("#cemail").focus(function () {
            jq("#cemail").attr("placeholder","请输入正确的邮箱格式");
        });
        jq("#cemail").blur(function () {
            var EmailTest = /^\w(\w|-|_|.)*@\w*.\w*/;
            if (!EmailTest.test(jq("#cemail").val())) {
                jq("#cemail").next().attr({"class":"glyphicon glyphicon-remove","style":"color:red"});
            }else {
                jq("#cemail").next().attr({"class":"glyphicon glyphicon-ok","style":"color:green"});
            }
        });
        jq("#cphonenumber").blur(function () {
            var phoNumTest = /((^130)|(^131)|(^132)|(^155)|(^156)|(^185)|(^186)|(^145)|(^176)|(^134)|(^135)|(^136)|(^137)|(^138)|(^139)|(^150)|(^151)|(^152)|(^157)|(^158)|(^159)|(^182)|(^183)|(^184)|(^187)|(^188)|(^147)|(^178)|(^133)|(^153)|(^180)|(^189)|(^177)|(^181))\d{8}/;
            if (!phoNumTest.test(jq("#cphonenumber").val())) {
                jq("#cphonenumber").next().attr({"class":"glyphicon glyphicon-remove","style":"color:red"});
            }else{
                jq("#cphonenumber").next().attr({"class":"glyphicon glyphicon-ok","style":"color:green"});
            }
        });
        jq("#cphonenumber").focus(function () {
            jq("#cphonenumber").attr("placeholder","请输入正确的手机号码");
        });
        jq("#cre-password").blur(function () {
            if (jq("#cre-password").val()!=jq("#cpassword").val()) {
                jq("#cre-password").next().attr({"class":"glyphicon glyphicon-remove","style":"color:red"});
            }else{
                jq("#cre-password").next().attr({"class":"glyphicon glyphicon-ok","style":"color:green"});
            }
        });
        jq("#cre-password").focus(function () {
            jq("#cre-password").attr("placeholder","在输入一次密码");
        });
        jq("#cpassword").blur(function () {
            var passwordTest = /\w{6,13}/;
            if (!passwordTest.test(jq("#cpassword").val())) {
                jq("#cpassword").next().attr({"class":"glyphicon glyphicon-remove","style":"color:red"});
            }else{
                jq("#cpassword").next().attr({"class":"glyphicon glyphicon-ok","style":"color:green"});
            }
        });
        jq("#cpassword").focus(function () {
            jq("#cpassword").attr("placeholder","密码位数为6-13");
        });
    });
</script>