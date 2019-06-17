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
    <link rel="stylesheet" href="../../static/lib/layui/css/layui.css">
    <link href="${ctx}/static/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../../static/css/plyr.css">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../static/css/default.css">
    <link href="../../static/css/fileinput.css" media="all" rel="stylesheet" type="text/css" />
    <script src="../../static/js/plyr.js"></script>
    <script type="text/javascript" charset="utf-8" src="../../ueditor/utf8-jsp/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="../../ueditor/utf8-jsp/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="../../ueditor/utf8-jsp/lang/zh-cn/zh-cn.js"></script>
    <%--<link href="${ctx}/static/css/bootstrap-fileinput.css" rel="stylesheet">--%>

    <script src="${ctx}/static/js/jquery.min.js"></script>
    <script src="${ctx}/static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${ctx}/static/js/xadmin.js"></script>
    <script type="text/javascript" src="${ctx}/static/My97DatePicker/WdatePicker.js"></script>
    <%--<script src="${ctx}/static/js/bootstrap-fileinput.js"></script>--%>
    <%--文件上传--%>
    <script src="../../static/js/fileinput.js" type="text/javascript"></script>
    <script src="../../static/js/fileinput_locale_zh.js" type="text/javascript"></script>
    <script src="../../static/js/bootstrap.min.js" type="text/javascript"></script>


    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <script src="http://libs.useso.com/js/html5shiv/3.7/html5shiv.min.js"></script>
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
    .layui-form-label{
      float:left;
      display:block;
      padding:9px 15px;
      width:200px;
      font-weight:400;
      line-height:20px;
      margin-right: 30px;
    }

  </style>
  <body>
  <div class="x-body" style="margin-left: 200px;">
    <form class="layui-form layui-form-pane" id="newsForm" method="post" enctype="multipart/form-data" action="/news/save?id=${news.id}&uuid=${news.uuid}">
      <div class="layui-form-item">
        <label  class="layui-form-label layui-bg-green">标题</label>
        <div class="layui-input-inline">
          <input type="text" id="file" value="${news.title}" name="title" class="layui-input">
        </div>
      </div>

      <div class="layui-form-item">
          <label class="layui-form-label layui-bg-green">类型</label>
          <div class="layui-input-inline">
            <select id="newsType" name="newsType">
              <option value="">请选择</option>
              <c:forEach items="${newsType}" var="type">
                <option value="${type.typeName}">${type.typeName}</option>
              </c:forEach>
            </select>
          </div>
      </div>

      <div class="layui-form-item" >
        <label class="layui-form-label layui-bg-green">主图</label>
        <div class="layui-input-inline" style="width: 400px;">
            <input id="file-0a" class="file" name="File" type="file"  data-min-file-count="1">
        </div>
      </div>

      <div class="layui-col-md8" style="margin-bottom: 20px">
        <div class="layui-card">
          <label  class="layui-form-label layui-bg-green">说明</label>
          <div class="layui-col-md8">
            <textarea name="imageMemo" class="layui-textarea">${news.imageMemo}</textarea>
          </div>
        </div>
      </div>

      <div class="layui-form-item" >
          <label class="layui-form-label">视频</label>
          <div class="layui-input-inline" style="width: 400px;">
              <input class="file" name="File" type="file" data-min-file-count="1">
          </div>
      </div>


      <c:if test="${not empty news.videoPath}">
        <div class="layui-form-item">
          <label  class="layui-form-label">
            上传视频预览
          </label>
          <div  style="margin-right: auto;margin-left:140px;  width: 640px; ">
            <video poster="vs.png" controls>
              <source src="${ctx}/${news.videoPath}" type="video/mp4">
            </video>
          </div>
        </div>
      </c:if>

      <div class="layui-col-md8" style="margin-bottom: 20px">
        <div class="layui-card">
          <label  class="layui-form-label">说明</label>
          <div class="layui-col-md8">
            <textarea name="videoDesc" class="layui-textarea">${news.videoDesc}</textarea>
          </div>
        </div>
      </div>

      <div class="layui-form-item">
        <label  class="layui-form-label">
          摘要
        </label>
        <div class="layui-input-inline">
          <input type="text" value="${news.summary}" name="summary"  class="layui-input">
        </div>
      </div>

      <div class="layui-form-item">
        <label  class="layui-form-label">内容</label>
        <div class="layui-input-inline" style="height: 270px;width: 602px;margin-bottom: 50px;">
          <textarea style="padding: 0px 0px;" id="editor" name="content" class="layui-textarea">${news.content}</textarea>
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label layui-bg-orange">作者</label>
        <div class="layui-input-inline">
          <input type="text" value="${news.author}" name="author"  class="layui-input">
        </div>
      </div>

      <div class="layui-col-md8" style="margin-bottom: 20px">
        <label  class="layui-form-label layui-bg-orange">来源</label>
        <div class="layui-col-md8">
            <textarea name="infoSource" class="layui-textarea">${news.infoSource}</textarea>
        </div>
      </div>


      <div class="layui-form-item">
        <label  class="layui-form-label">附件</label>

        <div class="layui-input-inline" style="width: 800px;">
            <div class="form-group">
              <input  type="file" name="file" multiple class="file" data-overwrite-initial="false" data-min-file-count="2">
            </div>
        </div>

      </div>
      <c:if test="${not empty filesList}">
        <div class="layui-form-item">
          <label  class="layui-form-label">
            <span class="x-red">*</span>已传附件
          </label>
          <div class="layui-input-inline" style="width: 500px">
            <c:forEach items="${filesList}" var="file">
              <span id="file_${file.id}"><a href="${file.savePath}">${file.saveName}</a><a href="javascript:void (0);" onclick="deleteFile(${file.id})">删除</a></br> </span>
            </c:forEach>
          </div>
        </div>
      </c:if>

      <div class="layui-form-item">
        <label  class="layui-form-label">
          失效时间
        </label>
        <div class="layui-input-inline">
          <input type="text" value="<fmt:formatDate value='${news.invalidDate}' pattern='yyyy-MM-dd HH:mm:ss'/>" name="invalidDate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" class="layui-input">
        </div>
      </div>

      <div class="layui-form-item">
        <label  class="layui-form-label">
          发布时间
        </label>
        <div class="layui-input-inline">
          <input type="text" value="<fmt:formatDate value='${news.publishTime}' pattern='yyyy-MM-dd HH:mm:ss'/>" name="publishTime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" class="layui-input">
        </div>
      </div>

      <div class="layui-form-item">
        <label  class="layui-form-label">
          最后浏览时间
        </label>
        <div class="layui-input-inline">
          <input type="text" value="<fmt:formatDate value='${news.viewDatetime}' pattern='yyyy-MM-dd HH:mm:ss'/>" name="viewDatetime" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" class="layui-input">
        </div>
      </div>

      <div class="layui-form-item">
        <label  class="layui-form-label">
          浏览次数
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
        <button style="margin-left: 150px;" class="layui-btn" id="add" lay-filter="add" >
          增加
        </button>
        <button id="back" class="layui-btn" style="margin-left: 60px">
          返回
        </button>
      </div>
    </form>
  </div>

  <script>
      plyr.setup();
      $("#back").click(function(){
          history.go(-1);
      })


      $(".file").fileinput({
          uploadUrl: '#', // you must set a valid URL here else you will get an error
          maxFileSize:100000,
          showUpload:false,
          allowedFileExtensions : ['jpg','.txt','.jsp', 'png','.java','gif'],
          overwriteInitial: false,
          actionUpload:'',
          maxFileSize: 1000,
          maxFilesNum: 10,
          maxImageWidth: 50,
          maxImageHeight: 50,
          layoutTemplates:{
              actionUpload:''
          },
          slugCallback: function(filename) {
              return filename.replace('(', '_').replace(']', '_');
          },
      });

      $(function () {
          jQuery.validator.addMethod("isPhone", function(value, element) {
              var length = value.length;
              var mobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1}))+\d{8})$/;
              return this.optional(element) || (length == 11 && mobile.test(value));
          }, "请填写正确的手机号码");

          $("#newsForm").validate({

              errorPlacement:function(error,element){
                  error.appendTo(element.parent().parent());
              },
              rules:{
                  title:{
                      required:true,
                      minlength:4
                  },
                  summary:{
                      required:true,
                      minlength:10,
                      maxlength:30
                  },
                  content:{
                      required:true,
                      minlength:10,
                      maxlength:500
                  }

              },
              messages:{

              },
              errorElement: "label",
              success: function(label) {
                  label.text(" ")
                      .addClass("success");
              }

          });

          $("#infoState option[value=${news.infoState}]").prop("selected",true);
          $("#newsType option[value=${news.newsType}]").prop("selected",true);
          $("#deleted option[value=${news.deleted}]").prop("selected",true);
          $("#add").click(function () {
              $("form").submit();

          });
          
      });
      //异步删除附件
      function deleteFile(id) {
          var fla="file_"+id;
          alert(fla);
          $("#"+fla).remove();
          $.ajax({
              "url" : "/files/delete?id="+id,   //提交URL
              "type" : "GET",//处理方式
              "dataType" : "text",//指定返回的数据格式
              "success" : callback,//执行成功后的回调函数
              "async" : "false",//是否同步
          });
          function callback() {
              layer.msg('已删除!',{icon:1,time:1000});

          }
      }
          UE.getEditor('editor',{ initialFrameWidth: null , autoHeightEnabled: false});
          var i;
          $("#addFile").click(function () {

          })

  </script>
      </body>
</html>
