<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextpath" value="${pageContext.request.contextPath}"/>

<script type="text/javascript">
    var jq = jQuery.noConflict();
    function removieTicket(obj) {
        jq("#ticketNum"+jq(obj).attr("ticketId")).hide("slow");
        jq("#finalPay").text(jq("#finalPay").text()-jq(obj).attr("price"));
        jq.ajax({
            url: "removeticket?ticketId="+jq(obj).attr("ticketId"),
            type: "post",
            async: false,
            traditional: true,
            success: function () {
                bootoast({
                    message: '退票成功',
                    type: 'success',
                    position: 'right-bottom',
                    timeout: 1
                });
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
    function quanbugoumai() {
        jq.ajax({
            url: "removeAllticket?username=${nowUser.getUsername()}",
            type: "post",
            async: false,
            traditional: true,
            success: function () {

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
        <%--jq("#goupiaoqingdan").html("<img src='${contextpath}/static/img/other/erweima.png' width='200px' height='200px' style='margin-left:200px'>");--%>
    }
</script>

<style type="text/css">
    .handtype {
        cursor: pointer;
        user-select: none;
    }
</style>
<div class="modal fade" id="gouwucheModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" style="width: 700px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel555">购票清单</h4>
            </div>
            <div class="modal-body" style="height: 400px;overflow-y: auto">
                <div style="width: 650px;height: 401px;margin: auto;">
                    <div style="width: 650px;height: 115px;background: url(${contextpath}/static/img/other/paydetial.jpg);background-size: 100% 100%">
                        <br>
                        <div style="width: 90px;height: 90px;margin-left: 450px;margin-top: 55px;position: relative;border-radius: 45px;background: url(${contextpath}${nowUser.getTouxiang()});background-size: 100% 100%;box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.3);"></div>
                    </div>
                    <div style="width: 650px;height:50px;margin-top: 10px;padding-top: 20px" id="goupiaoqingdan">

                    </div>
                </div>
            </div>
            <div class="modal-footer">
                总价：<font style="font-size: 2em;color: gold;">￥</font><font style="font-size: 1.75em;color: gold;margin-right: 60px;" id="finalPay"></font>
                <%--<button type="button" class="btn btn-primary" onclick="quanbugoumai()">确定购买</button>--%>
            </div>
        </div>
    </div>
</div>
