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
<%--
    <script type="text/javascript" src="/resources/layui/layui.all.js" charset="utf-8"></script>
--%>
</head>
<body>
<form id="edit" >
    <div style="padding: 20px; line-height: 24px;">
        <input type="hidden" name="infoId" value="${data.infoId}">
        <div class="layui-form-item">
            <label class="layui-form-label" style="width: 150px;">请柬致辞内容</label>
            <div class="layui-input-inline">
                <input type="text" name="infoPerson" required lay-verify="required" class="layui-input"
                       value="${data.infoPerson}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" style="width: 150px">请柬时间</label>
            <div class="layui-input-inline">
                <input type="text" name="infoTime" required lay-verify="required" class="layui-input" id="test1"
                       placeholder="yyyy-MM-dd"
                       value="<fmt:formatDate value="${data.infoTime}" pattern="yyyy-MM-dd" />">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" style="width: 150px">请柬地址</label>
            <div class="layui-input-inline">
                <input type="text" name="infoAddress" required lay-verify="required" class="layui-input"
                       value="${data.infoAddress}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" style="width: 150px">请柬地址名称</label>
            <div class="layui-input-inline">
                <input type="text" name="infoNameAddress" required lay-verify="required" class="layui-input"
                       value="${data.infoNameAddress}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" style="width: 150px">请柬地址电话</label>
            <div class="layui-input-inline">
                <input type="text" name="infoTelAddress" required lay-verify="required" class="layui-input"
                       value="${data.infoTelAddress}">
            </div>
        </div>
    </div>
    <div class="layui-form-item"
         style="text-align: center; margin-top: 30px;">
        <button class="layui-btn layui-btn-normal" >立即提交 </button>
        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
</form>
<script>
    layui.use(['laydate','jquery'],function () {
        var laydate = layui.laydate;
        //var form = layui.from;
        var $ = layui.jquery;

        /*//form.render();
        form.on('submit(formDemo)', function(data) {
            $.post("/cardInfo/saveCardInfo.json", data.field,
                function(data) {
                    if (data.code == "000000") {
                        layer.msg("修改成功")
                    }else {
                        layer.msg("修改失败")
                    }
                });
            return false;
        });*/
        //常规用法
        laydate.render({
            elem: '#test1'
        });
        alert(parent.layui.table.data);
        function saveCardInfo() {
            $.ajax({
                url: "/cardInfo/saveCardInfo.json",
                type: "POST",
                dataType: "json",
                data:$("#edit").serialize(),
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

    })

</script>
</body>
</html>
