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
  <body>
  <div class="x-body">
    <form class="layui-form" >
      <div class="layui-form-item">
        <label  class="layui-form-label">
          <span class="x-red">*</span>新闻标题
        </label>
        <div class="layui-input-inline">
          <input type="text"  value="${news.title}" name="" class="layui-input">
        </div>
      </div>
      <div class="layui-form-item">
        <label  class="layui-form-label">
          <span class="x-red">*</span>主图路径
        </label>
        <div class="layui-input-inline">
          <input type="text" value="${news.imagePath}" name=""  class="layui-input">
        </div>
      </div>
      <div class="layui-col-md6">
        <div class="layui-card">
          <label  class="layui-form-label">
            <span class="x-red">*</span>主图说明
          </label>
          <div class="layui-col-md10">
            <textarea name="${news.imageMemo}" placeholder="" class="layui-textarea"></textarea>
          </div>
        </div>
      </div>

      <div class="layui-form-item">
        <label  class="layui-form-label">
          <span class="x-red">*</span>视频路径
        </label>
        <div class="layui-input-inline">
          <input type="text"  value="${news.videoPath}" name=""  class="layui-input">
        </div>
      </div>
      <div class="layui-col-md6">
        <div class="layui-card">
          <label  class="layui-form-label">
            <span class="x-red">*</span>视频说明
          </label>
          <div class="layui-col-md10">
            <textarea name="${news.videoDesc}" placeholder="" class="layui-textarea"></textarea>
          </div>
        </div>
      </div>

      <div class="layui-form-item">
        <label  class="layui-form-label">
          <span class="x-red">*</span>摘要
        </label>
        <div class="layui-input-inline">
          <input type="text" value="${news.summary}" name=""  class="layui-input">
        </div>
      </div>

      <div class="layui-form-item">
        <label  class="layui-form-label">
          <span class="x-red">*</span>新闻内容
        </label>
        <div class="layui-col-md10">
          <textarea name="${news.content}" placeholder="" class="layui-textarea"></textarea>
        </div>
      </div>

      <div class="layui-form-item">
        <label  class="layui-form-label">
          <span class="x-red">*</span>作者
        </label>
        <div class="layui-input-inline">
          <input type="text" value="${news.author}" name=""  class="layui-input">
        </div>
      </div>
      <div class="layui-form-item">
        <label  class="layui-form-label">
          <span class="x-red">*</span>信息来源
        </label>
        <div class="layui-input-block">
          <input type="text" value="${news.infoSource}" name=""  class="layui-input">
        </div>
      </div>

      <div class="layui-form-item">
        <label  class="layui-form-label">
          <span class="x-red">*</span>失效时间
        </label>
        <div class="layui-input-inline">
          <input type="text" value="<fmt:formatDate value='${news.invalidDate}' pattern='yyyy-MM-dd HH:mm:ss'/>" name="birthDate"  class="layui-input">
        </div>
      </div>
      <div class="layui-form-item">
        <label  class="layui-form-label">
          <span class="x-red">*</span>发布时间
        </label>
        <div class="layui-input-inline">
          <input type="text" value="<fmt:formatDate value='${news.publishTime}' pattern='yyyy-MM-dd HH:mm:ss'/>" name="birthDate"  class="layui-input">
        </div>
      </div>
      <div class="layui-form-item">
        <label  class="layui-form-label">
          <span class="x-red">*</span>最后浏览时间
        </label>
        <div class="layui-input-inline">
          <input type="text" value="<fmt:formatDate value='${news.viewDatetime}' pattern='yyyy-MM-dd HH:mm:ss'/>" name="viewDatetime"  class="layui-input">
        </div>
      </div>

      <div class="layui-form-item">
        <label  class="layui-form-label">
          <span class="x-red">*</span>浏览次数
        </label>
        <div class="layui-input-inline">
          <input type="text" value="${news.viewCount}" name=""  class="layui-input">
        </div>
      </div>


      <div class="layui-form-item">
        <label class="layui-form-label">信息状态</label>
        <div class="layui-input-inline">
          <c:if test="${news.infoState eq 1}">
            <input type="text" name="locked" value="直接发布"  class="layui-input">
          </c:if>
          <c:if test="${news.infoState eq 0}">
            <input type="text" name="locked" value="默认"  class="layui-input">
          </c:if>
          <c:if test="${news.infoState eq 2}">
            <input type="text" name="locked" value="已修改(已发布)"  class="layui-input">
          </c:if>
          <c:if test="${news.infoState eq -2}">
            <input type="text" name="locked" value="已修改(未发布)"  class="layui-input">
          </c:if>
          <c:if test="${news.infoState eq 3}">
            <input type="text" name="locked" value="已审核(已发布)"  class="layui-input">
          </c:if>
          <c:if test="${news.infoState eq -3}">
            <input type="text" name="locked" value="已审核(未发布)"  class="layui-input">
          </c:if>
        </div>
      </div>
      <div class="layui-form-item">
        <label class="layui-form-label">是否删除</label>
        <div class="layui-input-inline">
        <c:if test="${news.deleted eq 1}">
          <input type="text" name="deleted" value="已删除" class="layui-input">
        </c:if>
        <c:if test="${news.deleted eq 0}">
          <input type="text" name="deleted" value="未删除" class="layui-input">
        </c:if>
        </div>
      </div>
    </form>
  </div>
  <script>
    $(function () {
        <%--$("#usertype option[value=${new.education}]").prop("selected",true);--%>
    });
  </script>
  </body>
</html>
