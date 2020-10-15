<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>添加客户关怀</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-datetimepicker.min.css">  
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/moment-with-locales.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.min.js"></script>    
    <style>
        td{
            text-align: center;
        }
        [class=container-fluid]{
            background-color: white;
        }
        .error{
        	color:red
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
            <div class="col-xs-12"><h2>添加客户关怀</h2></div>
        </div>
        <div class="row">
            <form action="${pageContext.request.contextPath}/care" class="col-xs-12" autocomplete="off">
                <input name="method" type="hidden" value="add">
               	<input name="creater" type="hidden" value="${USER.user_id}">
                <table class="table table-bordered">
                    <tr>
                        <td>客户</td>
                        <td style="margin-bottom: 10px">
							<select name="customer_id" class="form-control">
							   	<c:forEach items="${customers}" var="customer">
                        			<option value="${customer.customer_id}">${customer.customer_id}：${customer.customer_name}</option>
                        		</c:forEach>
							</select>
						</td>
                        <td>关怀主题</td>
                        <td style="text-align: left"><input type="text" class="form-control" name="care_subject" placeholder="请填写关怀主题"></td>
                    </tr>
                    <tr>
                    	<td>关怀方式</td>
                    	<td style="text-align: left"><input type="text" name="care_type" class="form-control" placeholder="请填写关怀方式"></td>
                    	<td>状态</td>
                        <td style="text-align: left">
                            <label class="radio-inline" style="margin-left: 10px;">
                                <input type="radio" name="status" value="2" checked> 正常
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="status" value="-2"> 已删除
                            </label>
                        </td>
                    </tr>
                    <tr>
                    	<td>下次关怀时间</td>
                    	<td style="text-align: left">
                    		<div class="input-group date">
	                    		<input type="text" class="form-control" name="next_time" placeholder="请填写下次关怀时间">
	                    		<span class="input-group-addon">
	                    			<span class="glyphicon glyphicon-calendar"></span>
	                			</span>
	                		</div>
                    	</td>
                    	<td></td>
                    	<td></td>
                    </tr>
                    <tr>
                        <td>备注</td>
                        <td colspan="3" style="text-align: left"><textarea name="remark" class="form-control" rows="10" placeholder="请填写备注" style="resize: none;"></textarea></td>
                    </tr>
                </table>
                <div class="row" style="margin-bottom: 10px">
                    <!-- 保存 -->
                    <div class="col-xs-6" style="text-align: right;">
                        <button type="submit" class="btn btn-primary">保存</button>
                    </div>
                    <!-- 返回 -->
                    <div class="col-xs-6">
                        <a class="btn btn-default" href="javascript:self.location=document.referrer">返回</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <script type="text/javascript">
    	$(function(){
    		//日历：
    	    $(".date").datetimepicker({
    	        format: 'YYYY-MM-DD HH:mm:ss',
    	        locale: moment.locale('zh-cn')
    	    });
    		$("form").validate({
    	        onfocusout: function(element) { $(element).valid(); },//文本框失焦就校验
    	        errorElement:"b",
    	        rules:{
    	        	care_subject:{
    					required:true,
    					maxlength:50
    				},
    				care_type:{
    					required:true,
    					maxlength:50
    				},
    				next_time:{
    					required:true
    				},
    				remark:{
    					maxlength:50
    				}
    			},
    			messages:{
    				care_subject:{
    					required:"关怀主题不能为空",
    					maxlength:"关怀主题的最大长度为50位"
    				},
    				care_type:{
    					required:"关怀类型不能为空",
    					maxlength:"关怀类型的最大长度为50位"
    				},
    				next_time:{
    					required:"下次关怀时间不能为空"
    				},
    				remark:{
    					maxlength:"备注的内容最大长度不能超过100位"
    				}
    			},
    			//给未通过验证的元素进行处理
    		    highlight: function(element) {
    		        $(element).closest('td').addClass('has-error has-feedback');
    		    },
    		    success: function (element) {    //验证成功后执行的代码
    		    	$(element).closest('td').removeClass('has-error').addClass('has-success');
    	        },
    	        errorPlacement : function(error, element) {
    	            error.appendTo(element.closest('td'));
    	        }
    		});
    	});
    </script>
</body>
</html>