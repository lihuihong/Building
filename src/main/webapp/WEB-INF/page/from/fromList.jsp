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
    <script src="http://libs.baidu.com/jquery/2.1.4/jquery.min.js"></script>
    <script src="/resources/layui/layui.js"></script>
</head>
<body>

<div style="padding: 20px; line-height: 24px;">
    <div class="layui-form-item" style="margin-top: 10px;">
        <label class="layui-form-label" style="width: 90px">用户姓名</label>
        <div class="layui-input-inline">
            <input type="text" name="id" required lay-verify="required" class="layui-input" value="${data.userName}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label" style="width: 90px">请柬主题</label>
        <div class="layui-input-inline">
            <input type="text" name="username" required lay-verify="required" class="layui-input"
                   value="${data.infoName}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label" style="width: 90px">请柬致辞内容</label>
        <div class="layui-input-inline">
            <input type="text" name="password" required lay-verify="required" class="layui-input"
                   value="${data.infoPerson}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label" style="width: 90px">请柬时间</label>
        <div class="layui-input-inline">
            <input type="text" name="status" required lay-verify="required" class="layui-input" id="test1"
                   placeholder="yyyy-MM-dd" value="<fmt:formatDate value="${data.infoTime}" pattern="yyyy-MM-dd" />">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label" style="width: 90px">请柬地址</label>
        <div class="layui-input-inline">
            <input type="text" name="status" required lay-verify="required" class="layui-input"
                   value="${data.infoAddress}  ">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label" style="width: 90px">请柬地址名称</label>
        <div class="layui-input-inline">
            <input type="text" name="status" required lay-verify="required" class="layui-input"
                   value="${data.infoNameAddress}  ">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label" style="width: 90px">请柬地址电话</label>
        <div class="layui-input-inline">
            <input type="text" name="status" required lay-verify="required" class="layui-input"
                   value="${data.infoTelAddress}  ">
        </div>
    </div>
</div>
<script>
    layui.use('laydate', function () {
        var laydate = layui.laydate;

        //常规用法
        laydate.render({
            elem: '#test1'
        });
    })

</script>
</body>
</html>
