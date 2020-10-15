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
	<div class="container-fluid">
		<div class="row">
			<div class="col-xs-8">
				<h2>用户列表</h2>
			</div>
		</div>
		<!-- 搜索框 -->
		<div class="row" style="margin-bottom: 10px;">
			<form class="form-inline col-md-6" autocomplete="off" action="user">
				<div class="form-group">
					<label>搜索内容：</label> 
					<input type="text" class="form-control" name="keyword" value="${keyword}" placeholder="请输入搜索关键词(用户名)">
				</div>
				<input type="hidden" name="method" value="showInfo">
				<button type="submit" class="btn btn-default">搜索</button>
			</form>
		</div>
		<div class="row">
			<div class="col-xs-12">
			<c:choose>
			<c:when test="${not empty pageBean.content}">
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
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${pageBean.content}" var="user">
							<tr>
								<td>${user.user_id}</td>
								<td>${user.username}</td>
								<td>${user.department_id}</td>
								<td>${user.role_id}</td>
								<td>${user.mobile}</td>
								<td>${user.email}</td>
								<td>${user.update_time}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				</c:when>
				<c:otherwise>
					<h1>目前暂无符合条件的数据！</h1>
				</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<strong>共有${pageBean.totalCount}条数据,第
					<c:choose>
						<c:when test="${pageBean.totalCount==0}">0</c:when>
						<c:otherwise>${pageBean.pageNo}</c:otherwise>
					</c:choose>
					/${pageBean.totalPage}页
				</strong>
			</div>
			<!-- 分页条 -->
			<div class="col-md-6" style="text-align: right;">
				<!-- 当前页码为1，则其前一页不可点击 -->
				<nav aria-label="Page navigation">
				<ul class="pagination">
					<!-- 处理上一页的操作 -->
					<c:choose>
						<c:when test="${pageBean.pageNo==1}">
							<li class='disabled'><a href='#'>&laquo;</a>
						</c:when>
						<c:otherwise>
							<li><a href="user?method=showInfo&pageNo=${pageBean.pageNo-1}&keyword=${keyword}">&laquo;</a></li>
						</c:otherwise>
					</c:choose>
					<!-- 补全页码 -->
					<c:forEach begin="1" end="${pageBean.totalPage}" var="i">
						<!-- 判断页面与i是否一致，一致就代表当前页码要高亮显示 -->
						<c:choose>
							<c:when test="${i == pageBean.pageNo}">
								<li class="active"><a href="user?method=showInfo&pageNo=${i}&keyword=${keyword}">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="user?method=showInfo&pageNo=${i}&keyword=${keyword}">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<!-- 处理下一页的操作 -->
					<c:choose>
						<c:when test="${pageBean.pageNo==pageBean.totalPage}">
							<!-- 下一页不可点击 -->
							<li class='disabled'><a href='#'>&raquo;</a>
							<li>
						</c:when>
						<c:otherwise>
							<li>
							<a href="user?method=showInfo&pageNo=${pageBean.pageNo+1}&keyword=${keyword}">&raquo;</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
				</nav>
			</div>
		</div>
	</div>
</body>
</html>