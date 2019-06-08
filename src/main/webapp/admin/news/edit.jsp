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
    <link href="${ctx}/static/css/bootstrap.min.css" rel="stylesheet">

    <script type="text/javascript" charset="utf-8" src="../../ueditor/utf8-jsp/ueditor.config.js"></script>

    <script type="text/javascript" charset="utf-8" src="../../ueditor/utf8-jsp/ueditor.all.min.js"> </script>

    <script type="text/javascript" charset="utf-8" src="../../ueditor/utf8-jsp/lang/zh-cn/zh-cn.js"></script>
    <link href="${ctx}/static/css/bootstrap-fileinput.css" rel="stylesheet">
    <script src="${ctx}/static/js/jquery.min.js"></script>
    <script src="${ctx}/static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${ctx}/static/js/xadmin.js"></script>
    <script type="text/javascript" src="${ctx}/static/My97DatePicker/WdatePicker.js"></script>
    <script src="${ctx}/static/js/bootstrap-fileinput.js"></script>

    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
  <div class="x-body">
    <form class="layui-form" method="post" enctype="multipart/form-data" action="/news/save?id=${news.id}&uuid=${news.uuid}">
      <div class="layui-form-item">
        <label  class="layui-form-label">
          <span class="x-red">*</span>新闻标题
        </label>
        <div class="layui-input-inline">
          <input type="text"  value="${news.title}" name="title" class="layui-input">
        </div>
      </div>
      <div class="layui-form-item">
        <div class="layui-inline">
          <label class="layui-form-label">新闻类型</label>
          <div class="layui-input-inline">
            <select id="newsType" name="newsType">
              <option value="">请选择</option>
              <c:forEach items="${newsType}" var="type">
                <option value="${type.typeName}">${type.typeName}</option>
              </c:forEach>
            </select>
          </div>
        </div>
      </div>

      <div class="layui-form-item" >
        <label class="layui-form-label">
          <span class="x-red">*</span>主图路径
        </label>
        <div class="fileinput fileinput-new" data-provides="fileinput"  id="exampleInputUpload">
          <div class="fileinput-new thumbnail" style="width: 100px;height: auto;max-height:150px;">
            <img id='picImg'  style="width: 100%;height: auto;max-height: 140px;" src="${ctx}/static/images/pic/1.png" alt="" />
          </div>
          <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px;"></div>
          <div>
              <span class="btn btn-primary btn-file">
                  <span class="fileinput-new">选择文件</span>
                  <span class="fileinput-exists">换一张</span>
                  <input type="file" value="${news.imagePath}" name="file" id="picID" accept="image/gif,image/jpeg,image/x-png"/>
              </span>
            <a href="javascript:;" class="btn btn-warning fileinput-exists" data-dismiss="fileinput">移除</a>
          </div>
        </div>
      </div>

      <div class="layui-col-md6" style="margin-bottom: 20px">
        <div class="layui-card">
          <label  class="layui-form-label">
            <span class="x-red">*</span>主图说明
          </label>
          <div class="layui-col-md10">
            <textarea name="imageMemo" placeholder=""  class="layui-textarea">${news.imageMemo}</textarea>
          </div>
        </div>
      </div>

        <div class="layui-form-item" >
            <label class="layui-form-label">
                <span class="x-red">*</span>视频
            </label>
          <div class="fileinput fileinput-new" data-provides="fileinput" >
            <div class="fileinput-new thumbnail" style="width: 100px;height: auto;max-height:150px;">
              <img id='picVideo'  style="width: 100%;height: auto;max-height: 140px;" src="${ctx}/static/images/pic/1.png" alt="" />
            </div>
            <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px;"></div>
            <div>
              <span class="btn btn-primary btn-file">
                  <span class="fileinput-new">选择文件</span>
                  <span class="fileinput-exists">换一张</span>
                  <input type="file" value="${news.imagePath}"  name="file"  accept=""/>
              </span>
              <a href="javascript:;" class="btn btn-warning fileinput-exists" data-dismiss="fileinput">移除</a>
            </div>
          </div>
        </div>


      <div class="layui-col-md6" style="margin-bottom: 20px">
        <div class="layui-card">
          <label  class="layui-form-label">
            <span class="x-red">*</span>视频说明
          </label>
          <div class="layui-col-md10">
            <textarea name="videoDesc" placeholder="" class="layui-textarea">${news.videoDesc}</textarea>
          </div>
        </div>
      </div>

      <div class="layui-form-item">
        <label  class="layui-form-label">
          <span class="x-red">*</span>摘要
        </label>
        <div class="layui-input-inline">
          <input type="text" value="${news.summary}" name="summary"  class="layui-input">
        </div>
      </div>

      <div class="layui-form-item">
      <label  class="layui-form-label">
        <span class="x-red">*</span>新闻内容
      </label>
      <div class="layui-input-inline" style="height: 250px;width: 602px;margin-bottom: 60px;">
        <textarea style="padding: 0px 0px;" id="editor" name="content" class="layui-textarea">${news.content}</textarea>
      </div>
      </div>

      <div class="layui-form-item">
        <label  class="layui-form-label">
          <span class="x-red">*</span>作者
        </label>
        <div class="layui-input-inline">
          <input type="text" value="${news.author}" name="author"  class="layui-input">
        </div>
      </div>

      <div class="layui-form-item">
        <label  class="layui-form-label">
          <span class="x-red">*</span>信息来源
        </label>
        <div class="layui-col-md10">
          <textarea name="infoSource" class="layui-textarea">${news.infoSource}</textarea>
        </div>
      </div>

      <div class="layui-form-item">
        <label  class="layui-form-label">
          <span class="x-red">*</span>失效时间
        </label>
        <div class="layui-input-inline">
          <input type="text" value="<fmt:formatDate value='${news.invalidDate}' pattern='yyyy-MM-dd HH:mm:ss'/>" name="invalidDate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" class="layui-input">
        </div>
      </div>
      <div class="layui-form-item">
        <label  class="layui-form-label">
          <span class="x-red">*</span>发布时间
        </label>
        <div class="layui-input-inline">
          <input type="text" value="<fmt:formatDate value='${news.publishTime}' pattern='yyyy-MM-dd HH:mm:ss'/>" name="publishTime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" class="layui-input">
        </div>
      </div>
      <div class="layui-form-item">
        <label  class="layui-form-label">
          <span class="x-red">*</span>最后浏览时间
        </label>
        <div class="layui-input-inline">
          <input type="text" value="<fmt:formatDate value='${news.viewDatetime}' pattern='yyyy-MM-dd HH:mm:ss'/>" name="viewDatetime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" class="layui-input">
        </div>
      </div>

      <div class="layui-form-item">
        <label  class="layui-form-label">
          <span class="x-red">*</span>浏览次数
        </label>
        <div class="layui-input-inline">
          <input type="text" value="${news.viewCount}" name="viewCount"  class="layui-input">
        </div>
      </div>


      <div class="layui-form-item">
        <label class="layui-form-label">信息状态</label>
        <div class="layui-input-inline">
          <select id="infoState" name="infoState">
            <option value="">请选择</option>
            <option value="0">默认</option>
            <option value="1">直接发布</option>
            <option value="-2">已修改(未发布)</option>
            <option value="2">已修改(已发布)</option>
            <option value="3">已审核(已发布)</option>
            <option value="-3">已审核(未发布)</option>
          </select>
        </div>
      </div>
      <c:if test="${not empty news.author}">
      <div class="layui-form-item">
        <label class="layui-form-label">是否删除</label>
        <div class="layui-input-inline">
          <select id="deleted" name="deleted">
            <option value="">请选择</option>
            <option value="1">已删除</option>
            <option value="0">未删除</option>
          </select>
        </div>
      </div>
      </c:if>
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
          $("#infoState option[value=${news.infoState}]").prop("selected",true);
          $("#newsType option[value=${news.newsType}]").prop("selected",true);
          $("#deleted option[value=${news.deleted}]").prop("selected",true);

          $("#add").click(function () {
              $("form").submit();

          });
      });
      UE.getEditor('editor',{ initialFrameWidth: null , autoHeightEnabled: false});


  </script>
      </body>
</html>
