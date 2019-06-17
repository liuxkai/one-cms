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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
    <link href="../../static/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../../static/css/daterangepicker.css"/>
    <link rel="stylesheet" type="text/css" href="../../static/css/iconfont.css">
    <link rel="stylesheet" href="${ctx}/static/css/font.css">
    <link rel="stylesheet" href="${ctx}/static/css/xadmin.css">
    <link rel="stylesheet" href="${ctx}/static/css/layuiadmin.css">
    <link rel="stylesheet" href="${ctx}/static/lib/layui/css/layui.css">
    <script src="../../static/js/jquery.min.js"></script>
    <script src="${ctx}/static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${ctx}/static/js/xadmin.js"></script>
    <script type="text/javascript" src="${ctx}/static/My97DatePicker/WdatePicker.js"></script>


    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <style>


  </style>
  <body class="layui-anim layui-anim-up">
  <div class="x-nav layui-anim" data-anim="layui-anim-scaleSpring">
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
      <form class="layui-form layui-col-md12 x-so" action="/users/pageList" method="get">
        <%--<input class="layui-input" id="createTime" value="${users.createTime}" name="createTime" >--%>
        <input class="layui-input" placeholder="最后登录时间" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true,maxDate:'%y-%M-%d' })"
               value="<fmt:formatDate value="${users.lastLoginTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" name="lastLoginTime">
        <%--<input type="hidden" id="aroundTime" name="aroundTime" value="">--%>
          <input type="text" name="userName" value="${users.userName}"  placeholder="请输入用户名" class="layui-input">
        <%--<button type="button" style="height: 38px;border-radius: 0px;margin-bottom: 4px;padding-left: 10px" class="btn btn-default" id="daterange-btn">--%>
          <%--创建时间及其范围--%>
          <%--<span><i class="icon iconfont icon-calendar1"></i>${aroundTime}</span>--%>
          <%--&lt;%&ndash;<input class="btn btn-default" id="daterange-btn" value="" placeholder="创建时间及其范围"  />&ndash;%&gt;--%>
          <%--<i class="icon iconfont icon-danxian-youjiantou-copy"></i>--%>
        <%--</button>--%>
          <input style="width: 200px" value="${aroundTime}" name="aroundTime" type="text" class="layui-input" id="test16" placeholder="添加日期范围">
        <button id="check" class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
      </form>
    </div>
    <xblock>
      <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
      <button class="layui-btn" id="add" onclick="location.href='/users/input'"><i class="layui-icon"></i>添加</button>
      <span class="x-right" style="line-height:40px">共有数据：${pager.totalCount} 条</span>
    </xblock>
    <table class="layui-table" >
      <thead>
      <tr>
        <th>
          <div class="layui-unselect header layui-form-checkbox" id="singleCheck" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
        </th>
        <th>序号</th>
        <th>用户名</th>
        <th>真实姓名</th>
        <th>职位</th>
        <th>添加时间</th>
        <th>状态</th>
        <th>操作</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="user" items="${pager.list}" varStatus="usersStatus">
      <tr>
        <td>
          <div class="layui-unselect layui-form-checkbox" name="single" lay-skin="primary" title="${user.id}" data-id='2'><i class="layui-icon">&#xe605;</i></div>
        </td>
        <td>${usersStatus.count}</td>
        <td>${user.userName} ${ctx}</td>
        <td>${user.realName}</td>
        <td>${user.positions}</td>
        <td><fmt:formatDate value="${user.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
        <c:if test="${user.locked eq  1 }">
            <td class="td-status">
               <span class="layui-btn layui-btn-normal layui-btn-sm">正常</span>
            </td>
        </c:if>
        <c:if test="${user.locked eq 0 }">
            <td class="td-status">
                <span class="layui-btn layui-btn-normal layui-btn-sm layui-btn-disabled">已锁定</span>
            </td>
        </c:if>
        </td>
        <td class="td-manage">
          <button style="margin-left: 10px" class="layui-btn layui-btn layui-btn-xs" title="${user.locked}" onclick="member_stop(this,${user.id})" ><i class="layui-icon">&#xe601;</i>启用</button>
          <button class="layui-btn layui-btn-warm layui-btn-xs" title="" onclick="x_admin_show('查看','${ctx}/users/detailed?id=${user.id}')" ><i class="layui-icon">&#xe63c;</i>查看</button>
          <button class="layui-btn layui-btn layui-btn-xs" onclick="edit(${user.id})" ><i class="layui-icon">&#xe642;</i>编辑</button>
          <button class="layui-btn layui-btn-danger  layui-btn-xs"  onclick="member_del(this,${user.id})" href="javascript:void(0);" ><i class="layui-icon">&#xe640;</i>删除</button>
          <button class="layui-btn layui-btn-warm  layui-btn-xs"  onclick="reset_pass(${user.id})" href="javascript:void(0);" ><i class="layui-icon">&#xe673;</i>密码重置</button>
        </td>

        </td>
      </tr>
      </c:forEach>
      </tbody>
    </table>
    <div class="page">
      <div>
          <jsp:include page="../pager.jsp"></jsp:include>
      </div>
    </div>
  </div>
  <script>
      // $('.ranges_1 ul').remove();
      // $('#daterange-btn').daterangepicker({
      //         ranges: {
      //             '全部': [moment(), moment().subtract(-1, 'days')],
      //             '今天': [moment(), moment()],
      //             '昨天': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
      //             '过去七天': [moment().subtract(7, 'days'),moment().subtract(1, 'days')],
      //             '过去30天': [moment().subtract(30, 'days'),moment().subtract(1, 'days')],
      //             '过去60天': [moment().subtract(60, 'days'),moment().subtract(1, 'days')],
      //         },
      //         startDate: moment(),
      //         endDate: moment()
      //     },
      // function(start, end,label) {
      //     if(label=='全部'){
      //         $('#daterange-btn span').html('全部');
      //     }else if(label=='今天'){
      //         $('#daterange-btn span').html(end.format('YYYY/MM/DD'));
      //     }else if(label=='昨天'){
      //         $('#daterange-btn span').html(start.format('YYYY/MM/DD'));
      //     }else if(label=='过去七天'){
      //         $('#daterange-btn span').html(start.format('YYYY/MM/DD')+'-'+end.format('YYYY/MM/DD'));
      //     }else if(label=='过去30天'){
      //         $('#daterange-btn span').html(start.format('YYYY/MM/DD')+'-'+end.format('YYYY/MM/DD'));
      //     }else if(label=='过去60天'){
      //         $('#daterange-btn span').html(start.format('YYYY/MM/DD')+'-'+end.format('YYYY/MM/DD'));
      //     }
      //
      // }
      // );
      layui.use('laydate', function(){
          var laydate = layui.laydate;

          laydate.render({
              elem: '#test16'
              ,type: 'datetime'
              ,range: '-'
              ,format: 'yyyy/MM/dd'
          });
      });

      $(function () {
          $("[name='single']").click(function () {
              var len=0;
              $("div[name='single']").each(function(){
                  if($(this).is('.layui-form-checked')){
                      len++;

                  }
              });
              if(len==$("[name='single']").length){
                  $("#singleCheck").addClass("layui-form-checked");
              }
              else if(len==0){
                  $("#singleCheck").removeClass("layui-form-checked");
              }else {
                  $("#singleCheck").removeClass("layui-form-checked");
              }
          });
      })

      function edit(id){
          location.href="/users/input?id="+id;
      }
      function reset_pass(id) {
          location.href="/users/save?id="+id+"&passWord=000000";
      }

      /*用户-停用*/
      function member_stop(obj,id){
          layer.confirm('确认要改变吗？',function(index){
              if($(obj).attr('title')==1){
                  var value=0;
                  updateAjax(id,value);
                  //发异步把用户状态进行更改
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
              "url" : "/users/save?id="+id+"&locked="+value,    //提交URL
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
                  "url" : "/users/delete?id="+id,    //提交URL
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
          var idArray=new Array();
          $("div[name='single']").each(function(){
              if($(this).is('.layui-form-checked')){
                  idArray.push($(this).attr('title'));
              }

          });

          layer.confirm('确认要删除吗？'+data,function(index){
              //捉到所有被选中的，发异步进行删除
              layer.msg('删除成功', {icon: 1});
              alert(idArray);
          });
      }

  </script>
  </body>
</html>
