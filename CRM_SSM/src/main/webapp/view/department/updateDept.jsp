<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>修改部门</title>
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
            <div class="col-xs-12"><h2>修改部门</h2></div>
        </div>
        <input id="oldDepartmentName" type="hidden" value="${dept.department_name}">
        <input type="hidden" id="pageContext" value="${pageContext.request.contextPath}">
        <div class="row">
        	<!-- 数据表单 -->
            <form action="${pageContext.request.contextPath}/dept" class="col-xs-12" autocomplete="off">
                <input name="method" type="hidden" value="update">
                <input name="department_id" type="hidden" value="${dept.department_id}">
 	          	<input name="keyword" type="hidden" value="${param.keyword}">
            	<input name="pageNo" type="hidden" value="${param.pageNo}">
               	<input name="updater" type="hidden" value="${USER.user_id}">
                <table class="table table-bordered">
                    <tr>
                        <td>部门名称</td>
                        <td style="text-align: left">
                        	<input type="text" name="department_name" class="form-control" value="${dept.department_name}" placeholder="请填写部门名称">
                        </td>
                    </tr>
                    <tr>
                        <td>部门描述</td>
                        <td style="text-align: left">
                        	<textarea name="department_desc" class="form-control" rows="15" placeholder="请填写部门描述" style="resize: none;">${dept.department_desc}</textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>备注</td>
                        <td style="text-align: left">
                        	<textarea name="remark" class="form-control" rows="5" placeholder="请填写备注" style="resize: none;">${dept.remark}</textarea>
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
                        <a class="btn btn-default" href="javascript:self.location=document.referrer">返回</a>
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
    				department_name:{
    					required:true,
    					maxlength:50,
    	                remote:{
    	                    type: "post",
    	                    url: $("#pageContext").val()+"/dept?method=checkDeptNameExist",
    	                    data:{
    	                    	deptartment_name: function () {
    	                    		if($("#oldDepartmentName").val()==$("#deptartment_name").val()){
    	                    			return "";
    	                    		}
    	                            return $("#deptartment_name").val();
    	                        }
    	                    }
    	                }
    				},
    				department_desc:{
    					required:true,
    					maxlength:500
    				},
    				remark:{
    					maxlength:100
    				}
    			},
    			messages:{
    				department_name:{
    					required:"部门名称不能为空",
    					maxlength:"部门名称最大长度不能超过50",
    					remote:"部门名已存在"
    				},
    				department_desc:{
    					required:"部门描述不能为空",
    					maxlength:"密码的最大长度为500位"
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