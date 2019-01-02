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

    <%--<script type="text/javascript" src="/resources/layui/layui.all.js" charset="utf-8"></script>--%>
    <link rel="stylesheet" href="/resources/layui/css/layui.css" media="all">
    <style>
        .frameBtn {text-align:center;margin:20px 0px 0px 30px;padding-top:20px;border-top:1px rgb(204,204,204) dashed}
    </style>
</head>
<body>
<form id="edit"  class="layui-form">
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
                <input type="text" name="infoTime1"  class="layui-input" id="test1">
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
    <div class="frameBtn">
        <button class="layui-btn" type='button' lay-submit lay-filter="submit">立即提交</button>
    </div>
</form>
<script src="/resources/layui/layui.js"></script>
<script>
    layui.use(['form','layer','jquery'], function(){
        var form = layui.form;
        var $ = layui.jquery;
        var layer = layui.layer;
        //监听提交
        form.on('submit(submit)',function(data){
            layer.confirm('是否确定提交？',{icon: 3, title:'系统信息'},function(index){
                $.ajax({
                    url:'/cardInfo/saveCardInfo.json',
                    type:'post',
                    data:data.field,
                    closeBtn: 1,
                    dataType:"json",
                    beforeSend:function(){
                        //console.log(JSON.stringify(data.field));
                    },
                    success:function(data){
                        //do something
                        if(data.code=="000000"){
                            window.parent.location.reload();
                            var index = parent.layer.getFrameIndex(window.name);//获取当前窗口索引
                            parent.layer.msg('修改成功', {icon : 1});
                            parent.layer.close(index);
                            parent.layui.table.reload();//重新加载父级tabel数据

                        } else {
                            layer.alert('抱歉，系统繁忙，请稍后再试！',{icon:2});
                        }
                    },
                    error:function(data){
                        //do something
                        layer.msg('与服务器连接失败',{icon: 2});
                    }
                })
                layer.close(index);
            })
            return false;
        })
    })
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
