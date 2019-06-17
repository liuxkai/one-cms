<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
  <style>
    .layui-form-label{
      float:left;
      display:block;
      padding:9px 15px;
      width:200px;
      font-weight:400;
      line-height:20px;
    }
  </style>
  <body>
  <div class="x-body" style="width: 50%;margin: 0 auto">
    <form class="layui-form layui-form-pane" >
      <div class="layui-form-item">
        <label  class="layui-form-label">
          <span class="x-red">*</span>姓名
        </label>
        <div class="layui-input-inline">
          <input type="text"  value="${teacher.name}" name="name" class="layui-input">
        </div>
      </div>
      <div class="layui-form-item">
        <label  class="layui-form-label">
          <span class="x-red">*</span>出生日期
        </label>
        <div class="layui-input-inline">
          <input type="text" value=" <fmt:formatDate value="${teacher.birthDate}" pattern="yyyy-MM-dd HH:mm:ss"/>" name="teacher"  class="layui-input">
        </div>
      </div>
      <div class="layui-form-item">
        <label  class="layui-form-label">
          <span class="x-red">*</span>联系方式
        </label>
        <div class="layui-input-inline">
          <input type="text" value="${teacher.contactWay}" name="contactWay"  class="layui-input">
        </div>
      </div>

      <div class="layui-col-md6">
        <div class="layui-card">
          <label  class="layui-form-label">
            <span class="x-red">*</span>简介
          </label>
            <div class="layui-col-md10">
              <textarea value="" class="layui-textarea">${teacher.memo}</textarea>
            </div>
        </div>
      </div>

      <div class="layui-form-item">
        <label  class="layui-form-label">
          <span class="x-red">*</span>出生日期
        </label>
        <div class="layui-input-inline">
          <input type="text" value="<fmt:formatDate value='${teacher.birthDate}' pattern='yyyy-MM-dd HH:mm:ss'/>" name="birthDate"  class="layui-input">
        </div>
      </div>
      <div class="layui-form-item">
        <label  class="layui-form-label">
          <span class="x-red">*</span>邮箱
        </label>
        <div class="layui-input-inline">
          <input type="text" value="${teacher.email}" name="email"  class="layui-input">
        </div>
      </div>
      <div class="layui-form-item">
        <label  class="layui-form-label">
          <span class="x-red">*</span>在线联系方式
        </label>
        <div class="layui-input-inline">
          <input type="text" value="${teacher.onlineContact}" name="onlineContact"  class="layui-input">
        </div>
      </div>
      <div class="layui-card-body layui-row layui-col-space10">

      </div>


        <div class="layui-form-item">
        <label  class="layui-form-label">
          <span class="x-red">*</span>联系地址
        </label>
          <div class="layui-col-md10">
            <textarea value="${teacher.address}" class="layui-textarea"></textarea>
          </div>
      </div>

      <div class="layui-form-item">
        <label  class="layui-form-label">
          <span class="x-red">*</span>性别
        </label>
        <div class="layui-input-inline">
          <input type="text"  value="<c:if test="${teacher.sex eq 0}">男</c:if><c:if test="${teacher.sex eq 1}">女</c:if>" name="sex" class="layui-input"/>
        </div>
      </div>
      <div class="layui-form-item">
        <div class="layui-inline">
          <label class="layui-form-label">职位</label>
          <div class="layui-input-inline">
              <c:forEach items="${typesList}" var="type">
                <c:if test="${type.typeName eq teacher.positions}">
                  <input type="text" value="${type.typeName}" name="positions"  class="layui-input">
                </c:if>
              </c:forEach>
          </div>
        </div>
      </div>
      <div class="layui-form-item">
        <label class="layui-form-label">是否锁定</label>
        <div class="layui-input-inline">
          <c:if test="${teacher.locked eq 1}">
            <input type="text" name="locked" value="已锁定"  class="layui-input">
          </c:if>
          <c:if test="${teacher.locked eq 0}">
            <input type="text" name="locked" value="正常"  class="layui-input">
          </c:if>
        </div>
      </div>
      <div class="layui-form-item">
        <label class="layui-form-label">是否删除</label>
        <div class="layui-input-inline">
        <c:if test="${teacher.deleted eq 1}">
          <input type="text" name="deleted" value="已删除" class="layui-input">
        </c:if>
        <c:if test="${teacher.deleted eq 0}">
          <input type="text" name="deleted" value="未删除" class="layui-input">
        </c:if>
        </div>
      </div>
    </form>
  </div>
  <script>
    $(function () {
        $("#positions option[value=${teacher.positions}]").prop("selected",true);
    });
  </script>
  </body>
</html>
