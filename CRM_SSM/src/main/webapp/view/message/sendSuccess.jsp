<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>发送成功</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<style type="text/css">
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
			<h1>邮件发送成功</h1>
		</div>
		<div class="row">
			<div class="col-xs-12">
				页面将在<strong id="second" style="color: red;">5</strong> 秒后跳转到发件箱(<a
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
					} else if(count==0) {
						parent.$("#sendBox", parent.document).click();
					} else{
						return;
					}
				}, 1000);
			}
			jump(5);
		});
		function again() {
			parent.$("#write", parent.document).click();
		}
		function jumpNow() {
			parent.$("#sendBox", parent.document).click();
		}
	</script>
</body>
</html>