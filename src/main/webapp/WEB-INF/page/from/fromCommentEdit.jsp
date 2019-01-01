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
    <script src="/resources/layui/layui.js"></script>
    <%--
        <script type="text/javascript" src="/resources/layui/layui.all.js" charset="utf-8"></script>
    --%>
</head>
<body>
<form id="edit">
    <div style="padding: 20px; line-height: 24px;">
        <input type="hidden" name="commentId" value="${cardComment.commentId}">
        <div class="layui-form-item">
            <label class="layui-form-label" style="width: 150px;">请柬致辞内容</label>
            <div class="layui-input-inline">
                <input type="text" name="commentContent" required lay-verify="required" class="layui-input"
                       value="${cardComment.commentContent}">
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
        var data= $("#edit").serialize();
        $.ajax({
            url: "/cardComment/edit.json",
            type: "POST",
            dataType: "json",
            data: data,
            success: function (rtn) {
                if (rtn.code == "000000") {
                    alert("修改成功")
                    setTimeout(function () {
                        window.location.reload();
                    },1000)

                } else {
                    alert("修改失败")
                }
            },
        });
    };
</script>
</body>
</html>
