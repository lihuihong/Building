<%--
  Created by IntelliJ IDEA.
  User: 那个谁
  Date: 2018/12/31
  Time: 16:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/layui/css/layui.css">

    <%--
        <script type="text/javascript" src="/resources/layui/layui.all.js" charset="utf-8"></script>
    --%>
    <style>
        .header{
            height: 59px;
            border-bottom: 1px solid #404553;
            background-color: #393D49;
        }
        .header .layui-nav {
            position: absolute;
            right: 0;
            top: 0;
            padding: 0;
            background: none;
        }
        .logo {
            position: absolute;
            left: 0;
            top: 18px;
            color: #fff;
            font-size: 18px;
        }
        .footer{
            padding: 80px 0 70px;
            background: #2b2c2c;
            line-height: 24px;
            font-size: 13px;
            font-weight: normal;
            color: #7c7c7c;
            text-align: center;
        }
        .borde{
            box-shadow: 0 2px 4px 0 rgba(152, 152, 152, 0.50);
            border-radius: 20px;
            margin-top: 50px;
        }
        .my-layui-form-label{
            float: left;
            margin-bottom: 10px;
            display: block;
        }
        .my-layui-input{
            width: 100%;
        }
        .absro{
            position: relative;
        }
        .card_content{
            position: absolute;
            bottom: 150px;
            text-align: center;
            color: #feba4f;
            width: 100%;
        }
        .card_content h3{
            font-size: 23px;
            margin-bottom: 30px;
        }
        .card_content p{
            line-height: 40px;
            height: 40px;
            font-size: 20px;
        }
        .right-comm{
            line-height: 30px;
            height: 30px;
            margin-bottom: 20px;
        }
        #comm{
            padding: 15px;
        }
        .left-user{
            float: left;
            background: #1e9fff;
            border-radius: 20px;
            color: white;
            padding: 0px 10px;
            margin-right: 10px;
        }
        .left-comment{
            float: left;
            border-radius: 20px;
            background: #8ad6dacf;
            padding: 0px 20px;
            margin-left: 20px;
        }
        #edit{
            padding-bottom: 10px;
            line-height: 30px;
            height: 30px;
        }

    </style>
</head>
<body>

    <div class="layui-header header">
        <div class="layui-container">
            <a class="logo" href="/">请柬制作</a>
            <ul class="layui-nav">
                <c:choose>
                    <c:when test="${sessionScope.get(\"userInfo\") != null}">
                        <div class="user" id="oklogin">
                            <li class="layui-nav-item">欢迎您 ：&nbsp;&nbsp;${sessionScope.get('userInfo').userUsername}
                            </li>
                            <li class="layui-nav-item layui-this">
                                <a href="/cardInfo/goMyCard" style="display: inline;color: #00C0F7">个人中心</a>
                            </li>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <li class="layui-nav-item layui-this">
                            <a href="/page/web/login">用 户 登 录</a>
                        </li>
                    </c:otherwise>
                </c:choose>
                <span class="layui-nav-bar" style="width: 0px; left: 162px; opacity: 0; top: 55px;"></span>
            </ul>
        </div>
    </div>

    <div class="layui-container">

        <div class="layui-row">

            <div class="layui-col-md8" style="padding: 50px 50px 50px 0px">
                <div class="absro">
                    <img src="/resources/img/bg1.jpg" style="width: 100%" id="bg_img"/>
                    <div class="card_content">

                        <h3 id="infoPerson">${data.infoPerson}</h3>
                        <p>时间： <span id="infoTime"><fmt:formatDate value="${data.infoTime}" pattern="yyyy-MM-dd" /></span></p>
                        <p>酒店： <span id="infoAddress">${data.infoAddress}</span></p>
                        <p>详细地址:  <span id="infoNameAddress">${data.infoNameAddress}</span></p>
                        <p>联系方式： <span id="infoTelAddress">${data.infoTelAddress}</span></p>
                    </div>
                </div>

            </div>

            <div class="layui-col-md4 borde">
                <div id="comm">

                </div>

                <div class="layui-form-inline" style="text-align: center; margin-top: 30px;">
                    <form id="edit" class="layui-form">
                        <input type="hidden" id="infoId" name="infoId" value="${data.infoId}">
                        <input type="text" name="comment" style="height: 35px; border-radius: 20px;width: 250px;padding: 5px 15px;"/>
                        <button class="layui-btn layui-btn-normal" lay-submit lay-filter="demoBtn">立即评论</button>
                    </form>
                </div>
            </div>

        </div>


    </div>

    <!-- 底部固定区域 -->
    <div class="footer">
        <div class="layui-container">
            © layui.com - 底部固定区域
        </div>


    </div>
<script src="/resources/layui/layui.js"></script>
<script>

    layui.use(['laydate', 'jquery','form','layer'], function () {
        var laydate = layui.laydate;
        var form = layui.form;
        var $ = layui.jquery;
        var layer = layui.layer;

        //常规用法
        laydate.render({
            elem: '#test1'
        });
        form.render();

        form.on('select(filter)',function (data1) {
            switch (data1.value){
                case '1':
                    $('#bg_img').attr("src","/resources/img/bg1.jpg");
                    break;
                case '2':
                    $('#bg_img').attr("src","/resources/img/bg2.jpg");
                    break;
            }
        });


        $.ajax({
            url: "/cardComment/allComByInfo.json?infoId="+$('#infoId').val(),
            type: "get",
            dataType: "json",
            success: function (rtn) {
                if (rtn.code==0) {
                    var html = '';
                    $.each(rtn.data, function(commentIndex, comment){
                        html += '<div class="right-comm"> <div class="left-user">'
                            + comment.userName +
                            '</div><div style="float:left">说:</div><div class="left-comment">'
                            + comment.commentContent
                            + '</div></div>';
                    });
                    $('#comm').html(html);

                    //window.location.reload();
                } else {
                    layer.msg("访问失败")
                }
            }

        });

        form.on('submit(demoBtn)', function(data){
            $.ajax({
                url: "/cardComment/addComByInfo.action",
                type: "POST",
                dataType: "json",
                data: $("#edit").serialize(),
                success: function (rtn) {
                    if (rtn.code == 0) {
                        layer.alert("评论成功", {icon: 6},function () {
                            window.location.reload();
                        });
                    } else {
                        layer.alert("未登录，请先登录", {icon: 2},function () {
                            window.location.href = '/page/web/login';
                        });

                    }
                },
            });
            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });

    })

</script>
</body>
</html>
