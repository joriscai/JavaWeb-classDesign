<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'borrow.jsp' starting page</title>
    
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
    <h1>借阅功能</h1>
    <%
    	HttpSession session1 = request.getSession();
    	out.print(session1.getAttribute("username")+" hello!!");
     %>
    <center>
    	<form action='borrow?action=search' method='post'>
    	<h2>输入所借图书的ISBN号:<input type='text' name='isbn'/><input type='submit' value='查询'/></h2>
    	</form>
    	<table>
    	<tr><td>ISBN码</td><td>书名</td><td>作者</td><td>出版社</td><td>出版时间</td><td>价格</td><td>状态</td></tr>
    	<%
    		String id = request.getParameter("id");
    	if(id.equals("first")){
    	
    	}else{
    		String[][] info = (String[][])request.getAttribute("info");
    		int num = Integer.parseInt(request.getAttribute("num").toString());
    		for(int i=0;i<num;i++){
    			if(info[i][6].equals("在库")){
    				out.print("<tr><td>"+info[i][0]+"</td><td>"+info[i][1]+"</td><td>"+info[i][2]+"</td><td>"+info[i][3]+"</td><td>"+info[i][4]+"</td><td>"+info[i][5]+"</td><td>"+info[i][6]+"</td><td><a href='borrow?action=borrow&isbn="+info[i][0]+"'>借阅</a></td></tr>");
    			}else{
    				out.print("<tr><td>"+info[i][0]+"</td><td>"+info[i][1]+"</td><td>"+info[i][2]+"</td><td>"+info[i][3]+"</td><td>"+info[i][4]+"</td><td>"+info[i][5]+"</td><td>"+info[i][6]+"</td></tr>");
    			}
    			
    		}
    	}
    	 %>
    	</table>
    </center>
  </body>
</html>
