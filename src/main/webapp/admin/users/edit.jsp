<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>欢迎页面-L-admin1.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8" />
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
  <div class="x-body" style="width: 50%;margin: 0 auto" >
    <form class="layui-form layui-form-pane" id="userForm" method="post" action="/users/save?id=${user.id}">
      <div class="layui-form-item">
        <label  class="layui-form-label layui-bg-green">
          邮箱
        </label>
        <div class="layui-input-inline">
          <input type="text" value="${user.email}" name="email"  class="layui-input">
        </div>
        <div class="layui-form-mid layui-word-aux">
          <span class="x-red">*</span>
        </div>
      </div>
      <div class="layui-form-item">
        <label class="layui-form-label">
          用户名
        </label>
        <div class="layui-input-inline">
          <input type="text"  value="${user.userName}" name="userName"
                 autocomplete="off" class="layui-input">
        </div>
        <div class="layui-form-mid layui-word-aux">
          <span class="x-red">*</span>
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">
          真实姓名
        </label>
        <div class="layui-input-inline">
          <input type="text" value="${user.realName}" name="realName"  class="layui-input">
        </div>
        <div class="layui-form-mid layui-word-aux">
          <span class="x-red">*</span>
        </div>
      </div>


      <div class="layui-form-item">
        <label class="layui-form-label">
          手机号码
        </label>
        <div class="layui-input-inline">
          <input type="text" value="${user.mobile}" name="mobile"  class="layui-input">
        </div>
        <div class="layui-form-mid layui-word-aux">
          <span class="x-red">*</span>
        </div>
      </div>

      <div class="layui-form-item">
        <label  class="layui-form-label">
          性别
        </label>
        <div class="layui-col-md2">
          <input type="radio" name="sex" value="0" title="男" <c:if test="${user.sex eq 0}">checked</c:if> >
          <input type="radio" name="sex" value="1" title="女" <c:if test="${user.sex eq 1}">checked</c:if>>
        </div>
        <div class="layui-form-mid layui-word-aux">
          <span class="x-red">*</span>
        </div>
      </div>

      <div class="layui-form-item">
        <label  class="layui-form-label">
          添加时间
        </label>
        <div class="layui-input-inline">
          <input type="text"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" value="<fmt:formatDate value="${user.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" name="createTime"
                 class="layui-input">
        </div>
      </div>


      <div class="layui-form-item">
        <label  class="layui-form-label">
          最后登录时间
        </label>
        <div class="layui-input-inline">
          <input type="text"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" value="<fmt:formatDate value="${user.lastLoginTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" name="lastLoginTime"
                 class="layui-input">
        </div>
      </div>

      <div class="layui-form-item">
        <label  class="layui-form-label">
          最后登录IP
        </label>
        <div class="layui-input-inline">
          <input type="text"  value="${user.lastLoginIp}" name="lastLoginIp"
                 class="layui-input">
        </div>
      </div>

      <div class="layui-form-item">
        <label  class="layui-form-label">
          生日
        </label>
        <div class="layui-input-inline">
          <input type="text"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})"
                 value="<fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd HH:mm:ss"/>" name="birthday" class="layui-input">
        </div>
      </div>

      <div class="layui-form-item">
        <label class="layui-form-label">所属职称：</label>
        <div class="layui-input-inline">
          <select autocomplete="off"  name="positions">
            <option value="">请选择</option>
            <c:forEach items="${typesList2}" var="type">
              <option value="${type.typeName}" <c:if test="${user.positions eq type.typeName}">selected='selected'</c:if> >${type.typeName}</option>
            </c:forEach>
          </select>
        </div>
        <div class="layui-form-mid layui-word-aux">
          <span class="x-red">*</span>
        </div>
      </div>

      <c:if test="${ not empty user}">
        <div class="layui-form-item">
          <label class="layui-form-label">是否锁定</label>
          <div class="layui-input-inline">
            <select id="locked" name="locked">
              <option value="">请选择</option>
              <option value="0" <c:if test="${user.locked eq 0 }">selected='selected'</c:if>>已锁定</option>
              <option value="1" <c:if test="${user.locked eq 1 }">selected='selected'</c:if>>正常</option>
            </select>
          </div>
        </div>
      </c:if>

      <c:if test="${empty user}">
        <div class="layui-form-item">
          <label  class="layui-form-label">
            密码
          </label>
          <div class="layui-input-inline">
            <input type="password"  value="${user.passWord}" name="passWord"  class="layui-input">
          </div>
          <div class="layui-form-mid layui-word-aux">
            <span class="x-red">*</span>
          </div>
        </div>
      </c:if>

      <div class="layui-form-item">
        <div class="layui-inline">
          <label class="layui-form-label">用户类型</label>
          <div class="layui-input-inline">
            <select id="userType" name="userType">
              <option value="">请选择</option>
              <c:forEach items="${typesList1}" var="type">
                <option <c:if test="${user.userType eq type.typeCode }">selected='selected'</c:if> value="${type.typeCode}">${type.typeName}</option>
              </c:forEach>
            </select>
          </div>
        </div>
      </div>
      <div class="layui-form-item">
        <label  class="layui-form-label">
          优先级
        </label>
        <div class="layui-input-inline">
          <input type="text"  value="${user.priority}" name="priority"
                 class="layui-input">
        </div>
      </div>

      <div class="layui-form-item"style="margin-left: 100px" >
        <input type="reset" class="layui-btn" value="重置">
        <button  class="layui-btn" id="add" lay-filter="add">增加</button>
        <button id="back" class="layui-btn" >返回</button>
      </div>


    </form>
  </div>
  <script>

    $("#back").click(function(){
        history.go(-1);
    });


    $(function () {
        jQuery.validator.addMethod("isPhone", function(value, element) {
            var length = value.length;
            var mobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1}))+\d{8})$/;
            return this.optional(element) || (length == 11 && mobile.test(value));
        }, "请填写正确的手机号码");

        $("#userForm").validate({
            success: function (error, element) {
                if (error.text(" ")){
                    error.addClass("success");
                }else {
                    error.removeClass("success");
                }

            },

            errorPlacement:function(error,element){
                error.appendTo(element.parent().parent());
            },

            rules:{
                email:{
                    required:true,
                    email:true
                },
                userName:{
                    required:true,
                    minlength:3
                },
                realName:{
                    required:true,
                    minlength:3
                },
                mobile:{
                    required:true,
                    isPhone:true
                },
                passWord:{
                    required:true,
                    digits:true,
                    minlength:6
                },
                sex:{
                    required:true,
                },
                positions:{
                    required:true,
                },

            },
            messages:{

            }
        });
    });

    $("#add").click(function () {
        $("form").submit();

    });
  </script>
  </body>
</html>
