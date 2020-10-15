<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>添加联系人</title>
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
            <div class="col-xs-12"><h2>添加联系人</h2></div>
        </div>
        <div class="row">
            <form action="${pageContext.request.contextPath}/link" class="col-xs-12" autocomplete="off">
                <input name="method" type="hidden" value="add">
               	<input name="creater" type="hidden" value="${USER.user_id}">
                <table class="table table-bordered">
                	<tr>
                		<td>客户</td>
                    	<td style="text-align: left">
                            <select name="customer_id" class="form-control">
                            	<c:forEach items="${customers}" var="customer">
                        			<option value="${customer.customer_id}">${customer.customer_id}：${customer.customer_name}</option>
                        		</c:forEach>
                            </select>
                        </td>
                       	<td>联系人名称</td>
                        <td style="text-align: left"><input type="text" name="link_name" class="form-control" placeholder="请填写联系人名称"></td>                        
                	</tr>
                    <tr>
                        <td>联系人性别</td>
                        <td style="text-align: left">
                            <label class="radio-inline" style="margin-left: 10px;">
                                <input type="radio" name="link_is_male" value="true" checked> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="link_is_male" value="false"> 女
                            </label>
                        </td>
                        <td>职位</td>
                        <td style="text-align: left"><input type="text" name="link_position" class="form-control" placeholder="请填写联系人职位"></td>                        
                    </tr>
                    <tr>
                    	<td>联系人手机</td>
                    	<td style="text-align: left"><input type="text" name="link_mobile" class="form-control" placeholder="请填写联系人手机"></td>
                    	<td>联系人年龄</td>
                    	<td style="text-align: left"><input type="text" name="link_age" class="form-control" placeholder="请填写联系人年龄"></td>
                    </tr>
                    <tr>
                    	<td>与客户关系</td>
                    	<td style="text-align: left">
                    		<select name="link_relation" class="form-control">
                    			<option value="2">朋友</option>
                    			<option value="1">亲属</option>
                    			<option value="3">同事</option>
                    			<option value="4">上司</option>
                    		</select>
						</td>
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
                        <td colspan="3" style="text-align: left"><textarea name="remark" class="form-control" rows="5" placeholder="请填写备注" style="resize: none;"></textarea></td>
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
    	        	link_name:{
    					required:true,
    					maxlength:50
    				},
    				link_position:{
    					maxlength:100
    				},
    				link_mobile:{
    					required:true,
    					isMobile:true
    				},
    				link_age:{
    					digits:true,
    					range:[0,200]
    				},
    				next_time:{
    					required:true
    				},
    				remark:{
    					maxlength:50
    				}
    			},
    			messages:{
    				link_name:{
    					required:"联系人姓名不能为空",
    					maxlength:"联系人姓名的长度不能超过50"
    				},
    				link_position:{
    					maxlength:"联系人的职位最大长度不能超过100"
    				},
    				link_mobile:{
    					required:"联系人手机号不能为空",
    					isMobile:"填入的内容不符合手机号的格式"
    				},
    				link_age:{
    					digits:"年龄必须是整数",
    					range:"无效年龄"
    				},
    				next_time:{
    					required:"下次关怀时间不能为空"
    				},
    				remark:{
    					maxlength:"备注的内容最大长度不能超过50"
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
    	jQuery.validator.addMethod("isMobile", function(value, element) {
    	    var length = value.length;
    	    var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
    	    return this.optional(element) || (length == 11 && mobile.test(value));
    	}, "请正确填写您的手机号码");
    </script>
</body>
</html>