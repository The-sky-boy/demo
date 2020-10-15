<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>添加联系记录</title>
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
            <div class="col-xs-12"><h2>添加联系记录</h2></div>
        </div>
        <div class="row">
            <form action="${pageContext.request.contextPath}/record" class="col-xs-12" autocomplete="off">
                <input name="method" type="hidden" value="add">
               	<input name="creater" type="hidden" value="${USER.user_id}">
                <table class="table table-bordered">
                	<tr>
                		<td>客户</td>
                    	<td style="text-align: left;">
                            <select name="customer_id" class="form-control">
                            	<c:forEach items="${customers}" var="customer">
                        			<option value="${customer.customer_id}">${customer.customer_id}：${customer.customer_name}</option>
                        		</c:forEach>
                            </select>
                        </td>
                       	<td>联系类型</td>
                        <td style="text-align: left;"><input type="text" name="link_type" class="form-control" placeholder="请填写联系类型"></td>                        
                	</tr>
                    <tr>
                        <td>联系主题</td>
                        <td style="text-align: left;"><input type="text" name="link_subject" class="form-control" placeholder="请填写联系主题"></td>
                        <td>下次联系时间</td>
                        <td style="text-align: left;">
                        	<div class="input-group date">
                        		<input type="text" name="link_nexttime" class="form-control" placeholder="请填写下次联系时间">
	                    		<span class="input-group-addon">
	                    			<span class="glyphicon glyphicon-calendar"></span>
	                			</span>
                        	</div>
                        </td>                        
                    </tr>
                    <tr>
                    	<td>状态</td>
                        <td style="text-align: left">
                            <label class="radio-inline" style="margin-left: 10px;">
                                <input type="radio" name="status" value="2" checked> 正常
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="status" value="-2"> 已删除
                            </label>
                        </td>
                        <td>下次关怀时间</td>
                    	<td style="text-align: left;">
                    		<div class="input-group date">
                    			<input type="text" name="next_time" class="form-control" placeholder="请填写下次关怀时间">
                    		    <span class="input-group-addon">
	                    			<span class="glyphicon glyphicon-calendar"></span>
	                			</span>
	                		</div>
                    	</td>
                    </tr>
                    <tr>
                        <td>备注</td>
                        <td colspan="3" style="text-align: left;"><textarea name="remark" class="form-control" rows="5" placeholder="请填写备注" style="resize: none;"></textarea></td>
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
    	        	link_type:{
    					required:true,
    					maxlength:50
    				},
    				link_subject:{
    					required:true,
    					maxlength:200
    				},
    				link_nexttime:{
    					required:true
    				},
    				remark:{
    					maxlength:50
    				},
    				next_time:{
    					required:true,
    				}
    			},
    			messages:{
    	        	link_type:{
    					required:"联系类型不能为空",
    					maxlength:"联系类型的长度不能超过50"
    				},
    				link_subject:{
    					required:"联系主题不能为空",
    					maxlength:"联系主题的长度不能超过200"
    				},
    				link_nexttime:{
    					required:"下次联系时间不能为空"
    				},
    				remark:{
    					maxlength:"备注的长度不能超过50"
    				},
    				next_time:{
    					required:"下次联系时间不能为空",
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