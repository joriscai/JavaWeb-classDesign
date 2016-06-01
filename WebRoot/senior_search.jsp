<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'senior_search.jsp' starting page</title>
    
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
    <h1>高级搜索</h1>
    <%
    	HttpSession session1 = request.getSession();
    	out.print(session1.getAttribute("username")+" hello!!");
     %>
    <center>
    <form action='search?id=bookname' method='post'>
    	书名：<input type='text' name='search'/> 
    	<input type='submit' value='查询'>
    </form>
    <form action='search?id=author' method='post'>
    	作者：<input type='text' name='search'/> 
    	<input type='submit' value='查询'>
    </form>
    <form action='search?id=isbn' method='post'>
    	ISBN：<input type='text' name='search'/> 
    	<input type='submit' value='查询'>
    </form>
    </center>
  </body>
</html>
