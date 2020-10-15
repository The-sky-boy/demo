<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>13管理员-公告管理-添加公告</title>
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
            <div class="col-xs-12"><h2>添加公告</h2></div>
        </div>
        <!-- 数据表格 -->
        <div class="row">
            <form action="notice" class="col-xs-12" autocomplete="off">
                <input name="method" type="hidden" value="add">
            	<input name="keyword" type="hidden" value="${param.keyword}">
            	<input name="pageNo" type="hidden" value="${param.pageNo}">
            	<input name="creater" type="hidden" value="${USER.user_id}">
                <table class="table table-bordered">
                    <tr>
                        <td>发布时间</td>
                        <td style="text-align: left">
                        	<div class="input-group date">
                        		<input type="text" name="pub_time" class="form-control" placeholder="请选择发布时间">
	                    		<span class="input-group-addon">
	                    			<span class="glyphicon glyphicon-calendar"></span>
	                			</span>
                        	</div>
                        </td>
                        <td>截至时间</td>
                        <td style="text-align: left">
                        	<div class="input-group date">
                        		<input type="text" name="expire_time" class="form-control" placeholder="请选择截至时间">
	                    		<span class="input-group-addon">
	                    			<span class="glyphicon glyphicon-calendar"></span>
	                			</span>
                        	</div>
                        </td>
                    
                    </tr>
                    <tr>
                        <td>主题</td>
                        <td style="text-align: left"><input type="text" name="subject" class="form-control" placeholder="请填写公告主题"></td>
                        <td>通知范围</td>
                        <td style="text-align: left">
                            <select name="receive_id" class="form-control">
                                <option value="0">全部</option>
                                <c:forEach items="${depts}" var="dept">
                                	<option value="${dept.department_id}">${dept.department_name}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>内容</td>
                        <td colspan="3" style="text-align: left">    
                            <textarea name="text" class="form-control" rows="15" placeholder="请填写公告内容">${notice.text}</textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>备注</td>
                        <td colspan="3" style="text-align: left">    
                            <textarea name="remark" class="form-control" rows="5" placeholder="请填写公告备注">${notice.remark}</textarea>
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
                        <a class="btn btn-default" href="${pageContext.request.contextPath}/notice?method=show&pageNo=${param.pageNo}&keyword=${param.keyword}">返回</a>
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
    	        locale: moment.locale('zh-cn'),
    	    });
    		
    		$("form").validate({
    	        onfocusout: function(element) { $(element).valid(); },//文本框失焦就校验
    	        errorElement:"b",
    	        rules:{
    				subject:{
    					required:true,
    					maxlength:50
    				},
    				text:{
    					required:true,
    					maxlength:500
    				},
    				pub_time:{
    					required:true,
    					date:true   					
    				},
    				expire_time:{
    					required:true,
    					date:true   					
    				},
    				remark:{
    					maxlength:50
    				}
    			},
    			messages:{
    				subject:{
    					required:"公告主题不能为空",
    					maxlength:"公告主题最大长度不能超过50"
    				},
    				text:{
    					required:"公告内容不能为空",
    					maxlength:"公告内容的最大长度为1000位"
    				},
    				pub_time:{
    					required:"发布时间不能为空",
    					date:"发布时间不符合日期格式"   					
    				},
    				expire_time:{
    					required:"过期时间不能为空",
    					date:"过期时间不符合日期格式"    					
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