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
  <body class="layui-anim layui-anim-up">
  <div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">演示</a>
        <a>
          <cite>导航元素</cite></a>
      </span>
    <a class="layui-btn layui-btn-primary layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
      <i class="layui-icon" style="line-height:38px">ဂ</i></a>
  </div>
  <div class="x-body">
    <div class="layui-row">
      <form class="layui-form layui-col-md12 x-so" action="/student/pageList" method="get">
        <input type="text" name="name" value="${teacher.name}"  placeholder="请输入姓名"  class="layui-input">
        <input type="text" name="contactWay" value="${teacher.contactWay}"  placeholder="请输入联系方式"  class="layui-input">
        <input type="text" name="positions" value="${teacher.positions}"  placeholder="请输入职位"  class="layui-input">
        <button class="layui-btn" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
      </form>
    </div>
    <xblock>
      <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
      <button class="layui-btn" id="add" onclick="add()"><i class="layui-icon"></i>添加</button>
      <span class="x-right" style="line-height:40px">共有数据：${pager.totalCount} 条</span>
    </xblock>
    <table class="layui-table">
      <thead>
      <tr>
        <th>
          <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
        </th>
        <th>序号</th>
        <th>姓名</th>
        <th>出生日期</th>
        <th>联系方式</th>
        <th>邮件</th>
        <th>在线联系方式</th>
        <th>职位</th>
        <th>状态</th>
        <th>操作</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="teacher" items="${pager.list}" varStatus="teacherStatus">
      <tr>
        <td>
          <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>
        </td>
        <td>${teacherStatus.count}</td>
        <td>${teacher.name}</td>
        <td><fmt:formatDate value="${teacher.birthDate}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
        <td>${teacher.contactWay}</td>
        <td>${teacher.email}</td>
        <td>${teacher.onlineContact}</td>
        <td>${teacher.positions}</td>
        <c:if test="${teacher.locked eq  1 }">
            <td class="td-status">
               <span class="layui-btn layui-btn-normal layui-btn-sm">正常</span>
            </td>
        </c:if>
        <c:if test="${teacher.locked eq 0 }">
            <td class="td-status">
                <span class="layui-btn layui-btn-normal layui-btn-sm layui-btn-disabled">已锁定</span>
            </td>
        </c:if>
        </td>
        <td class="td-manage">
          <a onclick="member_stop(this,${teacher.id})"  class="layui-btn layui-btn-sm layui-btn-primary" title="${teacher.locked}">启用</a>
          <button class="layui-btn layui-btn-warm layui-btn-xs"  onclick="x_admin_show('查看','${ctx}/teacher/detailed?id=${teacher.id}')" ><i class="layui-icon">&#xe642;</i>查看</button>
          <button class="layui-btn layui-btn layui-btn-xs" onclick="edit(${teacher.id})" ><i class="layui-icon">&#xe642;</i>编辑</button>
          <button class="layui-btn-danger layui-btn layui-btn-xs"  onclick="member_del(this,${teacher.id})" href="javascript:void(0);" ><i class="layui-icon">&#xe640;</i>删除</button>
        </td>

        </td>
      </tr>
      </c:forEach>
      </tbody>
    </table>
    <div class="page">
      <div>
        <a class="prev" href="${ctx}/teacher/pageList?requestPage=${pager.firstPage}">首页</a>
        <a class="prev" href="${ctx}/teacher/pageList?requestPage=${pager.previousPage}">&lt;&lt;</a>
        <a class="next" href="${ctx}/teacher/pageList?requestPage=${pager.nextPage}">&gt;&gt;</a>
        <a class="prev" href="${ctx}/teacher/pageList?requestPage=${pager.lastPage}">尾页</a>
      </div>
    </div>

  </div>
  <script>
    layui.use('laydate', function(){
      var laydate = layui.laydate;
      laydate.render({
          elem: '#start'
      });
      laydate.render({
          elem: '#end'
      });
    });

    function edit(id){
        location.href="/teacher/input?id="+id;
    }

    function add(){
        location.href="/teacher/input";
    }

      function member_stop(obj,id){
          layer.confirm('确认要改变吗？',function(index){
              if($(obj).attr('title')==1){
                  var value=0;
                  updateAjax(id,value);
                  $(obj).attr('title','0')
                  $(obj).find('i').html('&#xe62f;');
                  $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已锁定');
                  layer.msg('已锁定!',{icon: 5,time:1000});
              }else{
                  var value=1;
                  updateAjax(id,value);
                  $(obj).attr('title','1')
                  $(obj).find('i').html('&#xe601;');
                  $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('正常');
                  layer.msg('正常!',{icon: 5,time:1000});

              }

          });
      }
      function updateAjax(id,value) {
          $.ajax({
              "url" : "/teacher/save?id="+id+"&locked="+value,
              "type" : "POST",
              "dataType" : "text",
              "success" : callback,
              "async" : "false",
          });
          function callback() {
              alert("成功");
          }
      }

      function member_del(obj,id){
          layer.confirm('确认要删除吗？',function(index){
              //发异步删除数据
              $.ajax({
                  "url" : "/teacher/delete?id="+id,    //提交URL
                  "type" : "Get",
                  "dataType" : "text",
                  "success" : callback,
                  "async" : "false",
              });
              function callback() {
                  $(obj).parents("tr").remove();
                  layer.msg('已删除!',{icon:1,time:1000});
              }

          });
      }

      function delAll (argument) {

          var data = tableCheck.getData();

          layer.confirm('确认要删除吗？'+data,function(index){
              layer.msg('删除成功', {icon: 1});
              $(".layui-form-checked").not('.header').parents('tr').remove();
          });
      }
  </script>
  </body>
</html>
