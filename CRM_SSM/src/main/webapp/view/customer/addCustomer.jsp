<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>添加客户</title>
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
            <div class="col-xs-12"><h2>添加客户</h2></div>
        </div>
        <input type="hidden" id="pageContext" value="${pageContext.request.contextPath}">
        <div class="row">
            <form action="${pageContext.request.contextPath}/customer" class="col-xs-12" autocomplete="off">
                <input name="method" type="hidden" value="add">
               	<input name="creater" type="hidden" value="${USER.user_id}">
                <table class="table table-bordered">
                    <tr>
                        <td>客户名称</td>
                        <td style="text-align: left"><input type="text" name="customer_name" class="form-control" placeholder="请填写客户名称"></td>
                        <td>客户性别</td>
                        <td style="text-align: left">
                            <label class="radio-inline" style="margin-left: 10px;">
                                <input type="radio" name="customer_is_male" value="true" checked> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="customer_is_male" value="false"> 女
                            </label>
                        </td>
                    </tr>
                    <tr>
                    	<td>客户手机</td>
                    	<td style="text-align: left"><input id="customer_mobile" type="text" name="customer_mobile" class="form-control" placeholder="请填写客户手机"></td>
                    	<td>客户QQ</td>
                    	<td style="text-align: left"><input id="customer_qq" type="text" name="customer_qq" class="form-control" placeholder="请填写客户QQ"></td>
                    </tr>
                    <tr>
                    	<td>客户地址</td>
                    	<td style="text-align: left"><input type="text" name="customer_address" class="form-control" placeholder="请填写客户地址"></td>
                    	<td>客户邮箱</td>
                    	<td style="text-align: left"><input id="customer_email" type="email" name="customer_email" class="form-control" placeholder="请填写客户邮箱"></td>
                    </tr>
                    <tr>
                    	<td>客户职位</td>
                    	<td style="text-align: left"><input type="text" name="customer_position" class="form-control" placeholder="请填写客户职位"></td>
                    	<td>客户微博</td>
                    	<td style="text-align: left"><input type="text" name="customer_blog" class="form-control" placeholder="请填写客户微博"></td>
                    </tr>
       	            <tr>
                    	<td>客户座机</td>
                    	<td style="text-align: left"><input type="text" name="customer_tel" class="form-control" placeholder="请填写客户座机"></td>
                    	<td>出生日期</td>
                    	<td style="text-align: left">
                    		<div class="input-group date">
                    			<input type="text" name="customer_birth" class="form-control" placeholder="请填写客户出生日期">
	                    		<span class="input-group-addon">
	                    			<span class="glyphicon glyphicon-calendar"></span>
	                			</span>
                        	</div>
                    	</td>
                    </tr>
					<tr>
                    	<td>客户公司</td>
                    	<td style="text-align: left"><input type="text" name="customer_company" class="form-control" placeholder="请填写客户公司"></td>
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
                    	<td>客户状态</td>
                    	<td style="text-align: left">
                            <select name="customer_state_id" class="form-control">
                            	<c:forEach items="${states}" var="state">
                        			<option value="${state.customer_state_id}">${state.customer_state_name}</option>
                        		</c:forEach>
                            </select>
                        </td>
                        <td>客户来源</td>
                    	<td style="text-align: left">
                            <select name="customer_source_id" class="form-control">
                            	<c:forEach items="${sources}" var="source">
                        			<option value="${source.customer_source_id}">${source.customer_source_name}</option>
                        		</c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                    	<td>责任员工</td>
                    	<td style="text-align: left">
                            <select name="user_id" class="form-control">
                            	<c:forEach items="${users}" var="user">
                        			<option value="${user.user_id}">${user.username}</option>
                        		</c:forEach>
                            </select>
                        </td>
                        <td>客户类型</td>
                    	<td style="text-align: left">
                            <select name="customer_category_id" class="form-control">
                            	<c:forEach items="${categories}" var="category">
                        			<option value="${category.customer_category_id}">${category.customer_category_name}</option>
                        		</c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>客户备注</td>
                        <td colspan="3" style="text-align: left"><textarea name="customer_remark" class="form-control" rows="5" placeholder="请填写备注" style="resize: none;"></textarea></td>
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
    	        format: 'YYYY-MM-DD',
    	        locale: moment.locale('zh-cn'),
    	    });
    		$("form").validate({
    	        onfocusout: function(element) { $(element).valid(); },//文本框失焦就校验
    	        errorElement:"b",
    	        rules:{
    				customer_name:{
    					required:true,
    					maxlength:10
    				},
    				customer_mobile:{
    					required:true,
    					isMobile:true,
    	                remote:{
    	                    type: "post",
    	                    url: $("#pageContext").val()+"/customer?method=checkMobileExist",
    	                    data:{
    	                    	customer_mobile: function () {
    	                            return $("#customer_mobile").val();
    	                        }
    	                    }
    	                }
    				},
    				customer_qq:{
    					isQQ:true,
    	                remote:{
    	                    type: "post",
    	                    url: $("#pageContext").val()+"/customer?method=checkQQExist",
    	                    data:{
    	                    	customer_qq: function () {
    	                            return $("#customer_qq").val();
    	                        }
    	                    }
    	                }				
    				},
    				customer_address:{
    					maxlength:100   					
    				},
    				customer_email:{
    					email:true,
    	                remote:{
    	                    type: "post",
    	                    url: $("#pageContext").val()+"/customer?method=checkEmailExist",
    	                    data:{
    	                    	customer_email: function () {
    	                            return $("#customer_email").val();
    	                        }
    	                    }
    	                }
    				},
    				customer_remark:{
    					maxlength:1000
    				},
    				customer_position:{
    					maxlength:100
    				},
    				customer_blog:{
    					maxlength:100,
    	                remote:{
    	                    type: "post",
    	                    url: $("#pageContext").val()+"/customer?method=checkBlogExist",
    	                    data:{
    	                    	customer_blog: function () {
    	                            return $("#customer_blog").val();
    	                        }
    	                    }
    	                }
    				},
    				customer_tel:{
    					isTel:true
    				},
    				customer_birth:{
    					date:true
    				},
    				customer_company:{
    					maxlength:50
    				},
    				remark:{
    					maxlength:50
    				}
    			},
    			messages:{
    				customer_name:{
    					required:"客户姓名不能为空",
    					maxlength:"客户姓名最大长度不能超过10位"
    				},
    				customer_mobile:{
    					required:"客户的手机号不能为空",
    					isMobile:"填入的信息不符合手机号的格式",
    					remote:"该手机号已被使用"
    				},
    				customer_qq:{
    					isQQ:"填入的信息不符合QQ号格式",
    					remote:"该QQ号已被使用"
    				},
    				customer_address:{
    					maxlength:"客户地址的最大长度不能超过100"   					
    				},
    				customer_email:{
    					email:"填入的信息不符合邮箱格式",
    					remote:"该邮箱已被使用"
    				},
    				customer_remark:{
    					maxlength:"客户备注的最大长度不能超过1000"
    				},
    				customer_position:{
    					maxlength:"客户职位信息的最大长度不能超过100"
    				},
    				customer_blog:{
    					maxlength:"客户微博的最大长度不能超过100",
    					remote:"该微博已被使用"
    				},
    				customer_tel:{
    					isTel:"填入的信息不符合座机号码的格式"
    				},
    				customer_birth:{
    					date:"填入的信息不符合日期的格式"
    				},
    				customer_company:{
    					maxlength:"客户公司名称的最大长度不能超过50"
    				},
    				remark:{
    					maxlength:"备注的最大长度不能超过50"
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

    		jQuery.validator.addMethod("isMobile", function(value, element) {
        	    var length = value.length;
        	    var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
        	    return this.optional(element) || (length == 11 && mobile.test(value));
        	}, "请正确填写您的手机号码");
        	jQuery.validator.addMethod("isQQ", function(value, element) {
        	    var length = value.length;
        	    var qq = /^[1-9]\d{4,9}$/;
        	    return this.optional(element) || qq.test(value);
        	}, "请正确填写您的QQ号");
        	jQuery.validator.addMethod("isTel", function(value, element) {
                var length = value.length;
                var phone = /(^(\d{3,4}-)?\d{6,8}$)|(^(\d{3,4}-)?\d{6,8}(-\d{1,5})?$)|(\d{11})/;
                return this.optional(element) || (phone.test(value));
            }, "请填写正确的固定电话");
    	});
    </script>
</body>
</html>