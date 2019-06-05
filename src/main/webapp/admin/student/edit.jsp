<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
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
    <form class="layui-form" method="post" action="/student/save?id=${student.id}">
      <div class="layui-form-item">
        <label  class="layui-form-label">
          <span class="x-red">*</span>姓名
        </label>
        <div class="layui-input-inline">
          <input type="text"  value="${student.email}" name="name" required lay-verify="name"
                 autocomplete="off" class="layui-input">
        </div>
        <div class="layui-form-mid layui-word-aux">
          <span class="x-red">*</span>
        </div>
      </div>
      <div class="layui-form-item">
        <label  class="layui-form-label">
          <span class="x-red">*</span>班级
        </label>
        <div class="layui-input-inline">
          <input type="text" value="${student.clazz}" name="clazz" required lay-verify="clazz"
                 autocomplete="off" class="layui-input">
        </div>
      </div>
      <div class="layui-form-item">
        <label  class="layui-form-label">
          <span class="x-red">*</span>公司
        </label>
        <div class="layui-input-inline">
          <input type="text"  value="${student.company}" name="company" required lay-verify="company"
                 autocomplete="off" class="layui-input">
        </div>
      </div>
      <div class="layui-form-item">
        <label  class="layui-form-label">
          <span class="x-red">*</span>薪资
        </label>
        <div class="layui-input-inline">
          <input type="text" value="${student.salary}" name="salary" required lay-verify="salary"
                 autocomplete="off" class="layui-input">
        </div>
      </div>

      <div class="layui-form-item">
        <label  class="layui-form-label">
          <span class="x-red">*</span>毕业院校
        </label>
        <div class="layui-input-inline">
          <input type="text" value="${student.school}" name="school" required lay-verify="school"
                 autocomplete="off" class="layui-input">
        </div>
      </div>

      <div class="layui-form-item">
        <label  class="layui-form-label">
          <span class="x-red">*</span>联系方式
        </label>
        <div class="layui-input-inline">
          <input type="text" value="${student.contactWay}" name="contactWay" required lay-verify="contactWay"
                 autocomplete="off" class="layui-input">
        </div>
      </div>
      <div class="layui-form-item">
        <label  class="layui-form-label">
          <span class="x-red">*</span>邮箱
        </label>
        <div class="layui-input-inline">
          <input type="text" value="${student.email}" name="email" required lay-verify="mobile"
                 autocomplete="off" class="layui-input">
        </div>
      </div>
      <div class="layui-form-item">
        <label  class="layui-form-label">
          <span class="x-red">*</span>在线联系方式
        </label>
        <div class="layui-input-inline">
          <input type="text" value="${student.onlineContact}" name="onlineContact" required lay-verify="onlineContact"
                 autocomplete="off" class="layui-input">
        </div>
      </div>
      <div class="layui-form-item">
        <label  class="layui-form-label">
          <span class="x-red">*</span>联系地址
        </label>
        <div class="layui-input-inline">
          <input type="text" value="${student.address}" name="address" required lay-verify="mobile"
                 autocomplete="off" class="layui-input">
        </div>
      </div>

      <div class="layui-form-item">
        <label  class="layui-form-label">
          <span class="x-red">*</span>专业
        </label>
        <div class="layui-input-inline">
          <input type="text"  value="${student.major}" name="major" required lay-verify="passWord"
                 autocomplete="off" class="layui-input">
        </div>
        <div class="layui-form-mid layui-word-aux">
          6到16个字符
        </div>
      </div>
      <div class="layui-form-item">
        <label  class="layui-form-label">
          <span class="x-red">*</span>性别
        </label>

        <div class="layui-col-md2">
          <input type="radio" name="sex" value="0" title="男" <c:if test="${student.sex eq 0}">checked</c:if> >
          <input type="radio" name="sex" value="1" title="女" <c:if test="${student.sex eq 1}">checked</c:if>>
          <input type="radio" name="sex" value="2" title="中性" disabled>
        </div>
      </div>
      <div class="layui-form-item">
        <div class="layui-inline">
          <label class="layui-form-label">学历</label>
          <div class="layui-input-inline">
            <select id="education" name="education">
              <option value="">请选择</option>
              <option value="0">初中</option>
              <option value="1">高中</option>
              <option value="2">大专</option>
              <option value="3">本科</option>
              <option value="4">研究生</option>
              <option value="5">硕士</option>
            </select>
          </div>
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
        $("#education option[value=${student.education}]").prop("selected",true);
        $("#locked option[value=${student.locked}]").prop("selected",true);
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
