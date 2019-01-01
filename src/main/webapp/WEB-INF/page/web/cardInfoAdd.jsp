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
        input[type="radio"] + label::before {
            content: "\a0"; /*不换行空格*/
            display: inline-block;
            vertical-align: middle;
            font-size: 18px;
            width: 1em;
            height: 1em;
            margin-right: .4em;
            border-radius: 50%;
            border: 1px solid #01cd78;
            text-indent: .15em;
            line-height: 1;
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
                            <a href="<%=request.getContextPath()%>/show/user/user.action">
                                <img src="<%=session.getAttribute("avatar")%>"/>
                                <li class="layui-nav-item layui-this">
                                    <a href="/doc/">欢迎您 ：</a>
                                </li>
                            </a>
                            <div class="card-user">
                                <div class="card-sets">
                                    <a href="javascript:logout()"  class="l">安全退出</a>
                                </div>
                            </div>
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

            <div class="layui-col-md9" style="padding: 50px">
                <div class="absro">
                    <img src="/resources/img/bg1.jpg" style="width: 100%"/>
                    <div class="card_content">
                        <h3>邀请你来参加我们的婚礼</h3>
                        <p>时间： <span>2019-01-01 13:54:37</span></p>
                        <p>酒店： <span>xx大酒店</span></p>
                        <p>详细地址:  <span>南岸天台冈小学旁</span></p>
                        <p>联系方式： <span>15223660000</span></p>
                    </div>
                </div>

            </div>

            <div class="layui-col-md3 borde">
                <form id="edit">
                    <div style="padding: 20px; line-height: 24px;">
                        <input type="hidden" name="infoId" value="${data.infoId}">
                        <div class="layui-form-item">
                            <label class="my-layui-form-label">请柬致辞内容</label>
                            <div class="my-layui-input">
                                <input type="text" name="infoPerson" required lay-verify="required" class="layui-input"
                                       value="${data.infoPerson}">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="my-layui-form-label">请柬时间</label>
                            <div class="my-layui-input">
                                <input type="text" name="infoTime" required lay-verify="required" class="layui-input" id="test1"
                                       placeholder="yyyy-MM-dd"
                                       value="<fmt:formatDate value="${data.infoTime}" pattern="yyyy-MM-dd" />">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="my-layui-form-label">请柬地址</label>
                            <div class="my-layui-input">
                                <input type="text" name="infoAddress" required lay-verify="required" class="layui-input"
                                       value="${data.infoAddress}">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="my-layui-form-label" >请柬地址名称</label>
                            <div class="my-layui-input">
                                <input type="text" name="infoNameAddress" required lay-verify="required" class="layui-input"
                                       value="${data.infoNameAddress}">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="my-layui-form-label">请柬地址电话</label>
                            <div class="my-layui-input">
                                <input type="text" name="infoTelAddress" required lay-verify="required" class="layui-input"
                                       value="${data.infoTelAddress}">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="my-layui-form-label" style="width: 90px">请柬主题选择</label>
                            <div class="layui-input-inline">
                                <%--<input type="text" name="infoName" required lay-verify="required" class="layui-input"
                                       value="${cardTheme.themeId}">--%>
                                <select name="infoName"  lay-filter="filter">
                                    <option value="-1">请选择一个请柬主题</option>
                                    <c:forEach items="${cardTheme}" var="entity" varStatus="status">
                                        <option value="${entity.themeId}">${entity.themeName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                </form>
                <div class="layui-form-item"
                     style="text-align: center; margin-top: 30px;">
                    <button class="layui-btn layui-btn-normal">立即提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
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
<script>
    layui.use(['laydate', 'jquery','form'], function () {
        var laydate = layui.laydate;
        var form = layui.from;
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
        form.render();

        form.on('select(filter)', function(data){
            console.log(data.value); //得到被选中的值
        });

        function saveCardInfo() {
            $.ajax({
                url: "/cardInfo/saveCardInfo.json",
                type: "POST",
                dataType: "json",
                data: $("#edit").serialize(),
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
