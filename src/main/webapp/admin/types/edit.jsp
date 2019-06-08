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
    <script type="text/javascript" src="${ctx}/static/My97DatePicker/WdatePicker.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
  <div class="x-body">
    <form class="layui-form" method="post" action="/types/save?id=${type.id}">


      <c:choose>

        <c:when test="${ not empty type.children}">
          <div class="layui-form-item">
            <label  class="layui-form-label">
              <span class="x-red">*</span>类型名称
            </label>
            <div class="layui-input-inline">
              <input type="text" value="${type.typeName}" name="typeName"  class="layui-input">
            </div>
          </div>
        </c:when>

        <c:otherwise>
          <div class="layui-form-item">
            <div class="layui-inline">
              <label class="layui-form-label">父级类型</label>
              <div class="layui-input-inline">
                <select id="parentCode" name="parentCode">
                  <option value="">请选择</option>
                  <c:forEach items="${parentTypeList}" var="parent">
                    <option value="${parent.typeCode}">${parent.typeName}</option>
                  </c:forEach>
                </select>
              </div>
            </div>
          </div>
          <div class="layui-form-item">
            <label  class="layui-form-label">
              <span class="x-red">*</span>类型名称
            </label>
            <div class="layui-input-inline">
              <input type="text" value="${type.typeName}" name="typeName" class="layui-input">
            </div>
          </div>

        </c:otherwise>
      </c:choose>

      <div class="layui-col-md6">
        <div class="layui-card">
          <label  class="layui-form-label">
            <span class="x-red">*</span>类型说明
          </label>
          <div class="layui-col-md10">
            <textarea name="typeMemo"  placeholder="" class="layui-textarea">${type.typeMemo}</textarea>
          </div>
        </div>
      </div>

      <div class="layui-form-item">
        <label  class="layui-form-label">
          <span class="x-red">*</span>添加时间
        </label>
        <div class="layui-input-inline">
          <input type="text"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" value="<fmt:formatDate value="${type.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" class="layui-input">
        </div>
        <div class="layui-form-mid layui-word-aux">
          <span class="x-red">*</span>
        </div>
      </div>
      <div class="layui-form-item">
        <label class="layui-form-label">是否锁定</label>
        <div class="layui-input-inline">
          <c:if test="${type.locked eq 1}">
            <input type="hidden" name="locked" value="${type.locked}" >
            <input type="text"  value="已锁定"  class="layui-input">
          </c:if>
          <c:if test="${type.locked eq 0}">
            <input type="text" value="已锁定"  class="layui-input">
            <input type="hidden" name="locked" value="${type.locked}"  >
          </c:if>
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
        $("#parentCode option[value=${type.parentCode}]").prop("selected",true);
        $("#add").click(function () {
            $("form").submit();

        });
    });
  </script>
  </body>
</html>
