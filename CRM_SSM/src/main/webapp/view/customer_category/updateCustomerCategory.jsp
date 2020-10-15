<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>更新客户分类</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
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
            <div class="col-xs-12"><h2>更新客户分类</h2></div>
        </div>
        <input type="hidden" id="pageContext" value="${pageContext.request.contextPath}">
        <input type="hidden" id="oldCategoryName" value="${customerCategory.customer_category_name}">        
        <div class="row">
            <form action="${pageContext.request.contextPath}/category" class="col-xs-12" autocomplete="off">
 				<input name="method" type="hidden" value="update">
                <input name="customer_category_id" type="hidden" value="${customerCategory.customer_category_id}">
 	          	<input name="keyword" type="hidden" value="${param.keyword}">
            	<input name="pageNo" type="hidden" value="${param.pageNo}">
            	<input name="colName" type="hidden" value="${param.colName}">
               	<input name="updater" type="hidden" value="${USER.user_id}">
                <table class="table table-bordered">
                    <tr>
                        <td>分类名称</td>
                        <td style="text-align: left;">
                        	<input type="text" id="customer_category_name" name="customer_category_name" class="form-control" value="${customerCategory.customer_category_name}" placeholder="请填写分类名称">
						</td>
                        <td>状态</td>
                        <td style="text-align: left">
                            <label class="radio-inline" style="margin-left: 10px;">
                                <input type="radio" name="status" value="2" <c:if test="${customerCategory.status==2}">checked</c:if>> 正常
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="status" value="-2" <c:if test="${customerCategory.status==-2}">checked</c:if>> 已删除
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td>分类描述</td>
                        <td colspan="3" style="text-align: left;">
                        	<textarea name="customer_category_desc" class="form-control" rows="15" placeholder="请填写分类描述" style="resize: none;">${customerCategory.customer_category_desc}</textarea>
                        </td>
                    </tr>
                     <tr>
                        <td>备注</td>
                        <td colspan="3" style="text-align: left;"><textarea name="remark" class="form-control" rows="10" placeholder="请填写备注" style="resize: none;">${customerCategory.remark}</textarea></td>
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
    	        	customer_category_name:{
    					required:true,
    					maxlength:15,
    	                remote:{
    	                    type: "post",
    	                    url: $("#pageContext").val()+"/category?method=checkCategoryNameExist",
    	                    data:{
    	                    	customer_category_name: function () {
    	                    		if($("#customer_category_name").val()==$("#oldCategoryName").val()){
    	                    			return "";
    	                    		}
    	                            return $("#customer_category_name").val();
    	                        }
    	                    }
    	                }
    				},
    				customer_category_desc:{
    					required:true,
    					maxlength:100
    				},
    				remark:{
    					maxlength:50
    				}
    			},
    			messages:{
    				customer_category_name:{
    					required:"分类名称不能为空",
    					maxlength:"分类名称的最大长度不能超过15位",
    					remote:"分类名已存在"
    				},
    				customer_category_desc:{
    					required:"分类描述不能为空",
    					maxlength:"分类描述的的最大长度为100位"
    				},
    				remark:{
    					maxlength:"备注的内容最大长度不能超过50位"
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