<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/12
  Time: 14:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>个人中心</title>
    <link rel="stylesheet" href="/resources/layui/css/layui.css">
    <script src="http://libs.baidu.com/jquery/2.1.4/jquery.min.js"></script>
    <script src="/resources/layui/layui.js"></script>
    <style type="text/css">
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
        .toptitle{
            left: 50%;
            color: #fff;
            text-align: center;
            background:url('http://www.yaoyue365.com/static/images/toppic1.png') no-repeat;
            padding: 20px 0px;
        }
        .toptitle h1{
            font-size: 40px;
            height: 80px;
            line-height: 80px;
        }
        .toptitle a{
            height: 40px;
            line-height: 40px;
            border: 2px solid #fff;
            border-radius: 22px;
            font-size: 18px;
            color: white;
            width: 160px;
            display: inline-block;
        }
        .body_title{
            color: #666;
            margin-top: 50px;
        }
        .body_title h3{
            margin-bottom: 30px;
            font-size: 25px;
            border-bottom: 1px solid #ddd;
            padding-bottom: 20px;

        }
        .body_col{
            text-align: center;
            border: 1px solid #d2fff6;
            padding: 50px 0px;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0,0,0,.12);
            display: block;
        }
        .body_col p{
            height: 30px;
            line-height: 30px;
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

    <div>
        <div class="toptitle pa">
            <h1>开 始 新 的 制 作</h1>
            <a href="/cardInfo/goCardAdd" class="createnow">立即制作</a>
        </div>
    </div>

    <div class="layui-container">

        <div class="body_title">
            <h3>我的请柬</h3>
        </div>
        <!-- 内容主体区域 -->
        <div style="margin: 10px 0px 20px 0px">
            <div class="layui-row layui-col-space20" id="body_row">
                <c:forEach items="${mycard}" var="comment" varStatus="id">
                    <div class="layui-col-md3">
                        <a href="/cardInfo/goCardById?id=${comment.infoId}" class="body_col">
                            <p> ${comment.infoPerson}</p>
                            <p><fmt:formatDate value="${comment.infoTime}" pattern="yyyy-MM-dd" /></p>
                            <p>${comment.infoAddress}</p>
                            <p>${comment.infoNameAddress}</p>
                            <p>${comment.infoTelAddress}</p>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </div>

    </div>

    <!-- 底部固定区域 -->
    <div class="footer">
        <div class="layui-container">
            © layui.com - 底部固定区域
        </div>


    </div>
</body>

<script>


    function timestampToTime(timestamp) {
        var date = new Date(timestamp);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
        var Y = date.getFullYear() + '-';
        var M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
        var D = date.getDate() + ' ';
        var h = date.getHours() + ':';
        var m = date.getMinutes();
        return Y+M+D+h+m;
    }


</script>

</html>

