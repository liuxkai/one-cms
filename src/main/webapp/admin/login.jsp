<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录页</title>
    <link rel="stylesheet" href="${ctx }/static/lib/layui/css/layui.css" type="text/css">
    <script src="${ctx }/static/js/jquery-1.10.2min.js" type="text/javascript"></script>
    <script src="${ctx}/static/lib/layui/layui.js" type="text/javascript"></script>
</head>
<style>
    .father{width:1000px;height:auto;margin:0 auto;}
    .layui-input{width:300px;line-height:40px;}
    .login-main{margin-top:100px;margin-left:350px;width:300px;height:400px;/* border:1px solid #e6e6e6; */}
    .layui-form{margin-top:20px;}
    .layui-input-inline{margin-top:30px;}
    button{width:300px;}
</style>
<body>

<div class="father">
    <div class="login-main">
        ，<p style="color:#009688;font-size:25px;text-align:center;">欢迎登陆</p>
        <form class="layui-form">
            <div class="layui-input-inline">
                <input type="text" class="layui-input" name="username" required lay-verify="required" placeholder="请输入用户名" autocomplete="off"
                       class="layui-input">
            </div>
            <br>
            <div class="layui-input-inline">
                <input type="password" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off"
                       class="layui-input">
            </div>
            <br>
            <div class="layui-input-inline login-btn">
                <button lay-submit lay-filter="login" class="layui-btn  layui-btn-normal">登录</button>
            </div>
            <hr/>

            <p><a href="javascript:;" class="fr">使用手册</a></p>
        </form>
    </div>
</div>

<script src="${ctx}/static/lib/layui/layui.js" type="text/javascript"></script>
<script type="text/javascript">
    layui.use(['form','layer','jquery'], function () {

        // 操作对象
        var form = layui.form;
        var $ = layui.jquery;
        form.on('submit(login)',function (data) {
            // console.log(data.field);
            $.ajax({
                url:'/users/login',
                data:data.field,
                dataType:'text',
                type:'post',
                success:function (data) {
                    if (data == '1'){
                        location.href = "index.php";
                    }else{
                        layer.msg('登录名或密码错误');
                    }
                }
            })
            return false;
        })

    });
</script>
</body>
</html>
