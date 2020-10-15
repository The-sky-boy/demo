<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/card.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/request-data.js"></script>
    <title>新增用户</title>
    <style>
        td{
            text-align: center;
        }
        [class=container-fluid]{
            background-color: white;
        }
        .error{
        	color:red;
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
            <div class="col-xs-12"><h2>新增用户</h2></div>
        </div>
        <input type="hidden" id="path" value="${pageContext.request.contextPath}">
        <input id="keyword" type="hidden" value="${param.keyword}">
       	<input id="pageNo" type="hidden" value="${param.pageNo}">
        <div class="row">
            <form autocomplete="off" class="col-xs-12" method="post">
                <input name="method" type="hidden" value="add">
               	<input name="creater" type="hidden" value="${USER.user_id}">
                <table class="table table-bordered">
                    <tr>
                        <td>用户名</td>
                        <td style="text-align: left">
                            <input id="username" name="username" type="text" class="form-control" placeholder="请填写用户名">
                        </td>
                        <td>密码</td>
                        <td style="text-align: left">
                            <input name="password" type="password" class="form-control" placeholder="请填写密码">
                        </td>
                    </tr>
                    <tr>
                        <td>部门</td>
                        <td style="text-align: left">
                            <select id="department_id" name="department_id" class="form-control">
                            </select>
                        </td>
                        <td>角色</td>
                        <td style="text-align: left">
                            <select id="role_id" name="role_id" class="form-control">
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>性别</td>
                        <td style="text-align: left">
                            <label class="radio-inline" style="margin-left: 10px;">
                                <input type="radio" name="is_male" value="true" checked> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="is_male" value="false"> 女
                            </label>
                        </td>
                        <td>手机号</td>
                        <td style="text-align: left">
                            <input id="mobile" name="mobile" type="text" class="form-control" placeholder="请填写手机号">
                        </td>
                    </tr>
                    <tr>
                        <td>地址</td>
                        <td style="text-align: left">
                            <input name="address" type="text" class="form-control" placeholder="请填写地址">
                        </td>
                        <td>年龄</td>
                        <td style="text-align: left">
                            <input name="age" type="text" class="form-control" placeholder="请填写年龄">
                        </td>
                    </tr>
                    <tr>
                        <td>固定电话</td>
                        <td style="text-align: left">
                            <input name="tel" type="text" class="form-control" placeholder="请填写固定电话">
                        </td>
                        <td>身份证号</td>
                        <td style="text-align: left">
                            <input id="id_num" name="id_num" type="text" class="form-control" placeholder="请填写身份证号">
                        </td>
                    </tr>
                    <tr>
                        <td>电子邮件</td>
                        <td style="text-align: left">
                            <input id="email" name="email" type="email" class="form-control" placeholder="请填写邮箱">
                        </td>
                        <td>管理员</td>
                        <td style="text-align: left">
                        	<label class="radio-inline" style="margin-left: 10px;">
                                <input type="radio" name="is_admin" value="true" checked> 是
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="is_admin" value="false"> 否
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td>爱好</td>
                        <td style="text-align: left">
                            <input name="hobby" type="text" class="form-control" placeholder="请填写爱好">
                        </td>
                        <td>学历</td>
                        <td style="text-align: left">
                            <select name="education" id="education" class="form-control">
                                <option value="1">小学</option>
                                <option value="2">初中</option>
                                <option value="3">高中</option>
                                <option value="4">专科</option>
                                <option value="5">本科</option>
                                <option value="6">硕士</option>
                                <option value="7">博士</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>工资卡号</td>
                        <td style="text-align: left">
                            <input id="card_num" name="card_num" type="text" class="form-control" placeholder="请填写工资卡号">
                        </td>
                        <td>民族</td>
                        <td style="text-align: left">
                            <input name="nation" type="text" class="form-control" placeholder="请填写民族">
                        </td>
                    </tr>
                    <tr>
                        <td>婚姻状况</td>
                        <td style="text-align: left">
                            <select name="marry" class="form-control">
                                <option value="0">未婚</option>
                                <option value="1">已婚</option>
                                <option value="2">离异</option>
                            </select>
                        </td>
                       	<td>系统内置</td>
                        <td style="text-align: left">
                        	<label class="radio-inline" style="margin-left: 10px;">
                                <input type="radio" name="is_system" value="true" checked> 是
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="is_system" value="false"> 否
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td>备注</td>
                        <td colspan="3" style="text-align: left">
                            <textarea name="remark" class="form-control" style="resize:none" rows="8"></textarea>
                        </td>
                    </tr>
                </table>
                <div class="row" style="margin-bottom: 10px">
                    <!-- 保存 -->
                    <div class="col-xs-6" style="text-align: right;">
                        <button type="submit" class="btn btn-primary">保存</button>
                    </div>
                    <!-- 返回 -->
                    <div class="col-xs-6">
                        <a class="btn btn-default" href="showUser.jsp?pageNo=${param.pageNo}&keyword=${param.keyword}">返回</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <script type="text/javascript">
		var departments = selectAll($("#path").val()+"/selectAllDept");
		var roles = selectAll($("#path").val()+"/selectAllRole");
    	$(function(){
    		createSelectBox();
    		formCheck();
    	});
    	// 组装下拉框
        function createSelectBox(){
    		// 部门下拉框
    		if(departments==null){
    			alert("部门下拉框生成有误，请稍后重试！");
    			location.href = "showUser.jsp";
    			return;
    		} else{	
    			var options = "";
    			$.each(departments, function(i, department){
        			options += "<option value='"+department.department_id+"'>"+department.department_name+"</option>";
        		});
    			$("#department_id").html(options);
    		}
    		// 角色下拉框
    		if(roles==null){
    			parent.showDialog("角色下拉框生成有误，请稍后重试！");
    			location.href = "showUser.jsp";
    			return;
    		} else{	
    			var options = "";
    			$.each(roles, function(i, role){
        			options += "<option value='"+role.role_id+"'>"+role.role_name+"</option>";
        		});
    			$("#role_id").html(options);
    		}
    	}
        function formCheck(){
        	$("form").validate({
    	        onfocusout: function(element) { $(element).valid(); },//文本框失焦就校验
    	        errorElement:"b",
    	        rules:{
    				username:{
    					required:true,
    					maxlength:8
/*     	                remote:{
    	                    type: "post",
    	                    url: $("#pageContext").val()+"/user?method=checkUsernameExist",
    	                    data:{
    	                        username: function () {
    	                            return $("#username").val();
    	                        }
    	                    }
    	                } */
    				},
    				password:{
    					required:true,
    					minlength:8,
    					maxlength:20
    				},
    				mobile:{
    					required:true,
    					isMobile:true
/*     	                remote:{
    	                    type: "post",
    	                    url: $("#pageContext").val()+"/user?method=checkMobileExist",
    	                    data:{
    	                        username: function () {
    	                            return $("#mobile").val();
    	                        }
    	                    }
    	                } */
    				},
    				age:{
    					digits:true,
    					range:[0,200]
    				},
    				address:{
    					maxlength:50
    				},
    				tel:{
    					isTel:true
    				},
    				id_num:{
    					required:true,
    					isIdCardNo:true
/*     	                remote:{
    	                    type: "post",
    	                    url: $("#pageContext").val()+"/user?method=checkIdNumExist",
    	                    data:{
    	                        username: function () {
    	                            return $("#id_num").val();
    	                        }
    	                    }
    	                } */
    				},
    				email:{
    					required:true,
    					email:true
/*     	                remote:{
    	                    type: "post",
    	                    url: $("#pageContext").val()+"/user?method=checkEmailExist",
    	                    data:{
    	                        username: function () {
    	                            return $("#email").val();
    	                        }
    	                    }
    	                } */
    				},
    				card_num:{
    					required:true,
    					creditcard:true
/*     	                remote:{
    	                    type: "post",
    	                    url: $("#pageContext").val()+"/user?method=checkCardNumExist",
    	                    data:{
    	                        username: function () {
    	                            return $("#card_num").val();
    	                        }
    	                    }
    	                } */
    				},
    				hobby:{
    					maxlength:50
    				},
    				remark:{
    					maxlength:100
    				}
    			},
    			messages:{
    				username:{
    					required:"用户名不能为空",
    					maxlength:"用户名最大长度不能超过8"
    					/* remote:"用户名已存在" */
    				},
    				password:{
    					required:"密码不能为空",
    					minlength:"密码的最小长度为8位",
    					maxlength:"密码的最大长度为20位"
    				},
    				mobile:{
    					required:"手机号不能为空",
    					isMobile:"请输入正确的手机号"
    				/* 	remote:"该手机号已被使用" */
    				},
    				age:{
    					digits:"年龄必须是整数",
    					range:"输入值不在有效年龄范围内"
    				},
    				address:{
    					maxlength:"地址的最大长度不能超过50"
    				},
    				tel:{
    					isTel:"你输入的座机号码无效"
    				},
    				id_num:{
    					required:"身份证号码不能为空",
    					isIdCardNo:"无效的身份证号"
    					/* remote:"该身份证号已存在" */
    				},
    				email:{
    					required:"邮箱不能为空",
    					email:"输入的邮箱格式有误"
    				/* 	remote:"该邮箱已被使用" */
    				},
    				card_num:{
    					required:"工资卡号不能为空",
    					creditcard:"无效的工资卡号"
    					/* remote:"该工资卡号已被使用" */
    				},
    				hobby:{
    					maxlength:"爱好内容的最大长度不能超过50位"
    				},
    				remark:{
    					maxlength:"备注的内容最大长度不能超过100位"
    				}
    			},
    			//给未通过验证的元素进行处理
    		    highlight: function(element) {
    		        $(element).closest('td').addClass('has-error');
    		    },
    		    success: function (b,element) {    //验证成功后执行的代码
    		    	$(element).closest('td').removeClass('has-error').addClass('has-success');
    	            if (element.name == "username") {
    	                b.text("用户名可用!");
    	                b.css("color","green");
    	            } 
    		    },
    	        errorPlacement : function(error, element) {
    	            error.appendTo(element.closest('td'));
    	        },
    	        submitHandler: function (form) {
    	        	var url = $("#path").val()+"/addUser";
    	        	$.post(url,$("form").serialize(),function(data){
    	        		var json = eval(data);
    	        		if(json.state==500){
    	        			parent.showDialog(json.error);
    	        		}
    	        		else{
    	        			parent.showDialog("添加成功！");
    	        			console.log($("#pageNo").val());
    	        			location.href="showUser.jsp?pageNo="+$("#pageNo").val()+"&keyword="+$("#keyword").val();
    	        		}
    	        	},"json");
    	        }
    		});
        }
    	jQuery.validator.addMethod("isMobile", function(value, element) {
    	    var length = value.length;
    	    var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
    	    return this.optional(element) || (length == 11 && mobile.test(value));
    	}, "请正确填写您的手机号码");
    	jQuery.validator.addMethod("isTel", function(value, element) {
            var length = value.length;
            var phone = /(^(\d{3,4}-)?\d{6,8}$)|(^(\d{3,4}-)?\d{6,8}(-\d{1,5})?$)|(\d{11})/;
            return this.optional(element) || (phone.test(value));
        }, "请填写正确的固定电话");//可以自定义默认提示信息
		jQuery.validator.addMethod("isIdCardNo", function(value, element) {
			return this.optional(element) || idCardNoUtil.checkIdCardNo(value);
		}, "请正确输入您的身份证号码");
    </script>
</body>
</html>