<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>欢迎页面-L-admin1.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${ctx}/static/css/font.css">
    <link rel="stylesheet" href="${ctx}/static/css/xadmin.css">
    <link rel="stylesheet" href="${ctx}/static/css/layuiadmin.css">
    <link rel="stylesheet" href="${ctx}/static/lib/layui/css/layui.css">
    <script src="${ctx}/static/js/jquery.min.js"></script>
    <script src="${ctx}/static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${ctx}/static/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
  <div class="x-body">
    <form class="layui-form" method="post" action="/users/save?id=${user.id}">
      <div class="layui-form-item">
        <label for="L_email" class="layui-form-label">
          <span class="x-red">*</span>邮箱
        </label>
        <div class="layui-input-inline">
          <input type="text" id="L_email" value="${user.email}" name="email" required lay-verify="email"
                 autocomplete="off" class="layui-input">
        </div>
        <div class="layui-form-mid layui-word-aux">
          <span class="x-red">*</span>将会成为您唯一的登入名
        </div>
      </div>
      <div class="layui-form-item">
        <label for="L_username" class="layui-form-label">
          <span class="x-red">*</span>用户名
        </label>
        <div class="layui-input-inline">
          <input type="text" id="L_username" value="${user.userName}" name="userName" required lay-verify="userName"
                 autocomplete="off" class="layui-input">
        </div>
      </div>
      <div class="layui-form-item">
        <label for="L_username" class="layui-form-label">
          <span class="x-red">*</span>真实姓名
        </label>
        <div class="layui-input-inline">
          <input type="text" id="L_realname" value="${user.realName}" name="realName" required lay-verify="realName"
                 autocomplete="off" class="layui-input">
        </div>
      </div>
      <div class="layui-form-item">
        <label for="L_username" class="layui-form-label">
          <span class="x-red">*</span>手机号码
        </label>
        <div class="layui-input-inline">
          <input type="text" id="L_mobile" value="${user.mobile}" name="mobile" required lay-verify="mobile"
                 autocomplete="off" class="layui-input">
        </div>
      </div>
      <div class="layui-form-item">
        <label for="L_pass" class="layui-form-label">
          <span class="x-red">*</span>密码
        </label>
        <div class="layui-input-inline">
          <input type="password" id="L_pass" value="${user.passWord}" name="passWord" required lay-verify="passWord"
                 autocomplete="off" class="layui-input">
        </div>
        <div class="layui-form-mid layui-word-aux">
          6到16个字符
        </div>
      </div>
      <div class="layui-form-item">
        <label for="L_pass" class="layui-form-label">
          <span class="x-red">*</span>性别
        </label>

        <div class="layui-col-md2">
          <input type="radio" name="sex" value="0" title="男" <c:if test="${user.sex eq 0}">checked</c:if> >
          <input type="radio" name="sex" value="1" title="女" <c:if test="${user.sex eq 1}">checked</c:if>>
          <input type="radio" name="sex" value="3" title="中性" disabled>
        </div>
      </div>
      <div class="layui-form-item">
        <div class="layui-inline">
          <label class="layui-form-label">用户类型</label>
          <div class="layui-input-inline">
            <select id="usertype" name="userType">
              <option value="">请选择</option>
              <option value="0">学生</option>
              <option value="1">其他</option>
              <option value="2">老师</option>
            </select>
          </div>
        </div>
      </div>
      <div class="layui-form-item">
        <label class="layui-form-label">所属职称：</label>
        <div id="positions" class="layui-input-block">
          <input type="radio" name="positions" value="${user.positions}" title="经理" >
          <input type="radio" name="positions" value="${user.positions}" title="主管" >
          <input type="radio" name="positions" value="${user.positions}" title="码农">
          <input type="radio" name="positions" value="${user.positions}" title="端水">
        </div>
      </div>
      <div class="layui-form-item">
        <label class="layui-form-label">是否锁定</label>
        <div class="layui-input-block">
          <c:if test="${user.locked eq 1}">
            <input type="checkbox" name="locked" value="${user.locked}" lay-skin="switch" lay-text="ON|OFF" checked>
          </c:if>
          <c:if test="${user.locked eq 0}">
            <input type="checkbox" name="locked" value="${user.locked}" lay-skin="switch" lay-text="OFF|ON">
          </c:if>
        </div>
      </div>
      <div class="layui-form-item">
        <label class="layui-form-label">
        </label>
        <button  class="layui-btn" id="add" lay-filter="add" lay-submit="">
          增加
        </button>
      </div>
    </form>
  </div>
  <script>
    $(function () {
        $("#usertype option[value=${user.userType}]").prop("selected",true);
        $("#positions input[value=${user.positions}]").prop('checked',true);
    });
      layui.use(['form','layer'], function(){
          $ = layui.jquery;
          var form = layui.form
              ,layer = layui.layer;


          $("#add").click(function () {
              $("form").submit();

          });

      });
  </script>
  </body>
</html>
