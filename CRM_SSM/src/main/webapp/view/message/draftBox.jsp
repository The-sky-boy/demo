<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>草稿箱</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
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
            <div class="col-xs-12"><h2>草稿箱</h2></div>
        </div>
        <!-- 搜索框 -->
		<div class="row" style="margin-bottom: 10px;">
			<form class="form-inline col-md-12" autocomplete="off" action="message">
				<input type="hidden" name="method" value="draftBox">
				<div class="form-group">
					<label>搜索内容：</label> 
					<input type="text" class="form-control" name="keyword" value="${keyword}" placeholder="请输入搜索关键词">
				</div>
				<div class="form-group">
                    <label>搜索字段：</label>
                    <select name="colName" class="form-control">
                        <option value="subject" <c:if test="${colName=='subject'}">selected</c:if>>邮件主题</option>
                        <option value="content" <c:if test="${colName=='content'}">selected</c:if>>邮件内容</option>
                    </select>
                </div>
				<button type="submit" class="btn btn-default">搜索</button>
			</form>
		</div>
        <!-- 数据表格 -->
        <div class="row">
            <div class="col-xs-12">
            <c:choose>
				<c:when test="${not empty pageBean.content}">
                <table class="table table-hover table-condensed">
                    <thead>
	                    <tr>
	                        <th>邮件ID</th>
	                        <th>邮件主题</th>
	                        <th>邮件内容</th>
	                        <th>发送时间</th>
	                        <th>操作</th>
	                    </tr>
                    </thead>
                    <tbody>
                    	<c:forEach items="${pageBean.content}" var="message">
							<tr>
								<td>${message.message_id}</td>
								<td>${message.subject}</td>
								<td><p data-toggle="tooltip" data-placement="right" title="${message.content}">${message.content}</p></td>
								<td>${message.save_time}</td>
								<td>
									<a class="btn btn-link" href ="message?method=selectDraftById&message_id=${message.message_id}
									&pageNo=${pageBean.pageNo}&keyword=${keyword}&colName=${colName}"
									 data-toggle="tooltip" data-placement="left" title="编辑">
										<i class="fa fa-pencil-square-o" aria-hidden="true" style="color: black;"></i>
									</a>
									<a class="btn btn-link" href ="message?method=draftDeleteToDustBox&message_id=${message.message_id}&pageNo=${pageBean.pageNo}&keyword=${keyword}&colName=${colName}"
									 data-toggle="tooltip" data-placement="top" title="删除">
										<i class="fa fa-trash" style="color: black;"
											aria-hidden="true"></i>
									</a>
									<a class="btn btn-link" href ="message?method=draftDeleteShift&message_id=${message.message_id}
									&pageNo=${pageBean.pageNo}&keyword=${keyword}&colName=${colName}&sender=${message.sender}"
									data-toggle="tooltip" data-placement="right" title="彻底删除">
										<i class="fa fa-times" style="color: black;"
											aria-hidden="true"></i>
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
							<li><a href="message?method=draftBox&pageNo=${pageBean.pageNo-1}&keyword=${keyword}&colName=${colName}">&laquo;</a></li>
						</c:otherwise>
					</c:choose>
					<!-- 补全页码 -->
					<c:forEach begin="1" end="${pageBean.totalPage}" var="i">
						<!-- 判断页面与i是否一致，一致就代表当前页码要高亮显示 -->
						<c:choose>
							<c:when test="${i == pageBean.pageNo}">
								<li class="active"><a href="message?method=draftBox&pageNo=${i}&keyword=${keyword}&colName=${colName}">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="message?method=draftBox&pageNo=${i}&keyword=${keyword}&colName=${colName}">${i}</a></li>
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
							<a href="message?method=draftBox&pageNo=${pageBean.pageNo+1}&keyword=${keyword}&colName=${colName}">&raquo;</a></li>
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
		$('[data-toggle="tooltip"]').tooltip()
		})
	</script>
</body>
</html>