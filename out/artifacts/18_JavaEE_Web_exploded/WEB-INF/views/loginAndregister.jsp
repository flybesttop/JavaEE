<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextpath" value="${pageContext.request.contextPath}"/>
<div class="modal fade" id="loginRegister" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true" id="closelogin">&times;
                </button>
                <h4 class="modal-title" id="myModalLabel"> 登陆 & 注册</h4>
            </div>
            <div class="modal-body">
                <form class="form-inline bs-example bs-example-form" method="post" id="login_form">
                    <h1 class="form-title">Login</h1>
                    <br>
                    <div class="form-group">
                        <span class="glyphicon glyphicon-user" style="margin-left: 25px;"></span>
                        <input type="text" class="form-control" name="username" placeholder="用户名">
                    </div>
                    <br>
                    <div class="form-group">
                        <span class="glyphicon glyphicon-lock" style="margin-left: 25px;"></span>
                        <input type="password" class="form-control" name="password" placeholder="密码">
                    </div>
                    <br><br>
                    <div class="form-group" id="register">
                        <a href="#" id="register_btn">还没有账号？</a>
                    </div>
                    <br>
                    <button type="button" class="btn btn-primary btn-lg pull-right btn1" id="loginBtn">登录</button>
                    <br><br>
                </form>
                <form class="form-inline bs-example bs-example-form" method="post"
                      id="register_form">
                    <input type="hidden" name="touxiang" value="${contextpath}/static/img/touxiang/touxiang0.jpg">
                    <h1 class="form-title">register</h1>
                    <div class="form-group">
                        <span class="glyphicon glyphicon-user" style="margin-left: 25px;color: orange;"></span>
                        <input type="text" class="form-control" id="username"
                               placeholder="用户名" name="username">&nbsp;&nbsp;<span></span>
                    </div>
                    <div class="form-group">
                        <span class="glyphicon glyphicon-lock" style="margin-left: 25px;color: orange;"></span>
                        <input type="password" class="form-control" id="password"
                               placeholder="密码" name="password">&nbsp;&nbsp;<span></span>
                    </div>
                    <div class="form-group">
                        <span class="glyphicon glyphicon-repeat" style="margin-left: 4px;"></span>
                        <span class="glyphicon glyphicon-lock"></span>
                        <input type="password" class="form-control" id="re-password"
                               placeholder="重复密码">&nbsp;&nbsp;<span></span>
                    </div>
                    <div class="form-group">
                        <span class="glyphicon glyphicon-flag" style="margin-left: 25px;"></span>
                        <input type="text" class="form-control" id="realname"
                               placeholder="真实姓名" name="realname">&nbsp;&nbsp;<span></span>
                    </div>
                    <div class="form-group">
                        <span class="glyphicon glyphicon-user" style="margin-left: 25px;"></span>
                        <input type="text" class="form-control" id="realId" placeholder="身份证号" name="realId">&nbsp;&nbsp;<span></span>
                    </div>
                    <div class="form-group">
                        <span class="glyphicon glyphicon-tag" style="margin-left: 25px;margin-right: 65px;"></span>
                        <label class="radio-inline">
                            <input type="radio" value="男" checked id="sex1" name="sex"> 男
                        </label>
                        <label class="radio-inline">
                            <input type="radio" value="女" id="sex2" name=sex> 女
                        </label>
                    </div>
                    <br>
                    <div class="form-group">
                        <span class="glyphicon glyphicon-phone" style="margin-left: 25px;"></span>
                        <input type="number" class="form-control" id="phonenumber"
                               placeholder="联系电话" name="phonenumber">&nbsp;&nbsp;<span></span>
                    </div>
                    <div class="form-group">
                        <span class="glyphicon glyphicon-envelope" style="margin-left: 25px;"></span>
                        <input type="text" class="form-control" id="email" placeholder="邮箱"
                               name="email">&nbsp;&nbsp;<span></span>
                    </div>
                    <br>
                    <div class="form-group" id="back">
                        <a href="#" id="back_btn">返回登陆界面</a>
                    </div>
                    <br/>
                    <button type="button" class="btn btn-primary btn-lg pull-right btn1" id="registerBtn">注册</button>
                    <br><br>
                </form>
            </div>
        </div>
    </div>
</div>
