<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'search.jsp' starting page</title>
    
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
    <h1>图书信息查询</h1>
    <%
    	HttpSession session1 = request.getSession();
    	out.print(session1.getAttribute("username")+" hello!!");
     %>
    <center>
    <form action='search?id=bookname' method='post'>
    	<input type='text' name='search'/> 
    	<input type='submit' value='查询'>
    	<a href='senior_search.jsp'>高级搜索</a>
    </form>
    <table>
    <tr><td>ISBN码</td><td>书名</td><td>作者</td><td>出版社</td><td>出版时间</td><td>价格</td></tr>
    <%
    	String id = request.getParameter("id");
    	if(id.equals("first")){
    	
    	}else if(id.equals("null")){
    		out.print("<font color='red'>无记录！</font");
    	}else{
    		int num = Integer.parseInt(request.getAttribute("num").toString());
    		String[][] info = (String[][])request.getAttribute("info");
    		for(int i=0;i<num;i++){
    			out.print("<tr><td>"+info[i][0]+"</td><td>"+info[i][1]+"</td><td>"+info[i][2]+"</td><td>"+info[i][3]+"</td><td>"+info[i][4]+"</td><td>"+info[i][5]+"</td><td>"+info[i][6]+"</td></tr>");
    		}
    	}
     %>
     </table>
     </center>
  </body>
</html>
