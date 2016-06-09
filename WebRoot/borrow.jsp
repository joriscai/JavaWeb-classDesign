<%@page import="des.linksql"%>
<%@page import="com.mysql.jdbc.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>图书借阅</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
	<link rel="stylesheet" type="text/css" href="css/base.css">
	<style type="text/css" media="screen">
        body{
            padding: 0 20px;
        }
        table{
        	border-top:1px solid #ccc;
        	border-left:1px solid #ccc;
        	text-align: center;
        }
        tr:nth-child(odd){
        	background: #eee;
        }
        tr:hover{
        	background: #B5F9EF;
        }
        tr:first-child,.tTitle:hover{
        	background: #ddd;
        }
        td{
            border-bottom: 1px solid #ccc;
            border-right: 1px solid #ccc;
        }
    </style>

  </head>
  
  <body>
    <h2>图书借阅</h2>
    	<form action='borrow?action=search' method='post'>
    	<h2>输入所借图书的ISBN号:<input type='text' name='isbn'/><input type='submit' value='查询'/></h2>
    	</form>
    	<table border="0" cellpadding="0" cellspacing="0" width="80%">
    	<tr class="tTitle"><td>ISBN码</td><td>书名</td><td>作者</td><td>出版社</td><td>出版时间</td><td>价格</td><td>状态</td><td>操作</td></tr>
        <!-- 获得所有数据 -->
    	<%
    		linksql db = new linksql();
    		db.link();
    		try{
    			db.rs1 = db.st.executeQuery("select * from bookinfo");
    		}catch (Exception e) {
    			e.printStackTrace();
    		}
    		while(db.rs1.next()){
	    			out.print("<tr><td>"+db.rs1.getString(2)+"</td><td>"
	    						+db.rs1.getString(3)+"</td><td>"
	    						+db.rs1.getString(4)+"</td><td>"
	    						+db.rs1.getString(5)+"</td><td>"
	    						+db.rs1.getString(6)+"</td><td>"
	    						+db.rs1.getString(7)+"</td><td>"
	    						+db.rs1.getString(8)+"</td><td><a href='borrow?action=borrow&isbn="
	    						+db.rs1.getString(2)+"'>借阅</a></td></tr>");	    			
    		}
    	 %>
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
  </body>
</html>
