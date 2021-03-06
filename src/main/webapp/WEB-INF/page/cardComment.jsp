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

            <script type="text/html" id="barDemo">
                <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
                &nbsp;
                <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">通过</a>
                &nbsp;
                <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">驳回</a>
            </script>
            <script type="text/html" id="forInfoType">
                {{#if (d.commentType == 0) { }}
                <span>审核中</span>
                {{# }else if(d.commentType == 1){ }}
                <span>通过审核</span>
                {{# }else if(d.commentType == 2){ }}
                <span>审核失败</span>
                {{# } }}
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
            , url: '/cardComment/index.action'
            , id: 'contentReload'
            , page: true
            , height: 600
            , limit: 6
            , limits: [6, 8, 10, 12]
            , cols: [[
                {checkbox: true, fixed: true}
                , {field: 'commentContent', title: '评论内容', align: 'center'}
                , {field: 'userName', title: '评论用户', align: 'center'}
                , {field: 'infoName', title: '所属请柬名称', align: 'center'}
                , {field: 'commentType', title: '审核状态', align: 'center', toolbar: '#forInfoType'}
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
                //用户评论审核通过
                $.ajax({
                    url: '/cardComment/pass.json',
                    type: 'post',
                    data: {
                        'commentId':data.commentId,
                        'commentType':'1'
                    },
                    dataType: 'json',
                    success: function () {
                        layer.msg("审核通过")
                        setTimeout(function () {
                            location.reload(true);
                        },2000)
                    },
                    error: function () {
                        alert("审核通过失败");
                    }
                });
                layer.close(index);
            } else if (layEvent === 'del') {
                //用户评论审核通过
                $.ajax({
                    url: '/cardComment/pass.json',
                    type: 'post',
                    data: {
                        'commentId':data.commentId,
                        'commentType':'2'
                    },
                    dataType: 'json',
                    success: function () {
                        layer.msg("审核驳回")
                        setTimeout(function () {
                            location.reload(true);
                        },2000)
                    },
                    error: function () {
                        alert("审核驳回失败");
                    }
                });
                layer.close(index);
            } else if (layEvent === 'edit') {
                layer.open({
                    type: 2
                    , title: '用户评论内容修改'
                    , area: ['500px', '300px']
                    , closeBtn: 1
                    , btnAlign: 'c'
                    , content: "/web/fromComment.action?commentId=" + data.commentId
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

