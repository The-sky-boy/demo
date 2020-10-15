<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>保存草稿成功</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<style>
[class=container-fluid] {
	background-color: white;
}

body {
	padding: 20px;
	background-color: #ecf0f5;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<input type="hidden" id="contextPath"
			value="${pageContext.request.contextPath}">
		<div class="row">
			<h1>保存成功</h1>
		</div>
		<div class="row">
			<div class="col-xs-12">
				页面将在<strong id="second" style="color: red;">5</strong> 秒后跳转到草稿箱(<a
					href="javascript:void(0)" onclick="jumpNow()">立即跳转</a>)
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12">
				<input type="button" class="btn btn-primary" value="再来一封"
					onclick="again()">
			</div>
		</div>

	</div>

	<script type="text/javascript">
		$(function() {
 			function jump(count) {
				window.setTimeout(function() {
					count--;
					if (count > 0) {
						$('#second').text(count);
						jump(count);
					} else {
						parent.$("#draftBox", parent.document).click();
					}
				}, 1000);
			}
			jump(5);
		});
		function again() {
			parent.$("#write", parent.document).click();
		}
		function jumpNow() {
			parent.$("#draftBox", parent.document).click();
		}
	</script>
</body>
</html>