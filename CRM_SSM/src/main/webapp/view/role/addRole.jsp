<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>添加角色</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
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
            <div class="col-xs-12"><h2>添加角色</h2></div>
        </div>
        <input type="hidden" id="pageContext" value="${pageContext.request.contextPath}">
        <div class="row">
            <form action="${pageContext.request.contextPath}/role" autocomplete="off" class="col-xs-12">
                <input name="method" type="hidden" value="add">
                <!-- 创建人 -->
               	<input name="creater" type="hidden" value="${USER.user_id}">
                <table class="table table-bordered">
                    <tr>
                        <td>角色名称</td>
                        <td colspan="3" style="text-align: left">
                        	<input type="text" id="role_name" name="role_name" class="form-control" placeholder="请填写角色名称">
                        </td>
                    </tr>
                    <tr>
                    	<td>权限等级</td>
                    	<td style="text-align: left">
                    		<select class="form-control" name="role_permission">
                    			<option value="1">1</option>
                    			<option value="2">2</option>
                    			<option value="3">3</option>
                    			<option value="4">4</option>
                    			<option value="5">5</option>
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
                        <a class="btn btn-default" href="${pageContext.request.contextPath}/role?method=show&pageNo=${param.pageNo}&keyword=${param.keyword}">返回</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <script type="text/javascript">
    	$(function(){
    		$("form").validate({
    	        onfocusout: function(element) { $(element).valid(); },//文本框失焦就校验
    	        errorElement:"b",
    	        rules:{
    				role_name:{
    					required:true,
    					maxlength:50,
    					remote:{
    	                    type: "post",
    	                    url: $("#pageContext").val()+"/role?method=checkRoleNameExist",
    	                    data:{
    	                    	role_name: function () {
    	                            return $("#role_name").val();
    	                        }
    	                    }
    	                }
    				},
    				remark:{
    					maxlength:100
    				}
    			},
    			messages:{
    				role_name:{
    					required:"角色名不能为空",
    					maxlength:"角色名的最大长度为50位",
    					remote:"角色已存在"
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
    	            if (element.name == "role_name") {
    	                b.text("角色名可用!");
    	                b.css("color","green");
    	            } 
    		    },
    	        errorPlacement : function(error, element) {
    	            error.appendTo(element.closest('td'));
    	        }
    		});
    	});
    </script>
</body>
</html>