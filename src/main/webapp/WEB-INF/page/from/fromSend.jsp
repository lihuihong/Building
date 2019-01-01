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
<form id="send">
<div style="padding: 20px; line-height: 24px;">
    <input type="hidden" name="infoId" value="0">
    <div class="layui-form-item" style="margin-top: 10px;">
        <label class="layui-form-label" style="width: 90px">用户姓名</label>
        <%--<div class="layui-input-inline">
            <input type="text" name="userName" required lay-verify="required" class="layui-input" value="${data.userName}">
        </div>--%>
        <select name="userId" lay-verify="">
            <option value="">请选择一个用户姓名</option>
            <c:forEach items="${cardUsers}" var="entity" varStatus="status">
                <option value="${entity.userId}">${entity.userUsername}</option>
            </c:forEach>
        </select>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label" style="width: 90px">请柬主题</label>
        <div class="layui-input-inline">
            <%--<input type="text" name="infoName" required lay-verify="required" class="layui-input"
                   value="${cardTheme.themeId}">--%>
            <select name="infoName" lay-verify="">
                <option value="">请选择一个请柬主题</option>
            <c:forEach items="${cardTheme}" var="entity" varStatus="status">
                <option value="${entity.themeId}">${entity.themeName}</option>
            </c:forEach>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label" style="width: 90px">请柬致辞内容</label>
        <div class="layui-input-inline">
            <input type="text" name="infoPerson" required lay-verify="required" class="layui-input"
                   value="${data.infoPerson}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label" style="width: 90px">请柬时间</label>
        <div class="layui-input-inline">
            <input type="text" name="infoTime1" required lay-verify="required" class="layui-input" id="test1"
                   placeholder="yyyy-MM-dd" value="<fmt:formatDate value="${data.infoTime}" pattern="yyyy-MM-dd" />">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label" style="width: 90px">请柬地址</label>
        <div class="layui-input-inline">
            <input type="text" name="infoAddress" required lay-verify="required" class="layui-input"
                   value="${data.infoAddress}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label" style="width: 90px">请柬地址名称</label>
        <div class="layui-input-inline">
            <input type="text" name="infoNameAddress" required lay-verify="required" class="layui-input"
                   value="${data.infoNameAddress}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label" style="width: 90px">请柬地址电话</label>
        <div class="layui-input-inline">
            <input type="text" name="infoTelAddress" required lay-verify="required" class="layui-input"
                   value="${data.infoTelAddress}">
        </div>
    </div>
</div>
</form>
<div class="layui-form-item"
     style="text-align: center; margin-top: 30px;">
    <button class="layui-btn layui-btn-normal" onclick="saveCardInfo()">立即提交</button>
</div>
<script src="/resources/jquery/jquery.min.js"></script>
<script>
    function saveCardInfo() {
        var data= $("#send").serialize();
        alert(data)
        $.ajax({
            url: "/cardInfo/saveCardInfo.json",
            type: "POST",
            dataType: "json",
            data: data,
            success: function (rtn) {
                if (rtn.code == "000000") {
                    layer.msg("修改成功")
                    window.location.reload();
                } else {
                    layer.msg("修改失败")
                }
            },
        });
    };
</script>
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
