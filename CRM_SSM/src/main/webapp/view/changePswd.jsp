<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquerysession.js"></script>
	<title>修改密码</title>
	<style type="text/css">
        [class=container-fluid]{
           background-color: white;
        }
        body{
            padding: 10px;
            background-color: #ecf0f5;
        }
	</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<h1>修改密码</h1>
		</div>
		<div class="row">
			<form class="form-horizontal" style="margin-top: 20px" action="${pageContext.request.contextPath}/user">
				<input type="hidden" id="method" name="method" value="checkPswd">
				<input type="hidden" id="access" value="${access}">
				<div class="form-group">
					<label class="col-xs-2 control-label">原密码</label>
					<div class="col-xs-6">
						<input id="old" name="old_password" type="password" class="form-control" value="${password}" placeholder="请输入原密码">
					</div>
				</div>
				<div id="new" class="form-group" style="display:none">
					<label class="col-xs-2 control-label">新密码</label>
					<div class="col-xs-6">
						<input type="password" name="password" class="form-control" placeholder="请输入新密码">
					</div>
					<span style="color:red;font-weight:bold">
						<i class="fa fa-exclamation-triangle" aria-hidden="true"></i>
						注意：密码修改后需要重新登录
					</span>
				</div>
				<div class="form-group">
					<div class="col-xs-offset-2 col-xs-10">
						<button type="submit" class="btn btn-primary">确认</button>
						<a class="btn btn-default" href="javascript:history.back()">返回</a>
					</div>
				</div>
			</form>
		</div>
	</div>

	<script type="text/javascript">
		$(function(){
			var access = $("#access").val();
			if(access=="pass"){
				$("#new").show();
				$("#old").prop("readonly","readonly");
				$("#method").val("changePswd");
				$("#access").val(null);
			} else if(access=="refuse") {
				alert("您输入的密码不正确！");
			}
		});
	</script>
</body>
</html>