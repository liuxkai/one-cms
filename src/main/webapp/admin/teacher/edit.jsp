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
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${ctx}/static/css/font.css">
    <link rel="stylesheet" href="${ctx}/static/css/xadmin.css">
    <link rel="stylesheet" href="${ctx}/static/css/layuiadmin.css">
    <link rel="stylesheet" href="${ctx}/static/lib/layui/css/layui.css">


    <script type="text/javascript" charset="utf-8" src="../../ueditor/utf8-jsp/ueditor.config.js"></script>

    <script type="text/javascript" charset="utf-8" src="../../ueditor/utf8-jsp/ueditor.all.min.js"> </script>

    <script type="text/javascript" charset="utf-8" src="../../ueditor/utf8-jsp/lang/zh-cn/zh-cn.js"></script>
    <script src="${ctx}/static/js/jquery.min.js"></script>
    <script src="${ctx}/static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${ctx}/static/js/xadmin.js"></script>
    <script type="text/javascript" src="${ctx}/static/My97DatePicker/WdatePicker.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
  <div class="x-body">
    <form class="layui-form" method="post" action="/teacher/save?id=${teacher.id}">
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
          <input type="text"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" value=" <fmt:formatDate value="${teacher.birthDate}" pattern="yyyy-MM-dd HH:mm:ss"/>" name="birthDate"  class="layui-input">
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

      <label  class="layui-form-label">
        <span class="x-red">*</span>简介
      </label>
      <div class="layui-form-item" style="height: 270px;width: 602px;margin-left: 110px;margin-bottom: 30px;">
            <textarea style="padding: 0px 0px;" id="editor" name="memo" class="layui-textarea">${teacher.memo}</textarea>
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
        <div class="layui-input-block">
          <input type="text" value="${teacher.address}" name="address"  autocomplete="off" class="layui-input">
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">
          <span class="x-red">*</span>性别
        </label>
        <div class="layui-col-md2">
          <input type="radio" name="sex" value="0" title="男" <c:if test="${teacher.sex eq 0}">checked</c:if> >
          <input type="radio" name="sex" value="1" title="女" <c:if test="${teacher.sex eq 1}">checked</c:if>>
          <input type="radio" name="sex" value="3" title="中性" disabled>
        </div>
      </div>

      <div class="layui-form-item">
        <div class="layui-inline">
          <label class="layui-form-label">职位</label>
          <div class="layui-input-inline">
            <select id="positions" name="positions">
              <option value="">请选择</option>
              <c:forEach items="${typesList}" var="type">
                <option value="${type.typeName}">${type.typeName}</option>
              </c:forEach>
            </select>
          </div>
        </div>
      </div>
      <c:if test="${not empty teacher}">
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
      </c:if>
      <div class="layui-form-item">
        <label class="layui-form-label">
        </label>
        <button  class="layui-btn" id="add" lay-filter="add" lay-submit="">
          增加
        </button>
      </div>
    </form>
  </div>
  <script type="text/javascript" charset="utf-8">
    $(function () {
        $("#positions option[value=${teacher.positions}]").prop("selected",true);
        $("#add").click(function () {
            $("form").submit();

        });
    });
        UE.getEditor('editor',{ initialFrameWidth: null , autoHeightEnabled: false});
  </script>
  </body>
</html>
