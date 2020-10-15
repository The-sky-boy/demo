<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>智游客户关系管理系统</title>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/jquery-confirm.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-confirm.js"></script>
    <script src="${pageContext.request.contextPath}/js/confirm.js"></script>
    <style type="text/css">
        /* 导航条 */
        .nav-diy{
            background-color: #3c8dbc;
        }
        /* 一级菜单样式 */
        .menu-first{
            margin-top: -10px;
            background-color: #2c2c2c;
            height: 885px;
            padding: 0;
        }
        /* 二级菜单样式 */
        .menu-second{
            background-color: #2c2c2c;
            width: 100%;
        }
        /* 一级按钮样式 */
        .menu-firstbutton{
            background-color: #2c2c2c;
            color: white;
            border: none;
            height: 50px;
            width: 100%;
            text-align: left;
            outline: none;
        }
        /* 二级按钮样式 */
        .menu-secondbutton{
            background-color: rgba(44, 59, 65, 0.5);
            color: white;
            border: none;
            height: 50px;
            width: 100%;
            text-align: left;
            outline: none;
        }
        button:hover{
            background-color: black;
            color: white;
        }
        button:visited{
            outline: none;
        }
        .loading{
            text-align: center;
            position: relative;
            top: -500px;
        }
        iframe{
            width: 100%;
            height: 820px;
            border: none;
        }
    </style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
            <!-- 顶部导航条 -->
			<nav class="navbar navbar-default nav-diy">
				<div class="container-fluid">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
						</button>
						<a class="navbar-brand" style="color: white;" href="#"><strong>智游客户关系管理系统</strong></a>
					</div>

					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
							<li><a href="#" style="color: white;">工作台</a></li>
                            <li><a href="#" style="color: white;">报表</a></li>
                            <li><a href="#" style="color: white;">客户信息</a></li>
							<li><a href="#" style="color: white;">公告信息</a></li>
                            <li><a href="#" style="color: white;">工作台</a></li>
                            <li><a href="#" style="color: white;">报表</a></li>
                            <li><a href="#" style="color: white;">发件箱</a></li>
                        </ul>

						<ul class="nav navbar-nav navbar-right">
							<li>
								<a style="color:white" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${USER.username}</a>
								<ul class="dropdown-menu">
						            <li><a href="${pageContext.request.contextPath}/user?method=getDept" target="main_ifm">个人信息</a></li>
						            <li><a href="${pageContext.request.contextPath}/view/changePswd.jsp" target="main_ifm">修改密码</a></li>
						       	</ul>
							</li>
							<li><a href="${pageContext.request.contextPath}/user?method=exit" style="color: white;">退出</a></li>
                        </ul>
					</div>
				</div>
			</nav>
        </div>
        <div class="row" style="margin-top: -10px;">
            <!-- 左侧菜单栏 -->
            <div class="col-xs-2 menu-first">
                <button class="menu-firstbutton" onclick="divOn(this,'customer')">
                    <i class="fa fa-users" aria-hidden="true"></i>&nbsp;客户管理
                </button>
                <div id="customer" class="menu-second" hidden="hidden">
                    <button class="menu-secondbutton" onclick="change(this,'showUser')">
                        &emsp;<i class="fa fa-star-o" aria-hidden="true"></i>&nbsp;客户信息
                    </button>
                    <button class="menu-secondbutton" onclick="change(this,'${pageContext.request.contextPath}/care?method=show')">
                        &emsp;<i class="fa fa-star-o" aria-hidden="true"></i>&nbsp;客户关怀
                    </button>
                    <button class="menu-secondbutton" onclick="change(this,'${pageContext.request.contextPath}/category?method=show')">
                        &emsp;<i class="fa fa-star-o" aria-hidden="true"></i>&nbsp;客户分类
                    </button>
                    <button class="menu-secondbutton" onclick="change(this,'${pageContext.request.contextPath}/state?method=show')">
                        &emsp;<i class="fa fa-star-o" aria-hidden="true"></i>&nbsp;客户状态
                    </button>
                    <button class="menu-secondbutton" onclick="change(this,'${pageContext.request.contextPath}/source?method=show')">
                        &emsp;<i class="fa fa-star-o" aria-hidden="true"></i>&nbsp;客户来源
                    </button>
                    <button class="menu-secondbutton" onclick="change(this,'${pageContext.request.contextPath}/link?method=show')">
                        &emsp;<i class="fa fa-star-o" aria-hidden="true"></i>&nbsp;客户联系人
                    </button>
                    <button class="menu-secondbutton" onclick="change(this,'${pageContext.request.contextPath}/record?method=show')">
                        &emsp;<i class="fa fa-star-o" aria-hidden="true"></i>&nbsp;客户联系记录
                    </button>
                </div>
                <button class="menu-firstbutton" onclick="divOn(this,'inside')">
                    <i class="fa fa-file" aria-hidden="true"></i>&nbsp;内部信息
                </button>
                <div id="inside" class="menu-second" hidden="hidden">
                    <button class="menu-secondbutton" onclick="change(this,'${pageContext.request.contextPath}/notice?method=showInfo')">
                        &emsp;<i class="fa fa-star-o" aria-hidden="true"></i>&nbsp;通知公告
                    </button>
                    <button class="menu-secondbutton" onclick="change(this,'${pageContext.request.contextPath}/user?method=showInfo')">
                        &emsp;<i class="fa fa-star-o" aria-hidden="true"></i>&nbsp;员工信息
                    </button>
                    <button class="menu-secondbutton" onclick="change(this,'${pageContext.request.contextPath}/dept?method=showInfo')">
                        &emsp;<i class="fa fa-star-o" aria-hidden="true"></i>&nbsp;部门信息
                    </button>
                </div>
                <button class="menu-firstbutton" onclick="divOn(this,'iemail')">
                    <i class="fa fa-envelope" aria-hidden="true"></i>&nbsp;站内邮件
                </button>
                <div id="iemail" class="menu-second" hidden="hidden">
                    <button id="write" class="menu-secondbutton" onclick="change(this,'${pageContext.request.contextPath}/message?method=selectBox')">
                        &emsp;<i class="fa fa-star-o" aria-hidden="true"></i>&nbsp;写邮件
                    </button>
                    <button id="receiveBox" class="menu-secondbutton" onclick="change(this,'${pageContext.request.contextPath}/message?method=receiveBox')">
                        &emsp;<i class="fa fa-star-o" aria-hidden="true"></i>&nbsp;收邮件
                    </button>
                    <button id="sendBox" class="menu-secondbutton" onclick="change(this,'${pageContext.request.contextPath}/message?method=sendBox')">
                        &emsp;<i class="fa fa-star-o" aria-hidden="true"></i>&nbsp;发件箱
                    </button>
                    <button id="draftBox" class="menu-secondbutton" onclick="change(this,'${pageContext.request.contextPath}/message?method=draftBox')">
                        &emsp;<i class="fa fa-star-o" aria-hidden="true"></i>&nbsp;草稿箱
                    </button>
                    <button id="dustBox" class="menu-secondbutton" onclick="change(this,'${pageContext.request.contextPath}/message?method=dustBox')">
                        &emsp;<i class="fa fa-star-o" aria-hidden="true"></i>&nbsp;垃圾箱
                    </button>
                </div>
                <button class="menu-firstbutton" onclick="divOn(this,'admin')">
                    <i class="fa fa-user-circle-o" aria-hidden="true"></i>&nbsp;管理员
                </button>
                <div id="admin" class="menu-second" hidden="hidden">
                    <button class="menu-secondbutton" onclick="change(this,'${pageContext.request.contextPath}/notice?method=show')">
                        &emsp;<i class="fa fa-star-o" aria-hidden="true"></i>&nbsp;公告管理
                    </button>
                    <button class="menu-secondbutton" onclick="change(this,'${pageContext.request.contextPath}/dept?method=show')">
                        &emsp;<i class="fa fa-star-o" aria-hidden="true"></i>&nbsp;部门管理
                    </button>
                    <button class="menu-secondbutton" onclick="change(this,'${pageContext.request.contextPath}/role?method=show')">
                        &emsp;<i class="fa fa-star-o" aria-hidden="true"></i>&nbsp;角色管理
                    </button>
                    <button class="menu-secondbutton" onclick="change(this,'user/showUser.jsp')">
                        &emsp;<i class="fa fa-star-o" aria-hidden="true"></i>&nbsp;用户管理
                    </button>
            	</div>
            </div>
            <!-- right -->
            <div class="col-xs-10" style="margin-top:-10px">
                <!-- iframe -->
                <div class="row">
                    <iframe name="main_ifm" id="myFrame" src="${pageContext.request.contextPath}/view/welcome.jsp"></iframe>
                </div>
                <!-- foot -->
                <div class="row" style="margin-top: 15px">
                    <div class="col-xs-4 col-md-offset-4" style="color: #9898a2;">
                        	智游教育 &reg; 2017 河南智游臻龙教育科技有限公司
                    </div>
                </div>
            </div>
        </div>

    </div>

    <script type="text/JavaScript">
        let first = null;//记录上次点击的按钮对应的div
        let firstBtn = null;//记录上次点击的按钮(第一级)
        let second = null;//记录上次点击的按钮(第二级)
        //一级按钮点击事件，展开二级菜单
        function divOn(btn,div){
            $(btn).attr("style", "border-left:5px solid #f39c12;background-color:black");
            $(firstBtn).attr("style", "border-left:none;background-color:#2c2c2c");
            if (first == div) {         
                $("#"+div).slideToggle();
                first = null;
                firstBtn = null;
                return;
            }
            if (first != null) {//代表不是第一次点击
                $("#"+first).slideToggle();
            }
            $("#"+div).slideToggle();
            first = div;   
            firstBtn = btn;
           
        }
        //二级按钮点击时间，更换iframe中的页面
        function change(btn,url){
            if(second == btn){//如果上次点击的按钮于本次一致
                $("#myFrame").attr('src',url);
            	return;
            }
            //移除上一次被点击按钮的原有样式
            $(second).children().removeClass();
            //上一次被点击按钮的样式改为未点击
            $(second).children().addClass("fa fa-star-o");
            $(btn).children().removeClass();
            $(btn).children().addClass("fa fa-star");
            $("#myFrame").attr('src',url);
            second = btn;
        }
    </script>
</body>
</html>