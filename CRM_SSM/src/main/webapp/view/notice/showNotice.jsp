<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>公告管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <style>
        td,th{
            text-align: center;
        }
        [class=container-fluid]{
            background-color: white;
        }
        p{
        	display: inline-block;
		  	width: 200px;
			overflow: hidden;/*超出部分隐藏*/
			white-space: nowrap;/*不换行*/
			text-overflow:ellipsis;/*超出部分省略号显示*/
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
            <div class="col-xs-12"><h2>公告管理</h2></div>
        </div>
        <!-- 搜索框 -->
 		<div class="row" style="margin-bottom: 10px;">
			<form class="form-inline col-md-6" autocomplete="off" action="notice">
				<div class="form-group">
					<label>搜索内容：</label> 
					<input type="text" class="form-control" name="keyword" value="${keyword}" placeholder="请输入搜索关键词(公告主题)">
				</div>
				<input type="hidden" name="method" value="show">
				<button type="submit" class="btn btn-default">搜索</button>
			</form>
			<div class="col-md-6">
				<a class="btn btn-primary pull-right" href="dept?method=selectAll&pageNo=${pageBean.pageNo}&keyword=${keyword}">发布公告</a>
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
	                        <th>序号</th>
	                        <th>公告人</th>
	                        <th>公告主题</th>
	                        <th>通知范围</th>
	                        <th>公告内容</th>
	                        <th>公告时间</th>
	                        <th>截止时间</th>
	                        <th>操作</th>
	                    </tr>
                    </thead>
                    <tbody>
	                    <c:forEach items="${pageBean.content}" var="notice">
							<tr>
								<td>${notice.notice_id}</td>
								<td>
									<c:choose>
										<c:when test="${empty notice.updater}">${notice.creater}</c:when>
										<c:otherwise>${notice.updater}</c:otherwise>
									</c:choose>
								</td>
								<td>${notice.subject}</td>
								<td>${notice.receive_id}</td>
								<td><p data-toggle="tooltip" data-placement="right" title="${notice.text}">${notice.text}</p></td>
								<td>${notice.pub_time}</td>
								<td>${notice.expire_time}</td>
								<td>
									<a class="btn btn-link" href="notice?method=selectById&notice_id=${notice.notice_id}&pageNo=${pageBean.pageNo}&keyword=${requestScope.keyword}">
										<span class="glyphicon glyphicon-pencil" style="color: black;" aria-hidden="true"></span>
									</a>
									<a class="btn btn-link" href ="notice?method=delete&notice_id=${notice.notice_id}&pageNo=${pageBean.pageNo}&keyword=${requestScope.keyword}">
										<span class="glyphicon glyphicon-remove" style="color: black;" aria-hidden="true"></span>
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
						<c:when test="${pageBean.totalPage==0}">
							<li class='disabled'><a href='#'>&laquo;</a>
						</c:when>
						<c:when test="${pageBean.pageNo==1}">
							<li class='disabled'><a href='#'>&laquo;</a>
						</c:when>
						<c:otherwise>
							<li><a href="notice?method=show&pageNo=${pageBean.pageNo-1}&keyword=${keyword}">&laquo;</a></li>
						</c:otherwise>
					</c:choose>
					<!-- 补全页码 -->
					<c:forEach begin="1" end="${pageBean.totalPage}" var="i">
						<!-- 判断页面与i是否一致，一致就代表当前页码要高亮显示 -->
						<c:choose>
							<c:when test="${i == pageBean.pageNo}">
								<li class="active"><a href="notice?method=show&pageNo=${i}&keyword=${keyword}">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="notice?method=show&pageNo=${i}&keyword=${keyword}">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<!-- 处理下一页的操作 -->
					<c:choose>
						<c:when test="${pageBean.totalPage==0}">
							<!-- 下一页不可点击 -->
							<li class='disabled'><a href='#'>&raquo;</a>
						</c:when>
						<c:when test="${pageBean.pageNo==pageBean.totalPage}">
							<!-- 下一页不可点击 -->
							<li class='disabled'><a href='#'>&raquo;</a><li>
						</c:when>
						<c:otherwise>
							<li>
							<a href="notice?method=show&pageNo=${pageBean.pageNo+1}&keyword=${keyword}">&raquo;</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
				</nav>
			</div>
		</div>
    </div>
    <script type="text/javascript">
	 	$(function () {
			//激活工具提示
			$('[data-toggle="tooltip"]').tooltip();
		});
	 </script>
</body>
</html>