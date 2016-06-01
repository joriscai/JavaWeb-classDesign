<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'bookmanager.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <%
    	HttpSession session1 = request.getSession();
    	out.print(session1.getAttribute("username")+" hello!!");
     %>
    <center><h1>图书信息管理系统</h1></center><br/>
    <center><h2><a href='edit.jsp'>图书信息编辑</a></h2></center>
    <center><h2><a href='showbook'>图书信息浏览</a></h2></center>
    <center><h2><a href='search.jsp?id=first'>图书信息查询</a></h2></center>
    <center><h2><a href='borrow.jsp?id=first'>借阅功能</a></h2></center>
    <center><h2><a href='repay.jsp?id=first'>还书功能</a></h2></center>
    <center><h2><a href='remove'>退出系统</a></h2></center>
  </body>
</html>
