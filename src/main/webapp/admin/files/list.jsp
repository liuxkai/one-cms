<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <input type="text" name="name" value="${file.linkTable}"  placeholder="请输入关联表名"  class="layui-input">
        <input type="text" name="contactWay" value="${file.fileType}"  placeholder="请输入类型"  class="layui-input">
        <input type="text" name="positions" value="${file.fileMemo}"  placeholder="描述"  class="layui-input">
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
        <th>关联表名</th>
        <th>原文件名</th>
        <th>文件类型</th>
        <th>保存的文件名</th>
        <th>文件大小</th>
        <th>文件描述</th>
        <th>状态</th>
        <th>操作</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="file" items="${pager.list}" varStatus="fileStatus">
      <tr>
        <td>
          <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>
        </td>
        <td>${fileStatus.count}</td>
        <td>${file.linkTable}</td>
        <td>${file.fileName}</td>
        <td>${file.fileType}</td>
        <td>${file.saveName}</td>
        <td>${file.fileSize}</td>
        <c:if test="${file.deleted eq  1 }">
            <td class="td-status">
               <span class="layui-btn layui-btn-normal layui-btn-sm">删除</span>
            </td>
        </c:if>
        <c:if test="${file.deleted eq 0 }">
            <td class="td-status">
                <span class="layui-btn layui-btn-normal layui-btn-sm layui-btn-disabled">未删除</span>
            </td>
        </c:if>
        </td>
        <td class="td-manage">
          <button class="layui-btn layui-btn-warm layui-btn-xs"  onclick="x_admin_show('查看','${ctx}/files/detailed?id=${file.id}')" ><i class="layui-icon">&#xe642;</i>查看</button>
          <button class="layui-btn layui-btn layui-btn-xs" onclick="edit(${file.id})" ><i class="layui-icon">&#xe642;</i>编辑</button>
          <button class="layui-btn-danger layui-btn layui-btn-xs"  onclick="member_del(this,${file.id})" href="javascript:void(0);" ><i class="layui-icon">&#xe640;</i>删除</button>
        </td>

        </td>
      </tr>
      </c:forEach>
      </tbody>
    </table>
    <div class="page">
      <div>
        <a class="prev" href="${ctx}/files/pageList?requestPage=${pager.firstPage}">首页</a>
        <a class="prev" href="${ctx}/files/pageList?requestPage=${pager.previousPage}">&lt;&lt;</a>
        <a class="next" href="${ctx}/files/pageList?requestPage=${pager.nextPage}">&gt;&gt;</a>
        <a class="prev" href="${ctx}/files/pageList?requestPage=${pager.lastPage}">尾页</a>
      </div>
    </div>

  </div>
  <script>
    function edit(id){
        location.href="/files/input?id="+id;
    }

    function add(){
        location.href="/files/input";
    }


      function member_del(obj,id){
          layer.confirm('确认要删除吗？',function(index){
              //发异步删除数据
              $.ajax({
                  "url" : "/files/delete?id="+id,    //提交URL
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

  </script>
  </body>
</html>
