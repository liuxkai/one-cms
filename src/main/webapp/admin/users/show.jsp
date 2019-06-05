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
    <form class="layui-form" >
      <div class="layui-form-item">
        <label  class="layui-form-label">
          <span class="x-red">*</span>姓名
        </label>
        <div class="layui-input-inline">
          <input type="text"  value="${user.userName}" name="userName" class="layui-input">
        </div>
      </div>
      <div class="layui-form-item">
        <label  class="layui-form-label">
          <span class="x-red">*</span>真实姓名
        </label>
        <div class="layui-input-inline">
          <input type="text" value="${user.realName}" name="realName"  class="layui-input">
        </div>
      </div>
      <div class="layui-form-item">
        <label  class="layui-form-label">
          <span class="x-red">*</span>密码
        </label>
        <div class="layui-input-inline">
          <input type="text"  value="${user.passWord}" name=""  class="layui-input">
        </div>
      </div>
      <div class="layui-form-item">
        <label  class="layui-form-label">
          <span class="x-red">*</span>年龄
        </label>
        <div class="layui-input-inline">
          <input type="text" value="${user.age}" name=""  class="layui-input">
        </div>
      </div>

      <div class="layui-form-item">
        <label  class="layui-form-label">
          <span class="x-red">*</span>手机号码
        </label>
        <div class="layui-input-inline">
          <input type="text" value="${user.mobile}" name="" class="layui-input">
        </div>
      </div>

      <div class="layui-form-item">
        <label  class="layui-form-label">
          <span class="x-red">*</span>邮箱
        </label>
        <div class="layui-input-inline">
          <input type="text" value="${user.email}" name=""  class="layui-input">
        </div>
      </div>
      <div class="layui-form-item">
        <label  class="layui-form-label">
          <span class="x-red">*</span>登录次数
        </label>
        <div class="layui-input-inline">
          <input type="text" value="${user.loginCount}" name=""  class="layui-input">
        </div>
      </div>
      <div class="layui-form-item">
        <label  class="layui-form-label">
          <span class="x-red">*</span>最后登录IP
        </label>
        <div class="layui-input-inline">
          <input type="text" value="${user.lastLoginIp}" name=""  class="layui-input">
        </div>
      </div>
      <div class="layui-form-item">
        <label  class="layui-form-label">
          <span class="x-red">*</span>最后登录时间
        </label>
        <div class="layui-input-inline">
          <input type="text" value="${user.lastLoginTime}" name=""  class="layui-input">
        </div>
      </div>

      <div class="layui-form-item">
        <label  class="layui-form-label">
          <span class="x-red">*</span>添加时间
        </label>
        <div class="layui-input-inline">
          <input type="text"  value="${user.createTime}" name=""  class="layui-input">
        </div>

      </div>
      <div class="layui-form-item">
        <label  class="layui-form-label">
          <span class="x-red">*</span>性别
        </label>
        <div class="layui-input-inline">
          <input type="text"  value="<c:if test="${user.sex eq 0}">男</c:if><c:if test="${user.sex eq 1}">女</c:if>" name="sex" class="layui-input"/>
        </div>
      </div>
      <div class="layui-form-item">
        <div class="layui-inline">
          <label class="layui-form-label">职位</label>
          <div class="layui-input-inline">
            <select id="positions" name="positions">
              <option value="">请选择</option>
              <option value="经理">经理</option>
              <option value="主管">主管</option>
              <option value="码农">码农</option>
              <option value="端水">端水</option>
            </select>
          </div>
        </div>
      </div>

      <div class="layui-form-item">
        <div class="layui-inline">
          <label class="layui-form-label">用户类型</label>
          <div class="layui-input-inline">
            <select id="userType" name="userType">
              <option value="">请选择</option>
              <c:forEach items="${user.typesList}" var="type">
                <option value="${type.typeCode}">${type.typeName}</option>
              </c:forEach>
            </select>
          </div>
        </div>
      </div>
      <div class="layui-form-item">
        <label class="layui-form-label">是否锁定</label>
        <div class="layui-input-inline">
          <c:if test="${user.locked eq 1}">
            <input type="text" name="locked" value="已锁定"  class="layui-input">
          </c:if>
          <c:if test="${user.locked eq 0}">
            <input type="text" name="locked" value="正常"  class="layui-input">
          </c:if>
        </div>
      </div>
      <div class="layui-form-item">
        <label class="layui-form-label">是否删除</label>
        <div class="layui-input-inline">
          <c:if test="${user.deleted eq 1}">
            <input type="text" name="deleted" value="已删除" class="layui-input">
          </c:if>
          <c:if test="${user.deleted eq 0}">
            <input type="text" name="deleted" value="未删除" class="layui-input">
          </c:if>
        </div>
      </div>
    </form>
  </div>
  <script>
    $(function () {
        $("#positions option[value=${user.positions}]").prop('selected',true);
        $("#userType option[value=${course.courseType}]").prop("selected",true);
    });
      layui.use(['form','layer'], function(){
          $ = layui.jquery;
          var form = layui.form
              ,layer = layui.layer;


      });
  </script>
  </body>
</html>
