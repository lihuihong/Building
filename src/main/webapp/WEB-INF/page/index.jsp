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
            <%--<button id="add" class="layui-btn" onclick="add()">
                <i class="layui-icon">&#xe608;</i> 添加
            </button>--%>
            <table class="layui-hide" lay-filter='demo' id="content"></table>

            <script type="text/html" id="barDemo">
                <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
                &nbsp;
                <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
                &nbsp;
                <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
            </script>
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
            , url: '/cardInfo/list.action'
            , id: 'contentReload'
            , page: true
            , height: 600
            , limit: 6
            , limits: [6, 8, 10, 12]
            , cols: [[
                {checkbox: true, fixed: true}
                , {field: 'userName', title: '用户姓名', align: 'center'}
                , {field: 'infoName', title: '请柬主题', align: 'center'}
                , {field: 'infoPerson', title: '请柬致辞内容', align: 'center'}
                , {
                    field: 'infoTime',
                    title: '请柬时间',
                    align: 'center',
                    templet: '<div>{{ Format(d.infoTime,"yyyy-MM-dd")}}</div>'
                }
                , {field: 'barDemo', align: 'center', title: '常用操作', toolbar: '#barDemo'}
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
            batchDelete: function () {
                var checkStatus = table.checkStatus('contentReload')
                    , data = checkStatus.data;
                var str = "";
                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        str += data[i].id + ",";
                    }
                    layer.confirm('是否删除这' + data.length + '数据', {icon: 3, title: '提示'}, function (index) {
                        $.ajax({
                            url: '/user/del.json',
                            type: 'post',
                            data: {
                                'str': str
                            },
                            dataType: 'json',
                            success: function (data) {
                                if (data.code = "000000") {
                                    location.reload(true);

                                } else {
                                    layer.msg(data.message);
                                }
                            },
                            error: function () {
                                alert("删除错误!");
                            }
                        });
                        layer.close(index);
                    });
                } else {
                    layer.alert("请选择要删除的数据!")
                }
            }
        };
        $('#sousuo').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
        $('#shanchu').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
    });
</script>
<script>
    // 实例化表单,让表单上面的数据显示
    layui.use(['table', 'element', 'layer', 'laydate'], function () {
        var $ = layui.jquery
            , layer = layui.layer        //弹层
            , table = layui.table      //表格
            , laydate = layui.laydate;
        table.render();
//监听工具条
        table.on('tool(demo)', function (obj) {
//注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
            if (layEvent === 'detail') {
                layer.open({
                    type: 2
                    , title: '用户请柬信息查询'
                    , area: ['500px', '500px']
                    , closeBtn: false
                    , btn: '确定'
                    , btnAlign: 'c'
                    , content: "/web/fromInfo.action?id=" + data.infoId
                });
            } else if (layEvent === 'del') {
                layer.alert('将要删除该行数据,确定吗?', {
                    closeBtn: 0    // 是否显示关闭按钮
                    , anim: 6
                    , btn: ['确定', '取消'] //按钮
                    , yes: function (index) {
                        var getData = new Object();
                        $.ajax({
                            url: '/cardInfo/deleteCardInfo.json',
                            type: 'post',
                            data: {
                                'InfoId':data.infoId
                            },
                            dataType: 'json',
                            success: function () {
                                layer.msg("删除成功")
                                location.reload(true);
                            },
                            error: function () {
                                alert("删除错误,请重新编写!");
                            }
                        });
                        layer.close(index);
                    }
                });
            } else if (layEvent === 'edit') {
                layer.open({
                    type: 2
                    , title: '更改用户请柬数据'
                    , area: ['500px', '450px']
                    , closeBtn: 1
                    , btnAlign: 'c'
                    , content: '/web/fromEdit.action?id='+data.infoId
                });
            }
        });
    });
    // "/web/fromEdit.action?id=" + data.infoId
    function add() {
        layer.open({
            type: 2
            , title: '新增请柬'
            , area: ['500px', '500px']
            , closeBtn: false
            , content: '/web/fromSend.action'
            , btn: ['取消']
            , btnAlign: 'c'
            , yes: function (index) {
                /*$.ajax({
                    url: '/user/add.json',
                    type: 'post',
                    dataType: 'json',
                    contentType: "application/x-www-form-urlencoded",
                    data: $("#add").serialize(),
                    success: function (data) {
                        if (data.code == "000000") {
                            location.reload(true);
                        } else {
                            layer.msg(data.message);
                        }
                    },
                    error: function () {
                        alert("添加错误,请重新编写!");
                    }
                });*/
                layer.close(index);
            }
        });
    }

    function dateFtt(fmt, date) { //author: meizz
        var o = {
            "M+": date.getMonth() + 1,                 //月份
            "d+": date.getDate(),                    //日
            "h+": date.getHours(),                   //小时
            "m+": date.getMinutes(),                 //分
            "s+": date.getSeconds(),                 //秒
            "q+": Math.floor((date.getMonth() + 3) / 3), //季度
            "S": date.getMilliseconds()             //毫秒
        };
        if (/(y+)/.test(fmt))
            fmt = fmt.replace(RegExp.$1, (date.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt))
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    }
</script>


</body>
</html>

