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
        <div class="layui-logo">layui 后台布局</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="">控制台</a></li>
            <li class="layui-nav-item"><a href="">商品管理</a></li>
            <li class="layui-nav-item"><a href="">用户</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它系统</a>
                <dl class="layui-nav-child">
                    <dd><a href="">邮件管理</a></dd>
                    <dd><a href="">消息管理</a></dd>
                    <dd><a href="">授权管理</a></dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    贤心
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="">退了</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">所有商品</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">列表一</a></dd>
                        <dd><a href="javascript:;">列表二</a></dd>
                        <dd><a href="javascript:;">列表三</a></dd>
                        <dd><a href="">超链接</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">解决方案</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">列表一</a></dd>
                        <dd><a href="javascript:;">列表二</a></dd>
                        <dd><a href="">超链接</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="">云市场</a></li>
                <li class="layui-nav-item"><a href="">发布商品</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <button id="add" class="layui-btn" onclick="add()">
                <i class="layui-icon">&#xe608;</i> 添加
            </button>


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
            , url: '/cardInfo/index.action'
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
                        getData.id = data.id;
                        $.ajax({
                            url: '/student/delete',
                            type: 'post',
                            data: getData,
                            dataType: 'json',
                            success: function () {
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
                    , title: '更改用户数据'
                    , area: ['500px', '500px']
                    , closeBtn: false
                    , btnAlign: 'c'
                    , content: '/page/from/fromEdit'
                });
            }
        });
    });
    // "/web/fromEdit.action?id=" + data.infoId
    function add() {
        layer.open({
            type: 1
            , title: '新增用户'
            , area: ['400px', '360px']
            , closeBtn: false
            , content: '<form class="layui-form" id="add">' +
                '        <div class="layui-inline" style="padding: 20px; line-height: 24px;">' +
                '            <label class="layui-form-label">用户姓名:</label>' +
                '            <div class="layui-input-inline">' +
                '                <input type="text"  required lay-verify="required" name="username" placeholder="请输入用户姓名"  class="layui-input">' +
                '            </div>' +
                '        </div>' +
                '        <div class="layui-inline" style="padding: 20px; line-height: 24px;">' +
                '            <label class="layui-form-label">用户密码:</label>' +
                '            <div class="layui-input-inline">' +
                '                <input type="text" required   lay-verify="required" name="password" placeholder="请输入用户密码"  class="layui-input">' +
                '            </div>' +
                '        </div>' +
                '        <div class="layui-inline" style="padding-left: 20px">' +
                '            <label class="layui-form-label">用户状态:</label>' +
                '            <div class="layui-input-inline">' +
                '                <input type="text" required   lay-verify="required" name="status" placeholder="请输入用户状态"  class="layui-input">' +
                '            </div>' +
                '        </div>' +
                '    </form>'
            , btn: ['确认添加', '取消']
            , btnAlign: 'c'
            , yes: function (index) {
                $.ajax({
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
                });
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

