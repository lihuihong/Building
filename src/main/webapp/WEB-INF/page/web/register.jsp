<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/12
  Time: 13:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>注册页</title>
    <link rel="stylesheet" href="/resources/layui/css/layui.css">
    <link rel="stylesheet" href="/resources/frame/css/style.css">

</head>
<body>

<div class="login-main">
    <header class="layui-elip">注册页</header>
    <form class="layui-form" method="post">
        <div class="layui-input-inline">
            <input type="text" name="userName" required lay-verify="required" placeholder="请输入用户名" autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-input-inline">
            <input type="password" id="pwd" name="passWord" required lay-verify="required" placeholder="请输入密码" autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-input-inline">
            <input type="password" id="rpwd" name="passWord" required lay-verify="required" placeholder="请确认密码" autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-input-inline login-btn">
            <button lay-submit lay-filter="sub" class="layui-btn">注册</button>
        </div>
        <hr/>
        <p><a href="${pageContext.request.contextPath}/user/login.action" class="fl">已有账号？立即登录</a><a href="javascript:;"
                                                                                                   class="fr">忘记密码？</a>
        </p>
    </form>
</div>
<script src="http://libs.baidu.com/jquery/2.1.4/jquery.min.js"></script>
<script src="/resources/layui/layui.js"></script>
<script type="text/javascript">
    layui.use(['form', 'jquery', 'layer'], function () {
        var form = layui.form;
        var $ = layui.jquery;
        var layer = layui.layer;
        form.on('submit(sub)', function (data) {
            if ($("#pwd").val() != $("#rpwd").val()) {
                layer.msg("两次密码不一致");
            } else {
                $.ajax({
                    url: '/user/register.json',
                    type: 'post',
                    dataType: 'json',
                    data: data.field,
                    //验证用户名是否可用
                    success: function (data) {
                        if (data.code == "000000") {
                            layer.msg("注册成功，并已成功登录，正在跳转。。。")
                            setTimeout(function () {
                                window.location.href = "${pageContext.request.contextPath}/user/index.action";
                            },3000);
                        } else {
                            layer.msg(data.message)
                        }

                    }
                })
            }
            return false;
        });
    });

</script>

</body>
</html>
