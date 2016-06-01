<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'showbook.jsp' starting page</title>
    
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
    <h1>浏览图书信息</h1>
    <%
    	HttpSession session1 = request.getSession();
    	out.print(session1.getAttribute("username")+" hello!!");
     %>
    <table>
    <%
    	String[][] bookinfo = (String[][])request.getAttribute("bookinfo");
    	int rownum = Integer.parseInt(request.getAttribute("rownum").toString());
    	out.print("<tr><td>ISBN码</td><td>书名</td><td>作者</td><td>出版社</td><td>时间</td><td>I价格</td><td>状态</td></tr>");
    	for(int i=0;i<rownum;i++){
    		out.print("<tr><td>"+bookinfo[i][0]+"</td><td>"+bookinfo[i][1]+"</td><td>"+bookinfo[i][2]+"</td><td>"+bookinfo[i][3]+"</td><td>"+bookinfo[i][4]+"</td><td>"+bookinfo[i][5]+"</td><td>"+bookinfo[i][6]+"</td><td><a href='edit?action=delete&isbn="+bookinfo[i][0]+"'>删除</td></tr>");
    	}
     %>
     </table>
  </body>
</html>
