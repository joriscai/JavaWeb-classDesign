<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE >
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
	<link rel="stylesheet" href="css/lanrenzhijia.css" media="all">
  <script src="js/jquery.min.js"></script>
  <script>
    $(document).ready(function() {
      $('.theme-login').click(function(){
        $('.theme-popover-mask').fadeIn(100);
        $('.theme-popover').slideDown(200);
      })
      $('.theme-poptit .close').click(function(){
        $('.theme-popover-mask').fadeOut(100);
        $('.theme-popover').slideUp(200);
      })
      $("input[name='submit']").click(function(){
        $.ajax({
          url:'login',
          type:"POST",
          data:{
            username:$("input[name='username']").val(),
            password:$("input[name='password']").val()
          },
          success:function(msg){
            if (msg=='success') {
              top.location.reload();
            }else if(msg=='error'){
              alert('用户名或密码不正确！');
            }else{
              alert(msg);
            }
          }
        });
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
        <li><h4>你必须先登录！</h4></li>
        <li><strong>用户名：</strong><input class="ipt" type="text" name="username" size="20" /></li>
        <li><strong>密码：</strong><input class="ipt" type="password" name="password" size="20" /></li>
        <li><input class="btn btn-primary" type="submit" name="submit" value=" 登 录 " /></li>
      </ol>
    </div>
</div>
</body>
</html>
