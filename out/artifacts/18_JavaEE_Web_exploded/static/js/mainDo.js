var jq = jQuery.noConflict();
jq(document).ready(function () {

    jq("#loginandregister").click(function(){
        jq("#username").next().attr({"class":""});
        jq("#realname").next().attr({"class":""});
        jq("#password").next().attr({"class":""});
        jq("#re-password").next().attr({"class":""});
        jq("#phonenumber").next().attr({"class":""});
        jq("#realId").next().attr({"class":""});
        jq("#email").next().attr({"class":""});
        jq("#register_form").slideUp("slow");
        jq("#login_form").slideDown("slow");
    });
    jq("#register_btn").click(function() {
        jq("#register_form").slideDown("slow");
        jq("#login_form").slideUp("slow");
        jq("#username").next().attr({"class":""});
        jq("#realname").next().attr({"class":""});
        jq("#password").next().attr({"class":""});
        jq("#re-password").next().attr({"class":""});
        jq("#phonenumber").next().attr({"class":""});
        jq("#realId").next().attr({"class":""});
        jq("#email").next().attr({"class":""});
    });
    jq("#back_btn").click(function() {
        jq("#register_form").slideUp("slow");
        jq("#login_form").slideDown("slow");
    });

    jq("#loginBtn").click(function () {
        jq.ajax({
            url: "login",
            type: "post",
            async: false,
            traditional: true,
            data: jq("#login_form").serialize(),
            datatype:"text",
            success: function (data) {
                var message = JSON.parse(data);
                if(message=="1"){
                    window.location.reload();
                }else{
                    bootoast({
                        message: '用户名或密码有误，请重新输入',
                        type: 'danger',
                        position:'top',
                        timeout:1
                    });
                }
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
    jq("#zhuxiao").click(function () {
        jq.ajax({
            url: "zhuxiao",
            type: "post",
            async: false,
            traditional: true,
            success: function () {
                window.location.reload();
            },
            error: function () {
                ShowMask("系统繁忙，请稍后再试");
            }
        });
    });
    jq("#registerBtn").click(function(){
        var check=true;
        var realname=/\w{1,50}|[\u4e00-\u9fa5]{1,20}/;
        var username = /\w{1,20}|[\u4e00-\u9fa5]{1,20}/;
        var passwordTest = /\w{6,9}/;
        var IDtest = /(^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$)|(^[1-9]\d{5}\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{2}$)/;
        var phoNumTest = /((^130)|(^131)|(^132)|(^155)|(^156)|(^185)|(^186)|(^145)|(^176)|(^134)|(^135)|(^136)|(^137)|(^138)|(^139)|(^150)|(^151)|(^152)|(^157)|(^158)|(^159)|(^182)|(^183)|(^184)|(^187)|(^188)|(^147)|(^178)|(^133)|(^153)|(^180)|(^189)|(^177)|(^181))\d{8}/;
        var EmailTest = /^\w(\w|-|_|.)*@\w*.\w*/;
        if (!username.test(jq("#username").val())) {
            jq("#username").next().attr({"class":"glyphicon glyphicon-remove","style":"color:red"});
            check=false;
        }
        if (!passwordTest.test(jq("#password").val())) {
            jq("#password").next().attr({"class":"glyphicon glyphicon-remove","style":"color:red"});
            check=false;
        }
        if (!realname.test(jq("#realname").val())) {
            jq("#realname").next().attr({"class":"glyphicon glyphicon-remove","style":"color:red"});
            check=false;
        }
        if (!IDtest.test(jq("#realId").val())) {
            jq("#realId").next().attr({"class":"glyphicon glyphicon-remove","style":"color:red"});
            check=false;
        }
        if (!phoNumTest.test(jq("#phonenumber").val())) {
            jq("#phonenumber").next().attr({"class":"glyphicon glyphicon-remove","style":"color:red"});
            check=false;
        }
        if (!EmailTest.test(jq("#email").val())) {
            jq("#email").next().attr({"class":"glyphicon glyphicon-remove","style":"color:red"});
            check=false;
        }
        if(jq("#password").val()!=jq("#re-password").val()){
            jq("#re-password").next().attr({"class":"glyphicon glyphicon-remove","style":"color:red"});
            check=false;
        }
        if(check){
            jq.ajax({
                url: "register",
                type: "post",
                async: false,
                traditional: true,
                data: jq("#register_form").serialize(),
                datatype:"text",
                success: function (data) {
                    var message = JSON.parse(data);
                    bootoast({
                        message: message,
                        type: 'warning',
                        position:'top',
                        timeout:1
                    });
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
    });
    jq("#username").blur(function () {
        var username = /\w{1,20}|[\u4e00-\u9fa5]{1,20}/;
        if (!username.test(jq("#username").val())) {
            jq("#username").next().attr({"class":"glyphicon glyphicon-remove","style":"color:red"});
        }else{
            jq("#username").next().attr({"class":"glyphicon glyphicon-ok","style":"color:green"});
        }
    });
    jq("#username").focus(function () {
        jq("#username").attr("placeholder","请输入1-20位任意字符");
    });
    jq("#realname").blur(function () {
        var realname = /\w{1,50}|[\u4e00-\u9fa5]{1,20}/;
        if (!realname.test(jq("#realname").val())) {
            jq("#realname").next().attr({"class":"glyphicon glyphicon-remove","style":"color:red"});
        }else{
            jq("#realname").next().attr({"class":"glyphicon glyphicon-ok","style":"color:green"});
        }
    });
    jq("#realname").focus(function () {
        jq("#realname").attr("placeholder","请输入姓名");
    });
    jq("#password").blur(function () {
        var passwordTest = /\w{6,13}/;
        if (!passwordTest.test(jq("#password").val())) {
            jq("#password").next().attr({"class":"glyphicon glyphicon-remove","style":"color:red"});
        }else{
            jq("#password").next().attr({"class":"glyphicon glyphicon-ok","style":"color:green"});
        }
    });
    jq("#password").focus(function () {
        jq("#password").attr("placeholder","密码位数为6-13");
    });

    jq("#re-password").blur(function () {
        if (jq("#re-password").val()!=jq("#password").val()) {
            jq("#re-password").next().attr({"class":"glyphicon glyphicon-remove","style":"color:red"});
        }else{
            jq("#re-password").next().attr({"class":"glyphicon glyphicon-ok","style":"color:green"});
        }
    });
    jq("#re-password").focus(function () {
        jq("#re-password").attr("placeholder","在输入一次密码");
    });

    jq("#phonenumber").blur(function () {
        var phoNumTest = /(^130)|(^131)|(^132)|(^155)|(^156)|(^185)|(^186)|(^145)|(^176)|(^134)|(^135)|(^136)|(^137)|(^138)|(^139)|(^150)|(^151)|(^152)|(^157)|(^158)|(^159)|(^182)|(^183)|(^184)|(^187)|(^188)|(^147)|(^178)|(^133)|(^153)|(^180)|(^189)|(^177)|(^181)\d{9}/;
        if (!phoNumTest.test(jq("#phonenumber").val())) {
            jq("#phonenumber").next().attr({"class":"glyphicon glyphicon-remove","style":"color:red"});
        }else{
            jq("#phonenumber").next().attr({"class":"glyphicon glyphicon-ok","style":"color:green"});
        }
    });
    jq("#phonenumber").focus(function () {
        jq("#phonenumber").attr("placeholder","请输入正确的手机号码");
    });

    jq("#realId").focus(function () {
        jq("#realId").attr("placeholder","请输入正确的身份证格式");
    });
    jq("#realId").blur(function () {
        var IDtest = /(^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$)|(^[1-9]\d{5}\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{2}$)/;
        if (!IDtest.test(jq("#realId").val())) {
            jq("#realId").next().attr({"class":"glyphicon glyphicon-remove","style":"color:red"});
        }else{
            jq("#realId").next().attr({"class":"glyphicon glyphicon-ok","style":"color:green"});
        }
    });
    jq("#email").focus(function () {
        jq("#email").attr("placeholder","请输入正确的邮箱格式");
    });
    jq("#email").blur(function () {
        var EmailTest = /^\w(\w|-|_|.)*@\w*.\w*/;
        if (!EmailTest.test(jq("#email").val())) {
            jq("#email").next().attr({"class":"glyphicon glyphicon-remove","style":"color:red"});
        }else {
            jq("#email").next().attr({"class":"glyphicon glyphicon-ok","style":"color:green"});
        }
    });
    jq("#showchangemessage").click(function(){
        jq("#showmessage").slideUp("slow");
        jq("#updatemassage").slideDown("slow");
        jq("#showchangemessage").css("display","none");
        jq("#backmessage").css("display","block");
        jq("#surechange").css("display","block");
        jq("#surechangetouxiang").css("display","none");
        jq("#updatetouxiang").css("display","none");
    });
    jq("#backmessage").click(function(){
        jq("#updatemassage").slideUp("slow");
        jq("#updatetouxiang").slideUp("slow");
        jq("#showmessage").slideDown("slow");
        jq("#showchangemessage").css("display","block");
        jq("#backmessage").css("display","none");
        jq("#surechange").css("display","none");
        jq("#surechangetouxiang").css("display","none");
    });
    jq("#touxiangchange").click(function(){
        jq("#showmessage").slideUp("slow");
        jq("#updatemassage").slideUp("slow");
        jq("#showchangemessage").css("display","none");
        jq("#backmessage").css("display","block");
        jq("#surechange").css("display","none");
        jq("#surechangetouxiang").css("display","block");
        jq("#updatetouxiang").slideDown("slow");
    });
});