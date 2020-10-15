<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>重新编辑</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
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
				<h2>重新编辑</h2>
			</div>
		</div>
		<div class="row">
			<form id="message" class="form-horizontal" action="message" autocomplete="off">
				<input type="hidden" name="method" id="method">
				<input type="hidden" name="message_id" value="${message.message_id}">
				<div class="form-group">
					<label class="col-xs-2 control-label">邮件主题</label>
					<div class="col-xs-4">
						<input type="text" class="form-control" name="subject" value="${message.subject}" placeholder="请输入邮件主题">
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-2 control-label">发件人</label>
					<div class="col-xs-4">
						<input type="hidden" class="form-control" name="sender" value="${USER.user_id}">
						<input type="text" class="form-control" value="${USER.username}" readonly>
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-2 control-label">收件人</label>
					<div class="col-xs-4">
						<select name="receiver" class="form-control">
							<c:forEach items="${users}" var="user">
								<c:if test="${user.user_id!=USER.user_id}">
									<option value="${user.user_id}" <c:if test="${message.receiver==user.user_id}">selected</c:if>>${user.username}</option>
								</c:if>
							</c:forEach>
						</select>						
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-2 control-label">内容</label>
					<div class="col-xs-8">
						<textarea name="content" maxlength="200" class="form-control" rows="15" style="resize: none;" placeholder="邮件内容在200以内">${message.content}</textarea>
					</div>
				</div>
				<div class="form-group" style="margin-bottom: 10px">
					<div  class="col-xs-offset-2 col-xs-8" style="text-align:right;">
						<!-- 发送 -->
						<input type="button" id="send" class="btn btn-primary" value="发送">
						<!-- 保存到草稿箱 -->
						<input type="button" id="save" class="btn btn-warning" value="存草稿">
						<!-- 返回 -->
						<a class="btn btn-default" href="javascript:history.go(-1)">返回</a>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		$(function(){
			$("#send").click(function(){
				$("#method").val("sendDraft");
 				$("#message").submit();
			});
			$("#save").click(function(){
				$("#method").val("saveAgain");
				$("#message").submit();
			});
		})
	</script>
</body>
</html>