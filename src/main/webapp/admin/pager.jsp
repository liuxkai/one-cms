<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../static/css/pager.css">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="../static/js/jquery.min.js" ></script>
<script type="text/javascript">

    function _go(){
        var requestPage=$("#pageCode").val();
        if(!/^[1-9]\d*$/.test(requestPage)){
            alert("请输入正确的页码");
            return;
        }
        if(requestPage> ${pager.pageCount }){
            alert("请输入正确的页码");
            return;
        }
        location="${pager.url}?requestPage="+requestPage;
    }
    $(function () {

        $("#checkValue").change(function(){
            var pageSize=$("#checkValue option:selected").val();
            location.href="${pager.url}?pageSize="+pageSize;

		});
    });
</script>
<body>
<div class="divBody" >
	<div class="divContent">
		每页展示
		<select id="checkValue" style="width:33px;padding:0px 0px;height:21px; margin-bottom: 3px">
			<option <c:if test="${pager.pageSize eq 5}">selected="selected"</c:if>>5</option>
			<option <c:if test="${pager.pageSize eq 10}">selected="selected"</c:if>>10</option>
			<option <c:if test="${pager.pageSize eq 15}">selected="selected"</c:if>>15</option>
		</select>
	<c:choose>
		<c:when test="${pager.currentPage eq 1 }">
			<span style="width: 60px;padding: 0px 0px;border-radius: 3px;height: 22px;text-align: center;" class="spanBtnDisabled" >上一页</span>
		</c:when>
		<c:otherwise>
			<a style="width: 60px;padding: 0px 0px;border-radius: 3px; height: 22px;text-align: center;" href="${pager.url}?requestPage=${pager.previousPage}" class="aBtn bold">上一页</a>
		</c:otherwise>
	</c:choose>
	
	<c:choose>
		<c:when test="${pager.pageCount  le 6 }">
			<c:set var="begin" value="1" ></c:set>
			<c:set var="end" value="${pager.pageCount }" ></c:set>
		
		</c:when>
		<c:otherwise>
			<c:set var="begin" value="${pager.currentPage-2 }" ></c:set>
			<c:set var="end" value="${pager.currentPage+3  }" ></c:set>
			<c:if test="${begin lt 1 }">
				<c:set var="begin" value="1" ></c:set>
				<c:set var="end" value="6" ></c:set>
			</c:if>
			<c:if test="${end gt pb.pageCount }">
				<c:set var="begin" value="${pager.pageCount-5 }" ></c:set>
				<c:set var="end" value="${pager.pageCount }" ></c:set>
			</c:if>
		</c:otherwise>
	</c:choose>
	
	<c:forEach begin="${begin }" end="${end }" var="i">
		<c:choose>
			<c:when test="${i eq pager.currentPage }">
				<span style="width: 40px;padding: 0px 0px;height:22px;border-radius: 3px;text-align: center; " class="spanBtnSelect">${i }</span>
			</c:when>
			<c:otherwise>
				<a style="width:40px;padding: 0px 0px;height:22px;border-radius: 3px;text-align: center;" href="${pager.url}?requestPage=${i }" class="aBtn">${i }</a>
			</c:otherwise>
			
		</c:choose>
	</c:forEach>
			<c:if test="${end lt pager.pageCount }">
				<span class="spanApostrophe">......</span> 
			</c:if>
	<c:choose>
		<c:when test="${pager.currentPage eq pager.pageCount || pager.pageCount eq 0 }">
			<span style="width: 60px;padding: 0px 0px;border-radius: 3px;height: 22px;text-align: center;" class="spanBtnDisabled">下一页</span>
		</c:when>
		<c:otherwise>
			<a style="width: 60px;padding: 0px 0px;border-radius: 3px;height: 22px;text-align: center;" href="${pager.url}?requestPage=${pager.currentPage+1}" class="aBtn bold">下一页</a>
		</c:otherwise>
	</c:choose>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		<span>共${pager.pageCount }页</span> <span>到</span>
		<input style="width: 30px;height:22px;text-align:center;border-radius: 3px;" type="text" class="inputPageCode" id="pageCode" value="${pager.requestPage }" /> <span>页</span>
		<a style="width: 40px;padding: 0px 0px;" href="javascript:_go();" class="aSubmit">确定</a>
	</div>
</div>
</body>
</html>