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
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <title>修改个人信息</title>
    <style>
        td{
            text-align: center;
        }
        [class=container-fluid]{
            background-color: white;
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
            <div class="col-xs-12"><h2>修改个人信息</h2></div>
        </div>
        <div class="row">
        	<input id="pageContext" type="hidden" value="${pageContext.request.contextPath}">
            <form action="user" autocomplete="off" class="col-xs-12">
            	<input name="method" type="hidden" value="personalUpdate">
            	<input name="user_id" type="hidden" value="${USER.user_id}">
            	<input name="password" type="hidden" value="${USER.password}">
            	<input name="updater" type="hidden" value="${USER.user_id}">
            	<input name="role_id" type="hidden" value="${USER.role_id}">
            	<input name="is_admin" type="hidden" value="${USER.is_admin}">
            	<input name="is_system" type="hidden" value="${USER.is_system}">
            	<input name="status" type="hidden" value="${USER.status}">
                <table class="table table-bordered">
                    <tr>
                        <td>用户名</td>
                        <td>
                            <input name="username" type="text" class="form-control" value="${USER.username }">
                        </td>
                        <td>电子邮件</td>
                        <td>
                            <input name="email" type="email" class="form-control" value="${USER.email}">
                        </td>
                    </tr>
                    <tr>
                        <td>性别</td>
                        <td style="text-align: left">
                        	<label class="radio-inline" style="margin-left: 10px;">
                            	<input type="radio" name="is_male" value="true"<c:if test="${USER.is_male}">checked</c:if>> 男
                   			</label>
	                    	<label class="radio-inline">
	            				<input type="radio" name="is_male" value="false"<c:if test="${!USER.is_male}">checked</c:if>> 女
	                     	</label>
                        </td>
                        <td>手机号</td>
                        <td>
                            <input name="mobile" type="text" class="form-control" value="${USER.mobile}">
                        </td>
                    </tr>
                    <tr>
                        <td>地址</td>
                        <td>
                            <input name="address" type="text" class="form-control" value="${USER.address}">
                        </td>
                        <td>年龄</td>
                        <td>
                            <input name="age" type="text" class="form-control" value="${USER.age}">
                        </td>
                    </tr>
                    <tr>
                        <td>固定电话</td>
                        <td>
                            <input name="tel" type="text" class="form-control" value="${USER.tel}">
                        </td>
                        <td>身份证号</td>
                        <td>
                            <input name="id_num" type="text" class="form-control" value="${USER.id_num}">
                        </td>
                    </tr>
                    <tr>
                        <td>爱好</td>
                        <td>
                            <input name="hobby" type="text" class="form-control" value="${USER.hobby}">
                        </td>
                        <td>学历</td>
                        <td>
                            <select name="education" class="form-control">
                                <option value="1" <c:if test="${USER.education==1}">selected</c:if>>小学</option>
                                <option value="2" <c:if test="${USER.education==2}">selected</c:if>>初中</option>
                                <option value="3" <c:if test="${USER.education==3}">selected</c:if>>高中</option>
                                <option value="4" <c:if test="${USER.education==4}">selected</c:if>>专科</option>
                                <option value="5" <c:if test="${USER.education==5}">selected</c:if>>本科</option>
                                <option value="6" <c:if test="${USER.education==6}">selected</c:if>>硕士</option>
                                <option value="7" <c:if test="${USER.education==7}">selected</c:if>>博士</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>工资卡号</td>
                        <td>
                            <input name="card_num" type="text" class="form-control" value="${USER.card_num}">
                        </td>
                        <td>民族</td>
                        <td>
                            <input name="nation" type="text" class="form-control"  value="${USER.nation}">
                        </td>
                    </tr>
                    <tr>
                    	<td>部门</td>
                        <td>
                            <select name="department_id" class="form-control">
                            	<c:forEach items="${depts}" var="dept">
                            		<option value="${dept.department_id}" <c:if test="${dept.department_id==USER.department_id}">selected</c:if>>${dept.department_name}</option>
                        		</c:forEach>
                            </select>
                        </td>
                        <td>婚姻状况</td>
                        <td>
                            <select name="marry" class="form-control">
                                <option value="0" <c:if test="${USER.marry==0}">selected</c:if>>未婚</option>
                                <option value="1" <c:if test="${USER.marry==1}">selected</c:if>>已婚</option>
                                <option value="-1" <c:if test="${USER.marry==-1}">selected</c:if>>离异</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>备注</td>
                        <td colspan="3">
                            <textarea name="remark" class="form-control" style="resize:none" rows="8">${USER.remark}</textarea>
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
                        <a class="btn btn-default" href="javascript:history.back()">返回</a>
                    </div>
                </div>
            </form>  
        </div>
    </div>
</body>
</html>