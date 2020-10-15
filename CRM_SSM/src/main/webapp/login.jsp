<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登录</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
    <style type="text/css">
        body{
            background-color: #dddddd;
        }
        .login{
            background-color: white;
            padding: 30px 10px 20px 10px;
            border-radius: 10px;
            width: 23%;
            margin-top: 250px;
        }
        .error{
        	color:red
        }
        i{
            position: relative;
            top: -27px;
            left: 90%;
            color: grey;
        }
        i:hover{
            color: black;
            /*属性规定要显示的光标的类型（形状）,
                default 默认光标(通常是一个箭头)
                auto 默认。浏览器设置的光标。
             */
            cursor: default;
        }
        /*清除password密码输入框的明文图标，此伪类仅在ie中有效*/
        input::-ms-reveal{
            display: none;
        }
        /*清除text文本输入框的清除图标，此伪类仅在ie中有效*/
        input::-ms-clear{
            display: none;
        }
    </style>
</head>
<body>
    <div class="center-block login">
        <input type="hidden" id="pageContext" value="${pageContext.request.contextPath}">
        <form autocomplete="off">
            <div class="form-group text-center"><img src="./img/logo.png" alt="智游logo"></div>
            <div class="form-group text-center" style="font-size: 15px;color: #9898a2;">智游客户关系管理系统</div>
            <div class="form-group">
            	<b id="errorMsg" style="color:red"></b>
                <input type="text" class="form-control" id="username" name="username" placeholder="请输入账号">
            </div>
            <div class="form-group">
                <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码">
                <i class="fa fa-eye" aria-hidden="true" style="display:none"></i>
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-danger" style="width: 100%">登录</button>
            </div>
        </form>
    </div>
    <script>
        $(function(){
    		if (self!=top) { 
				window.parent.location.reload();
  			}
            var password = $("#password");
            var eye = $("i");
            var plaintext = false;   //标记点击之前的明文状态
            //为密码框绑定聚焦事件
            password.focus(function(){
                if(password.val() != ""){//用户输入了密码
                    eye.show();
                }
            });
            //为账号框绑定聚焦事件，聚焦时隐藏明文显示图标
            $("#username").focus(function(){
                eye.hide();
            });
            //为密码框绑定change事件：
            password.keyup(function(){
                if(password.val() != ""){//用户输入了密码
                    eye.show();
                }else{//密码输入框还为空字符串
                    eye.hide();
                }
            });
            //为明文显示标记添加点击事件
            eye.click(function(){
                if(plaintext){//如果点击之前密码文本显示明文
                    eye.removeClass().addClass("fa fa-eye");
                    password.prop("type","password");
                    plaintext = false;//记下当前密码框显示状态
                }else{//如果点击之前密码文本显示密文
                    eye.removeClass().addClass("fa fa-eye-slash");
                    password.prop("type","text");
                    plaintext = true;
                }
            });
            $("form").validate({
       	        errorElement:"b",
       	        rules:{
       	        	username:{
       					required:true
       				},
       				password:{
       					required:true,
       				}
       			},
       			messages:{
       	        	username:{
       					required:"用户名不能为空"
       				},
       				password:{
       					required:"密码不能为空",
       				}
       			},
       			//给未通过验证的元素进行处理
       		    highlight: function(element) {
       		        $(element).closest('td').addClass('has-error has-feedback');
       		    },
       	        submitHandler: function (form) {
       	        	var formData = $("form").serialize();
	       	     	$.post($("#pageContext").val()+"/login?method=login", formData, function(data){
		       	 		var jsonObj = eval(data);
		       			if(jsonObj.state == 0){
		       			    //将对应的错误信息回显到label元素
		       				$("#errorMsg").text(jsonObj.error);
		       			}
		       			else{
		       				location.href="view/base.jsp";
		       			}
	       	     	},"json");
       	        }
            });
        });
    </script>
</body>
</html>