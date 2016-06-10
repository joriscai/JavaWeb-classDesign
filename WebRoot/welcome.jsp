<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
    <head>
        <base href="<%=basePath%>">
        <title>欢迎页</title>  
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
        <link rel="stylesheet" href="css/bootstrap/css/bootstrap.min.css">
    	<link rel="stylesheet" type="text/css" href="css/base.css">
    	<link rel="stylesheet" type="text/css" href="css/layout.css">
    </head>
    <%
      HttpSession session1 = request.getSession();
      String user= session1.getAttribute("username").toString();
    %>
    <body>
        <h2><%out.print(user); %>用户，欢迎使用图书管理系统！</h2>
    </body>
</html>
