<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>写邮件</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquerysession.js"></script>

<style>

[class=container-fluid] {
	background-color: white;
}
.error{
	color:red;
	margin-top: 10px
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
				<h2>写邮件</h2>
			</div>
		</div>
		<div class="row">
			<form id="message" class="form-horizontal" action="message" autocomplete="off">
				<input type="hidden" name="method" id="method">
				<div class="form-group">
					<label class="col-xs-2 control-label">邮件主题</label>
					<div class="col-xs-4">
						<input type="text" class="form-control" name="subject" placeholder="请输入邮件主题">
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
									<option value="${user.user_id}">${user.username}</option>
								</c:if>
							</c:forEach>
						</select>						
					</div>
				</div>
				<div class="form-group">
					<label class="col-xs-2 control-label">内容</label>
					<div class="col-xs-8">
						<textarea name="content" class="form-control" rows="15" style="resize: none;" placeholder="邮件内容在200以内"></textarea>
					</div>
				</div>
				<div class="form-group" style="margin-bottom: 10px">
					<div  class="col-xs-offset-2 col-xs-8" style="text-align:right;">
						<!-- 发送 -->
						<input type="button" id="send" class="btn btn-primary" value="发送">
						<!-- 保存到草稿箱 -->
						<input type="button" id="save" class="btn btn-warning" value="存草稿">
 					</div>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		$(function(){
			var validator=$("form").validate({
    	        onfocusout: function(element) { $(element).valid(); },//文本框失焦就校验
    	        errorElement:"b",//错误信息容器
    	        rules:{
    	        	subject:{
    					required:true,
    					maxlength:50
    				},
    				content:{
    					maxlength:200
    				}
    			},
    			messages:{
    	        	subject:{
    					required:"邮件主题不能为空",
    					maxlength:"邮件主题的最大长度不能超过50"
    				},
    				content:{
    					maxlength:"邮件主题的最大长度不能超过200"
    				}
    			},
    			//给未通过验证的元素进行处理
    		    highlight: function(element) {
    		        $(element).closest('.form-group').addClass('has-error has-feedback');
    		    },
    		    success: function (element) {    //验证成功后执行的代码
    		    	$(element).closest('.form-group').removeClass('has-error').addClass('has-success');
    	        },
    	        errorPlacement : function(error, element) {
    	            error.appendTo(element.closest('.form-group'));
    	        }
    		});
			$("#send").click(function(){
				$("#method").val("sendMessage");
	 			$("#message").submit();
			});
			$("#save").click(function(){
	 			if(validator!=null){
	 				validator.resetForm(); //清除验证
	 				console.log("in");
	 				console.log(validator);
	 			}
				$("#method").val("saveMessage");
				$("#message").submit();
			});
			if($.session.get("receiver")!=null){
				$("select").val($.session.get("receiver"));
				$.session.remove("receiver");
			}
		});
	</script>
</body>
</html>