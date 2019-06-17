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
    <script type="text/javascript" src="../../static/js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="../../static/js/messages_zh.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
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
    }
  </style>
  <body>
  <div class="x-body" style="width: 50%;margin: 0 auto">
    <form class="layui-form layui-form-pane" method="post" id="teacherForm" enctype="multipart/form-data" action="/teacher/save?id=${teacher.id}">
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
          <span class="x-red">*</span>附件上传
        </label>
        <div class="layui-input-inline">
           <input type="file" multiple="multiple" name="file" >
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
          <span class="x-red">*</span>电话号码
        </label>
        <div class="layui-input-inline">
          <input type="text" value="${teacher.contactWay}" name="contactWay"  class="layui-input">
        </div>
      </div>

      <label  class="layui-form-label">
        <span class="x-red">*</span>简介
      </label>
      <div class="layui-input-inline" style="height: 270px;width: 602px;margin-bottom: 20px;">

        <textarea style="padding: 0px 0px;" id="editor" name="content" class="layui-textarea">${teacher.memo}</textarea>
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
        <div class="layui-col-md8">
          <textarea name="address"class="layui-textarea">${teacher.address}</textarea>
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">
          <span class="x-red">*</span>性别
        </label>
        <div class="layui-col-md4">
          <input type="radio" name="sex" value="0" title="男" <c:if test="${teacher.sex eq 0}">checked</c:if> >
          <input type="radio" name="sex" value="1" title="女" <c:if test="${teacher.sex eq 1}">checked</c:if>>
        </div>
      </div>

      <div class="layui-form-item">
        <div class="layui-inline">
          <label class="layui-form-label">职位</label>
          <div class="layui-input-inline">
            <select id="positions" name="positions">
              <option value="">请选择</option>
              <c:forEach items="${typesList}" var="type">
                <option <c:if test="${type.typeName eq teacher.positions }">selected='selected'</c:if> value="${type.typeName}">${teacher.positions}</option>
              </c:forEach>
            </select>
          </div>
        </div>
      </div>
      <c:if test="${not empty teacher}">
        <div class="layui-form-item">
          <label class="layui-form-label">是否锁定</label>
          <div class="layui-input-inline">
            <select id="locked" name="locked">
              <option value="">请选择</option>
              <option value="0" <c:if test="${teacher.locked eq 0 }">selected='selected'</c:if>>已锁定</option>
              <option value="1" <c:if test="${teacher.locked eq 1 }">selected='selected'</c:if>>正常</option>
            </select>
          </div>
        </div>
      </c:if>
      <div class="layui-form-item">
        <label  class="layui-form-label">
          优先级
        </label>
        <div class="layui-input-inline">
          <input type="text"  value="${user.priority}" name="priority"
                 class="layui-input">
        </div>
      </div>

      <c:if test="${not empty filesList}">
        <div class="layui-form-item">
          <label  class="layui-form-label">
            <span class="x-red">*</span>已传附件
          </label>
          <div class="layui-input-inline" style="width: 400px">
            <c:forEach items="${filesList}" var="file">
              <span id="file_${file.id}"><a href="${file.savePath}">${file.saveName}</a><a href="javascript:void (0);" onclick="deleteFile(${file.id})">删除</a></br> </span>
            </c:forEach>
          </div>
        </div>
      </c:if>
      <div class="layui-form-item"style="margin-left: 100px" >
        <input type="reset" class="layui-btn" value="重置">
        <button  class="layui-btn" id="add" lay-filter="add">增加</button>
        <button id="back" class="layui-btn" >返回</button>
      </div>
    </form>
  </div>
  <script type="text/javascript" charset="utf-8">
      $("#back").click(function(){
          history.go(-1);
      });

      $("#add").click(function () {
          $("form").submit();

      });
    $(function () {
        jQuery.validator.addMethod("isPhone", function(value, element) {
            var length = value.length;
            var mobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1}))+\d{8})$/;
            return this.optional(element) || (length == 11 && mobile.test(value));
        }, "请填写正确的手机号码");

        $("#teacherForm").validate({

            errorPlacement:function(error,element){
                error.appendTo(element.parent().parent());
            },
            rules:{
                name:{
                    required:true,
                    minlength:3
                },
                birthDate:{
                    required:true,
                    date:true
                },
                contactWay:{
                    required:true,
                    isPhone:true
                },
                mobile:{
                    required:true,
                    isPhone:true
                },
                content:{
                    required:true,
                    maxlength:100
                },
                onlineContact:{
                    required:true,
                    email:true,
                },
                email:{
                    required:true,
                    email:true,
                },
                address:{
                    required:true,
                    minlength:10
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

    });
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
            alert("成功");

        }
    }
        UE.getEditor('editor',{ initialFrameWidth: null , autoHeightEnabled: false});
  </script>
  </body>
</html>
