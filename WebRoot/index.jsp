<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
	    <base href="<%=basePath%>">
	    <title>图书信息管理系统</title>
		<link rel="stylesheet" href="css/login.css" media="all">
		<link rel="stylesheet" href="css/base.css" media="all">
		<script src="js/jquery.min.js"></script>
		<script src="sweetalert/sweetalert.min.js"></script> 
		<link rel="stylesheet" type="text/css" href="sweetalert/sweetalert.css">
	  	<script type="text/javascript" src="http://api.youziku.com/webfont/FastJS/yzk_2A245E18A11DC95F"></script>
		<style type="text/css" media="screen">
			body{
				background: url(./img/bg.jpg) no-repeat;
				background-size: 100% 115%;
				width: 100%;
				-webkit-animation: myfirst 5s ease-in-out 0s infinite;
				-moz-animation: myfirst 5s ease-in-out 0s infinite;
				-ms-animation: myfirst 5s ease-in-out 0s infinite;
				-o-animation: myfirst 5s ease-in-out 0s infinite;
				animation: myfirst 5s ease-in-out 0s infinite;
				
			}
			nav{
				/*width: 100%;*/
				font-family: "微软雅黑"!important;
    			height: 60px;
    			opacity: 0.6;
    			background: #B5E1F3;
    			position: relative;
			}
			nav a {
				font-family: "微软雅黑"!important;
			}
			nav ul{
				display: flex;
				width: 40%;
				height: 100%;
				float: right;
				margin-right: 50px; 
			}
			nav li{
				line-height: 60px;
				flex: 1;
				text-align: center;
				font-size: 20px;
			}
			nav li a{
				display: block;
				color: white;
				font-family: "微软雅黑"!important;
			}
			nav li a:hover,nav li a.action{
				background: #9AC5E2;
			}
			.inter{
				width: 200px;
				display: inline-block;
				text-align: center;
				line-height: 60px;
			}
			.btn-large{
				background-color: #3E91C1;
				border-radius: 5px;
				color: white;
				font-size: 18px;
				padding: 10px 16px;
			}
			.btn-large:hover{
				color: white;
			}
			.sys-name{
				text-align: center;
				padding-top: 300px;
				font-size: 35px;
				color: #000;
			}
			/*动画函数*/
			@keyframes myfirst
			{
				0%   {background-position: 0px 0px;}
				50%  {background-position: 0px -100px;}
				100% {background-position: 0px 0px;}
			}

			@-moz-keyframes myfirst /* Firefox */
			{
				0%   {background-position: 0px 0px;}
				50%  {background-position: 0px -100px;}
				100% {background-position: 0px 0px;}
			}

			@-webkit-keyframes myfirst /* Safari and Chrome */
			{
				0%   {background-position: 0px 0px;}
				50%  {background-position: 0px -100px;}
				100% {background-position: 0px 0px;}
			}

			@-o-keyframes myfirst /* Opera */
			{
				0%   {background-position: 0px 0px;}
				50%  {background-position: 0px -100px;}
				100% {background-position: 0px 0px;}
			}
		</style>
	</head>
  
  	<body>
	  	<%
		    HttpSession session1 = request.getSession();
		    if(session1.getAttribute("username")!=null){
		    	response.sendRedirect("bookmanager.jsp");
		    }
	   	%>
	   	<nav>
	   		<ul>
	   			<li><a href="" title="" class="action">首页</a></li>
	   			<li><a href="" title="">首页1</a></li>
	   			<li><a href="" title="">首页2</a></li>
	   		</ul>
	   		<div class="inter">
	  			<a class="btn-large theme-login" >登&nbsp;&nbsp;录</a>	
	   		</div>
	   	</nav>
	   	<div class="sys-name">
	   		<h2>图书信息管理系统</h2>
	   	</div>
	    <div class="theme-popover">
		    <div class="theme-poptit">
		        <a  title="关闭" class="close">×</a>
		        <h3>登录 </h3>
		    </div>
		    <div class="theme-popbod dform">
		       	<ol>
		          	<li>
		          		<label>用户名：</label>
		          		<input class="ipt" type="text" name="username" size="20" />
		          	</li>
		          	<li>
		          		<label>密码：</label>
		          		<input class="ipt" type="password" name="password" size="20" />
		          	</li>
		          	<li>
		          		<input class="btn btn-primary" type="submit" name="submit" value=" 登 录 " />
		          	</li>
		        </ol>
		    </div>
	  	</div>
	  	<script type="text/javascript">
			$youziku.load(".sys-name", "6c4ec6a410c04c88afc9555f38d9c795", "JetLinkMediumOldStamp"); 
			//$youziku.load("nav a", "96c35e80c2394a13ac885ca55bbd3167", "jdzhonyuanjian"); 
		    $youziku.draw();  
		</script>
  	</body>
</html>

<script>
	$(document).ready(function() {
		var clientH = $(window).height();
		$('body').height(clientH);
		var uname = $("input[name='username']"),
		pwd = $("input[name='password']");
		$('.theme-login').click(function(){
			$('.theme-popover-mask').fadeIn(100);
			$('.theme-popover').slideDown(200);
		})
		$('.theme-poptit .close').click(function(){
			$('.theme-popover-mask').fadeOut(100);
			$('.theme-popover').slideUp(200);
		})
	    //监听回车键
	    pwd.keydown(function(e){
	      	if (e.keyCode==13) {
	      		$("input[name='submit']").trigger('click');
	      	}
	    })
	    //提交事件
	    $("input[name='submit']").click(function(){
	      	uname.removeClass('border-red');
	      	pwd.removeClass('border-red');
	      	if (!uname.val().length) {
	      		uname.addClass('border-red');
	      	}else if (!pwd.val().length) {
	      		pwd.addClass('border-red');
	      	}else{
	      		$.ajax({
	      			url:'login',
	      			type:"POST",
	      			data:{
	      				username:uname.val(),
	      				password:pwd.val()
	      			},
	      			success:function(msg){
	      				if (msg=='success') {
	      					swal({
	      						title: "登录成功",
	      						text: "正在跳转...",
	      						type: "success",
	      						showConfirmButton: false,
	      						timer: 850
	      					},function(){
			            	    location.href="bookmanager.jsp";
	      					});
			            }else if(msg=='error'){
			            	swal(msg, "帐号或密码错误！", "error");
			            }else{
			            	swal("error", msg, "error");
			            }
			        }
			    });
	      	}
	    });
	})
</script>