<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>更新客户来源</title>
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
            <div class="col-xs-12"><h2>更新客户来源</h2></div>
        </div>
        <input type="hidden" id="pageContext" value="${pageContext.request.contextPath}">
        <input type="hidden" id="oldSourceName" value="${customerSource.customer_source_name}">
        <div class="row">
            <form action="${pageContext.request.contextPath}/source" class="col-xs-12" autocomplete="off">
 				<input name="method" type="hidden" value="update">
                <input name="customer_source_id" type="hidden" value="${customerSource.customer_source_id}">
 	          	<input name="keyword" type="hidden" value="${param.keyword}">
            	<input name="pageNo" type="hidden" value="${param.pageNo}">
            	<input name="colName" type="hidden" value="${param.colName}">
               	<input name="updater" type="hidden" value="${USER.user_id}">
                <table class="table table-bordered">
                    <tr>
                        <td>来源名称</td>
                        <td style="text-align: left">
                        	<input type="text" id="customer_source_name" name="customer_source_name" class="form-control" value="${customerSource.customer_source_name}" placeholder="请填写来源名称">
						</td>
                        <td>状态</td>
                        <td style="text-align: left">
                            <label class="radio-inline" style="margin-left: 10px;">
                                <input type="radio" name="status" value="2" <c:if test="${customerSource.status==2}">checked</c:if>> 正常
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="status" value="-2" <c:if test="${customerSource.status==-2}">checked</c:if>> 已删除
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td>来源描述</td>
                        <td colspan="3" style="text-align: left">
                        	<textarea name="customer_source_desc" class="form-control" rows="15" placeholder="请填写来源描述" style="resize: none;">${customerSource.customer_source_desc}</textarea>
                        </td>
                    </tr>
                     <tr>
                        <td>备注</td>
                        <td colspan="3" style="text-align: left"><textarea name="remark" class="form-control" rows="10" placeholder="请填写备注" style="resize: none;">${customerSource.remark}</textarea></td>
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
    	        	customer_source_name:{
    					required:true,
    					maxlength:15,
    					remote:{
    	                    type: "post",
    	                    url: $("#pageContext").val()+"/source?method=checkCustomerSourceNameExist",
    	                    data:{
    	                    	customer_source_name: function () {
    	                    		if($('#customer_source_name').val()==$('#oldSourceName').val()){
    	                    			return "";
    	                    		}
    	                            return $("#customer_source_name").val();
    	                        }
    	                    }
    	                }
    				},
    				customer_source_desc:{
    					required:true,
    					maxlength:50
    				},
    				remark:{
    					maxlength:50
    				}
    			},
    			messages:{
    	        	customer_source_name:{
    					required:"客户来源名称不能为空",
    					maxlength:"客户来源名称的长度不能超过15",
    					remote:"客户来源名已存在"
    				},
    				customer_source_desc:{
    					required:"客户来源描述不能为空",
    					maxlength:"客户来源描述的长度不能超过50"
    				},
    				remark:{
    					maxlength:"备注的长度不能超过50"
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