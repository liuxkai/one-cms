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
  </style>
  <body>
  <div class="x-body">
    <form class="layui-form" method="post" id="studentForm" enctype="multipart/form-data" action="/student/save?id=${student.id}">
      <div class="layui-form-item">
        <label  class="layui-form-label">
          <span class="x-red">*</span>姓名
        </label>
        <div class="layui-input-inline">
          <input type="text"  value="${student.name}" name="name" required lay-verify="name"
                 autocomplete="off" class="layui-input">
        </div>
        <div class="layui-form-mid layui-word-aux">
          <span class="x-red">*</span>
        </div>
      </div>

      <div class="layui-form-item">
        <label  class="layui-form-label">
          <span class="x-red">*</span>出生日期
        </label>
        <div class="layui-input-inline">
          <input type="text"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" value="<fmt:formatDate value="${student.birthDate}" pattern="yyyy-MM-dd HH:mm:ss"/>" name="birthDate" required lay-verify="name"
                  class="layui-input">
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
          <input type="text"  value="${student.major}" name="major" class="layui-input">
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
        <label  class="layui-form-label">
          <span class="x-red">*</span>附件上传
        </label>
        <div class="layui-input-inline">
          <input type="file" multiple="multiple" name="file" >
        </div>
      </div>
      <c:if test="${not empty filesList}">
          <div class="layui-form-item">
            <label  class="layui-form-label">
              <span class="x-red">*</span>已传附件
            </label>
            <div class="layui-input-inline">
              <c:forEach items="${filesList}" var="file">
                <span id="file_${file.id}" style="width: 200px;"><a href="${file.savePath}">${file.saveName}</a><a href="javascript:void (0);" onclick="deleteFile(${file.id})">删除</a></br> </span>
              </c:forEach>
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
  <script>
    $(function () {
        jQuery.validator.addMethod("isPhone", function(value, element) {
            var length = value.length;
            var mobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1}))+\d{8})$/;
            return this.optional(element) || (length == 11 && mobile.test(value));
        }, "请填写正确的手机号码");

        $("#studentForm").validate({

            errorPlacement:function(error,element){
                error.appendTo(element.parent().parent());
            },
            ignore: ":hidden:not(select)",

            rules:{
                name:{
                    required:true,
                    minlength:3
                },
                birthDate:{
                    required:true,
                    date:true
                },
                clazz:{
                    required:true,
                },
                company:{
                    required:true,
                    minlength:3
                },
                salary:{
                    required:true,
                    digits:true
                },
                school:{
                    required:true,
                    minlength:3
                },
                contactWay:{
                    required:true,
                    isPhone:true
                },
                contactWay:{
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

        $("#education option[value=${student.education}]").prop("selected",true);
        $("#locked option[value=${student.locked}]").prop("selected",true);
    });
    $("#add").click(function () {
        $("form").submit();

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

  </script>
  </body>
</html>
