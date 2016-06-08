<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="css/login.css" media="all">
  <style type="text/css" media="screen">
    .red{
      border: 1px solid red; 
    }
  </style>
  <script src="js/jquery.min.js"></script>
  <script>
    $(document).ready(function() {
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
        uname.removeClass('red');
        pwd.removeClass('red');
        if (!uname.val().length) {
          uname.addClass('red');
        }else if (!pwd.val().length) {
          pwd.addClass('red');
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
                //top.location.reload();
                location.href="bookmanager.jsp";
              }else if(msg=='error'){
                alert('用户名或密码不正确！');
              }else{
                alert(msg);
              }
            }
          });
        }
        
      });
    })
  </script>
  </head>
  
  <body>
  <%
    	HttpSession session1 = request.getSession();
    	if(session1.getAttribute("username")!=null){
    		response.sendRedirect("bookmanager.jsp");
    	}
     %>
    <center><h1>图书信息管理系统</h1></center><br/>
    <h3><center><a class="btn-large theme-login" href="javascript:;">登录入口</a></center></h3>
    <div class="theme-popover">
      <div class="theme-poptit">
            <a href="javascript:;" title="关闭" class="close">×</a>
            <h3>登录 </h3>
      </div>
      <div class="theme-popbod dform">
        <ol>
          <li><label>用户名：</label><input class="ipt" type="text" name="username" size="20" /></li>
          <li><label>密码：</label><input class="ipt" type="password" name="password" size="20" /></li>
          <li><input class="btn btn-primary" type="submit" name="submit" value=" 登 录 " /></li>
        </ol>
      </div>
  </div>
  </body>
</html>
