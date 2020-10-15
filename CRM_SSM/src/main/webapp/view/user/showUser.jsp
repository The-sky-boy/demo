<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>3管理员-用户管理-用户列表</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
<style>
td, th {
	text-align: center;
}

[class=container-fluid] {
	background-color: white;
}

body {
	padding: 10px;
	background-color: #ecf0f5;
}
</style>
</head>
<body>
	<input type="hidden" id="contextPath" value="${pageContext.request.contextPath}">
	<input type="hidden" id="pageNo" value="${param.pageNo}">
	<div class="container-fluid">
		<div class="row">
			<div class="col-xs-8">
				<h2>用户列表</h2>
			</div>
		</div>
		<!-- 搜索框 -->
		<div class="row" style="margin-bottom: 10px;">
			<form id="search" class="form-inline col-md-6" autocomplete="off">
				<div class="form-group">
					<label>搜索内容：</label>
					<input type="text" class="form-control" value="${param.keyword}" id="keyword" name="keyword" placeholder="请输入搜索关键词(用户名)">
				</div>
				<button type="button" class="btn btn-default" onclick="showUser(1)">搜索</button>
			</form>
			<div class="col-md-6">
				<button class="btn btn-primary pull-right" onclick="addUser()">添加用户</button>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>序号</th>
							<th>用户名</th>
							<th>部门</th>
							<th>角色</th>
							<th>手机号</th>
							<th>邮箱</th>
							<th>更新时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row">
			<div id="pageInfo" class="col-md-6"></div>
			<!-- 分页条 -->
			<div class="col-md-6" style="text-align: right;">
				<nav aria-label="Page navigation">
					<ul class="pagination">
					</ul>
				</nav>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var pageNum = 1;
		var path = $("#contextPath").val();
		$(function(){
   			if($("#pageNo").val()!=""){
				pageNum = $("#pageNo").val();
			}
			showUser(pageNum);
		})
		function addUser(){
			location.href = "addUser.jsp?pageNo="+pageNum+"&keyword="+$("#keyword").val();
		}
		function deleteUser(id){
			parent.deleteByPrimaryKey(path+"/deleteUser",{"user_id":id},pageNum);		
		}
		function showUser(pageNo) {
			pageNum = pageNo;
			$.post(path+"/showUser",$("#search").serialize()+"&"+$.param({"pageNo":pageNum}),function(data){
				var json = eval(data);
				if(json.state==500){
					$("tbody").html(json.error);
				} else if(json.state==200){
					var pageInfo = json.data;
					var html = "";
					var pageMsg = "";
					if(pageInfo.total==0){
						html+="<h1>暂无数据</h1>";
					}else{
						pageNum = pageInfo.pageNum;
						$.each(pageInfo.list, function(i,user){
							html += "<tr><td>"+user.user_id+"</td><td>"+user.username+"</td>"
							+"<td>"+user.department_id+"</td><td>"+user.role_id+"</td><td>"+user.mobile
							+"</td><td>"+user.email+"</td><td>"+user.update_time+"</td><td>"
							+"<a class='btn btn-link' href='updateUser.jsp?keyword="+$("#keyword").val()+"&pageNo="+pageNo+"&user_id="+user.user_id+"'><i class='fa fa-pencil-square-o' aria-hidden='true'></i>"
							+"</a><button class='btn btn-link' onclick=deleteUser('"+user.user_id+"')><i class='fa fa-trash' aria-hidden='true'></i></button></td></tr>"			
						});
						if(pageInfo.isFirstPage){
							pageMsg+="<li class='disabled'><a href='#'>&laquo;</a>"
						} else {
							pageMsg+="<li><a href='javascript:void(0)' onclick=showUser("+pageInfo.prePage+")>&laquo;</a></li>"
						}
						$.each(pageInfo.navigatepageNums, function(i,n){
							if(n == pageNo){
		                		pageMsg += "<li class='active'><a href='javascript:void(0)' onclick='showUser("+n+")'>"+n+"<span class='sr-only'>(current)</span></a></li>"
		                	}
		                	else{
		                		pageMsg += "<li><a href='javascript:void(0)' onclick='showUser("+n+")'>" + n + "</a></li>"
		                	}
						});
						if(pageInfo.isLastPage){
							pageMsg+="<li class='disabled'><a href='#'>&raquo;</a>"
						} else {
							pageMsg+="<li><a href='javascript:void(0)' onclick=showUser("+pageInfo.nextPage+")>&raquo;</a></li>"
						}
		                pageMsg += "</ul>";
		              	$(".pagination").html(pageMsg);
					}
				}
				$("tbody").html(html);
			},"json");
		}
	</script>
</body>
</html>