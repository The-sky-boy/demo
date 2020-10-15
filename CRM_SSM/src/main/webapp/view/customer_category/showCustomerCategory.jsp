<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>分类列表</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
    <style>
        td,th{
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
            <div class="col-xs-12"><h2>客户分类</h2></div>
        </div>
        <!-- 搜索框 -->
		<div class="row" style="margin-bottom: 10px;">
			<form class="form-inline col-md-6" autocomplete="off" action="category">
				<input type="hidden" name="method" value="show">
				<div class="form-group">
					<label>搜索内容：</label> 
					<input type="text" class="form-control" name="keyword" value="${keyword}" placeholder="请输入搜索关键词">
				</div>
				<div class="form-group">
                    <label>搜索字段：</label>
                    <select name="colName" class="form-control">
                        <option value="customer_category_name" <c:if test="${colName=='customer_category_name'}">selected</c:if>>分类名称</option>
                        <option value="customer_category_desc" <c:if test="${colName=='customer_category_desc'}">selected</c:if>>分类描述</option>
                    </select>
                </div>
				<button type="submit" class="btn btn-default">搜索</button>
			</form>
			<div class="col-md-6">
				<a class="btn btn-primary pull-right" href="view/customer_category/addCustomerCategory.jsp?pageNo=${pageBean.pageNo}&keyword=${keyword}&colName=${colName}">添加分类</a>
			</div>
		</div>
        <!-- 数据表格 -->
        <div class="row">
            <div class="col-xs-12">
            <c:choose>
				<c:when test="${not empty pageBean.content}">
                <table class="table table-bordered">
                    <thead>
	                    <tr>
	                        <th>客户分类ID</th>
	                        <th>分类名称</th>
	                        <th>分类描述</th>
	                        <th>修改时间</th>
	                        <th>操作</th>
	                    </tr>
                    </thead>
                    <tbody>
                    	<c:forEach items="${pageBean.content}" var="category">
							<tr>
								<td>${category.customer_category_id}</td>
								<td>${category.customer_category_name}</td>
								<td>${category.customer_category_desc}</td>
								<td>${category.update_time}</td>
								<td>
									<a class="btn btn-link" href="category?method=selectById&customer_category_id=${category.customer_category_id}&pageNo=${pageBean.pageNo}&keyword=${keyword}&colName=${colName}">
										<span class="glyphicon glyphicon-pencil" style="color: black;" aria-hidden="true"></span>
									</a>
									<a class="btn btn-link" href ="category?method=delete&customer_category_id=${category.customer_category_id}&pageNo=${pageBean.pageNo}&keyword=${keyword}&colName=${colName}">
										<span class="glyphicon glyphicon-remove" style="color: black;"
											aria-hidden="true"></span>
									</a>
								</td>
							</tr>
						</c:forEach>
                    </tbody>
                </table>
                </c:when>
				<c:otherwise>
					<h1>目前暂无符合条件的数据！</h1>
				</c:otherwise>
			</c:choose>
            </div>
        </div>
        <!-- 底部换页 -->
        <div class="row">
			<div class="col-md-6">
				<strong>共有${pageBean.totalCount}条数据,第
					<c:choose>
						<c:when test="${pageBean.totalCount==0}">0</c:when>
						<c:otherwise>${pageBean.pageNo}</c:otherwise>
					</c:choose>
					/${pageBean.totalPage}页
				</strong>
			</div>
			<!-- 分页条 -->
			<div class="col-md-6" style="text-align: right;">
				<!-- 当前页码为1，则其前一页不可点击 -->
				<nav aria-label="Page navigation">
				<ul class="pagination">
					<!-- 处理上一页的操作 -->
					<c:choose>
						<c:when test="${pageBean.pageNo==1}">
							<li class='disabled'><a href='#'>&laquo;</a>
						</c:when>
						<c:when test="${pageBean.totalPage==0}">
							<li class='disabled'><a href='#'>&laquo;</a>
						</c:when>
						<c:otherwise>
							<li><a href="category?method=show&pageNo=${pageBean.pageNo-1}&keyword=${keyword}&colName=${colName}">&laquo;</a></li>
						</c:otherwise>
					</c:choose>
					<!-- 补全页码 -->
					<c:forEach begin="1" end="${pageBean.totalPage}" var="i">
						<!-- 判断页面与i是否一致，一致就代表当前页码要高亮显示 -->
						<c:choose>
							<c:when test="${i == pageBean.pageNo}">
								<li class="active"><a href="category?method=show&pageNo=${i}&keyword=${keyword}&colName=${colName}">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="category?method=show&pageNo=${i}&keyword=${keyword}&colName=${colName}">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<!-- 处理下一页的操作 -->
					<c:choose>
						<c:when test="${pageBean.pageNo==pageBean.totalPage}">
							<!-- 下一页不可点击 -->
							<li class='disabled'><a href='#'>&raquo;</a><li>
						</c:when>
						<c:when test="${pageBean.totalPage==0}">
							<li class='disabled'><a href='#'>&raquo;</a>
						</c:when>
						<c:otherwise>
							<li>
							<a href="category?method=show&pageNo=${pageBean.pageNo+1}&keyword=${keyword}&colName=${colName}">&raquo;</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
				</nav>
			</div>
		</div>
    </div>
</body>
</html>