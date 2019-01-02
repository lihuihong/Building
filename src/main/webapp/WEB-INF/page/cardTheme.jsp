<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/12
  Time: 14:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>layout 后台大布局 - Layui</title>
    <link rel="stylesheet" href="/resources/layui/css/layui.css">
    <script src="http://libs.baidu.com/jquery/2.1.4/jquery.min.js"></script>
    <script src="/resources/layui/layui.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">请柬后台管理</div>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    欢迎你，管理员
                </a>
                <%--<dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>--%>
            </li>
            <%--<li class="layui-nav-item"><a href="">退了</a></li>--%>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item"><a href="/web/index.action">请柬管理</a></li>
                <li class="layui-nav-item"><a href="/web/userInfo.action">用户管理</a></li>
                <li class="layui-nav-item"><a href="/web/cardTheme.action">请柬主题管理</a></li>
                <li class="layui-nav-item"><a href="/web/cardComment.action">评论管理</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <table class="layui-hide" lay-filter='demo' id="content"></table>

            <!--时间格式化-->
            <script src="/resources/js/date-format.js" type="text/javascript" charset="utf-8"></script>
        </div>
    </div>
    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>
</div>
<script>
    layui.use(['table', 'layer'], function () {
        var table = layui.table
            , layer = layui.layer;
        //方法级渲染
        table.render({
            elem: '#content'
            , url: '/cardTheme/cardThemeInfo.action'
            , id: 'contentReload'
            , page: true
            , height: 600
            , limit: 6
            , limits: [6, 8, 10, 12]
            , cols: [[
                {checkbox: true, fixed: true}
                , {field: 'themeName', title: '请柬主题', align: 'center'}
            ]]
        });
        var $ = layui.$, active = {
            reload: function () {
                //执行重载
                table.reload('contentReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    , where: {
                        id: $('#demoLoad').val()
                    }
                });
            },
        };
    });
</script>


</body>
</html>

