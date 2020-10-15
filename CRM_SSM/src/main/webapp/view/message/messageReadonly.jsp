<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>邮件</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquerysession.js"></script>
	<style>
	
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
			<div class="col-xs-12">
				<h2>查看邮件</h2>
			</div>
		</div>
		<div class="row">
			<div class="form-horizontal">
				<div class="form-group">
					<label class="col-xs-2 control-label">邮件主题</label>
					<div class="col-xs-4">
						<input type="text" class="form-control" value="${message.subject}" readonly>
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-2 control-label">发件人</label>
					<div class="col-xs-4">
						<input type="text" class="form-control" value="${sender.username}" readonly>
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-2 control-label">时间</label>
					<div class="col-xs-4">
						<input type="text" class="form-control" value="${message.send_time}" readonly>
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-2 control-label">收件人</label>
					<div class="col-xs-4">
					<input type="text" class="form-control" value="${receiver.username}" readonly>
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-2 control-label">内容</label>
					<div class="col-xs-8">
						<textarea class="form-control" rows="15" readonly>${message.content}</textarea>
					</div>
				</div>
			</div>
			<div class="row" style="margin-bottom: 10px">
				<!-- 返回 -->
				<div class="col-xs-10" style="text-align: right;">
					<button id="response" class="btn btn-primary" onclick="response('${message.sender}')" style="display:none">回复</button>
					<a class="btn btn-default" href="javascript:self.location=document.referrer;">返回</a>
				</div>
			</div>
		</div>
	</div>	
	<script type="text/javascript">
		$(function() {
			var response=$.session.get("response");
			if(response!=null){
				$("#response").show();
				$.session.remove("response");
			}
		});
		function response(receiver){
			$.session.set("receiver",receiver);
			parent.$("#write",parent.doucment).trigger("click");
		}
	</script>
</body>
</html>