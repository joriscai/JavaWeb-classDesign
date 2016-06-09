<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>图书信息编辑</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <h1>图书信息编辑</h1>
    <form action="edit?action=edit" method='post'>
    <table>
    	<tr><td>ISBN号</td><td><input type='text' name='isbn'/></td></tr>
    	<tr><td>书名</td><td><input type='text' name='bookname'/></td></tr>
    	<tr><td>作者名</td><td><input type='text' name='authorname'/></td></tr>
    	<tr><td>出版单位</td><td><input type='text' name='publish'/></td></tr>
    	<tr><td>出版时间</td><td><input type='text' name='time'/></td></tr>
    	<tr><td>价格</td><td><input type='text' name='price'/></td></tr>
    </table>
    <input type="submit" value="提交"/>
    </form>
  </body>
</html>
