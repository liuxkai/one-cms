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
    <script type="text/javascript" src="../../static/js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="../../static/js/messages_zh.js"></script>
  </head>
  <style>

    label.error{
      background:url(../../static/images/unchecked.gif) no-repeat 10px 3px;
      padding-left: 30px;
      font-family:georgia;
      font-size: 15px;
      font-style: normal;
      color: red;
    }

    label.success{
      background:url(../../static/images/checked.gif) no-repeat 10px 3px;
      padding-left: 30px;
    }
  </style>
  <body>
  <div class="x-body">
    <form class="layui-form" method="post" action="/course/save?id=${course.id}">
      <div class="layui-form-item">
        <label for="L_username" class="layui-form-label">
          <span class="x-red">*</span>课程名称
        </label>
        <div class="layui-input-inline">
          <input type="text" id="L_username" value="${course.courseName}" name="courseName" required lay-verify="userName"
                 autocomplete="off" class="layui-input">
        </div>
      </div>
      <div class="layui-form-item">
        <div class="layui-inline">
          <label class="layui-form-label">课程类型</label>
          <div class="layui-input-inline">
            <select id="courseType" name="courseType">
              <option value="">请选择</option>
              <c:forEach items="${typesList}" var="type">
                <option value="${type.typeCode}">${type.typeName}</option>
              </c:forEach>
            </select>
          </div>
        </div>
      </div>
      <c:if test="${not empty course}">
        <div class="layui-form-item">
          <label  class="layui-form-label">
            <span class="x-red">*</span>是否删除
          </label>
          <div class="layui-col-md2">
            <input type="radio" name="deleted" value="0" title="已删除" <c:if test="${course.deleted eq 0}">checked</c:if> >
            <input type="radio" name="deleted" value="1" title="未删除" <c:if test="${course.deleted eq 1}">checked</c:if>>
          </div>
        </div>
      </c:if>
      <div class="layui-form-item">
        <label for="L_username" class="layui-form-label">
          <span class="x-red">*</span>课程简介
        </label>
        <div class="layui-input-inline">
          <input type="text" id="L_realname" value="${course.courseMemo}" name="courseMemo" required lay-verify="realName"
                 autocomplete="off" class="layui-input">
        </div>
      </div>
      <div class="layui-form-item">
        <label class="layui-form-label">
        </label>
        <button  class="layui-btn" id="add" lay-filter="add" >
          增加
        </button>
      </div>

    </form>
  </div>
  <script>
    $(function () {
        $("#courseType option[value=${course.courseType}]").prop("selected",true);
    });

  </script>
  </body>
</html>
