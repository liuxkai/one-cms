<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
      <form class="layui-form layui-col-md12 x-so" action="/news/pageList" method="get">
        <input type="text" name="title" value="${news.title}"  placeholder="请输入新闻标题" autocomplete="off" class="layui-input">
        <input type="text" name="summary" value="${news.summary}"  placeholder="请输入摘要" autocomplete="off" class="layui-input">
        <input type="text" name="author" value="${news.author}"  placeholder="请输入作者" autocomplete="off" class="layui-input">
        <input type="text" name="publishTime" value="${news.publishTime}"  placeholder="请输入发布时间" autocomplete="off" class="layui-input">
        <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
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
        <th>新闻类型</th>
        <th>标题</th>
        <th>摘要</th>
        <th>作者</th>
        <th>信息来源</th>
        <th>浏览次数</th>
        <th>发布时间</th>
        <th>信息状态</th>
        <th>操作</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="news" items="${pager.list}" varStatus="newsStatus">
      <tr>
        <td>
          <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>
        </td>
        <td>${newsStatus.count}</td>
        <td>${news.newsType}</td>
        <td>${news.title}</td>
        <td>${news.author}</td>
        <td>${news.summary}</td>
        <td>${news.infoSource}</td>
        <td>${news.viewCount}</td>
        <td>${news.publishTime}</td>
        <c:if test="${news.infoState eq  0 }">
            <td class="td-status">
               <span class="layui-btn layui-btn-normal layui-btn-sm">默认</span>
            </td>
        </c:if>
        <c:if test="${news.infoState eq 1 }">
            <td class="td-status">
                <span class="layui-btn layui-btn-normal layui-btn-sm ">直接发布</span>
            </td>
        </c:if>
        <c:if test="${news.infoState eq 2 }">
          <td class="td-status">
            <span class="layui-btn layui-btn-normal layui-btn-sm ">已修改(已发布)</span>
          </td>
        </c:if>
        <c:if test="${news.infoState eq -2 }">
          <td class="td-status">
            <span class="layui-btn layui-btn-normal layui-btn-sm ">已修改(未发布)</span>
          </td>
        </c:if>
        <c:if test="${news.infoState eq 3 }">
          <td class="td-status">
            <span class="layui-btn layui-btn-normal layui-btn-sm ">已审核(已发布)</span>
          </td>
        </c:if>
        <c:if test="${news.infoState eq -3 }">
          <td class="td-status">
            <span class="layui-btn layui-btn-normal layui-btn-sm ">已审核(未发布)</span>
          </td>
        </c:if>
        </td>
        <td class="td-manage">
          <c:set var="id" value="${news.id}"/>
          <c:set var="newsType" value="${news.newsType}"/>
          <button class="layui-btn layui-btn-warm layui-btn-xs"  onclick="x_admin_show('查看','${ctx}/news/detailed?id=${news.id}')" ><i class="layui-icon">&#xe642;</i>查看</button>
          <button class="layui-btn layui-btn layui-btn-xs" onclick="edit(${news.id})" ><i class="layui-icon">&#xe642;</i>编辑</button>
          <button class="layui-btn-danger layui-btn layui-btn-xs"  onclick="member_del(this,${news.id})" href="javascript:void(0);" ><i class="layui-icon">&#xe640;</i>删除</button>
        </td>

        </td>
      </tr>
      </c:forEach>
      </tbody>
    </table>
    <div class="page">
      <div>
        <a class="prev" href="${ctx}/news/pageList?requestPage=${pager.previousPage}">&lt;&lt;</a>
        <a class="num" href="">${pager.firstPage}</a>
        <a class="num" href="">${pager.pageCount}</a>
        <a class="next" href="${ctx}/news/pageList?requestPage=${pager.nextPage}">&gt;&gt;</a>
      </div>
    </div>

  </div>
  <script>
      function edit(id){
          location.href="/news/input?id="+id;
      }
      function add(){
          location.href="/news/input?id=${id}&newsType=${newsType}";
      }


      function updateAjax(id,value) {
          $.ajax({
              "url" : "/news/save?id="+id+"&locked="+value,    //提交URL
              "type" : "POST",//处理方式
              "dataType" : "text",//指定返回的数据格式
              "success" : callback,//执行成功后的回调函数
              "async" : "false",//是否同步
          });
          function callback() {
              alert("成功");
          }
      }

      /*用户-删除*/
      function member_del(obj,id){
          layer.confirm('确认要删除吗？',function(index){
              //发异步删除数据
              $.ajax({
                  "url" : "/news/delete?id="+id,    //提交URL
                  "type" : "Get",//处理方式
                  "dataType" : "text",//指定返回的数据格式
                  "success" : callback,//执行成功后的回调函数
                  "async" : "false",//是否同步
              });
              function callback() {
                  $(obj).parents("tr").remove();
                  layer.msg('已删除!',{icon:1,time:1000});
                  window.location.reload();
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
