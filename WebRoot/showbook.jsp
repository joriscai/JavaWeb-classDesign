<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
    <head>
        <base href="<%=basePath%>">
        <title>图书信息浏览</title>
      	<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
        <link rel="stylesheet" href="css/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/base.css">
        <link rel="stylesheet" href="css/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/layout.css">
        <script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
        <style type="text/css" media="screen">
            
            input.search{
                display: inline-block;
                width: 250px;
            }
        </style>
    </head>
  
    <body>
        <h2 class="title">浏览图书信息</h2>
        <%
        	String[][] bookinfo = (String[][])request.getAttribute("bookinfo");
          	int rownum = Integer.parseInt(request.getAttribute("rownum").toString());
         %>
        <!-- 搜索框部分 -->
        <div class="search-box clearfix">
            <div class="sBtn">
                <input type='text' name='isbn' class="search" placeholder="输入图书的ISBN号/书名/作者"/>
                <button id="search" class="btn btn-success"><i class="fa fa-search"></i></button>    
            </div> 
        </div>
        <!-- 数据表格 -->
        <table border="0" cellpadding="0" cellspacing="0" width="85%">
        <tr class="tTitle">
            <td>ISBN码</td><td>书名</td><td>作者</td><td>出版社</td><td>时间</td><td>价格</td><td>状态</td><td colspan="2">操作</td>
        </tr>
        <%
          	for(int i=0;i<rownum;i++){
          		out.print("<tr><td>"+bookinfo[i][1]+"</td><td>"
          							+bookinfo[i][2]+"</td><td>"
          							+bookinfo[i][3]+"</td><td>"
          							+bookinfo[i][4]+"</td><td>"
          							+bookinfo[i][5]+"</td><td>"
          							+bookinfo[i][6]+"</td><td>"
          							+bookinfo[i][7]+"</td><td>"
                        +"<a href='edit.jsp?isbn="+bookinfo[i][1]+"'>编辑</td><td>"
          							+"<a class='del' data-id='"+bookinfo[i][1]+"'>删除</a></td></tr>");
          	}
         %>
        </table>
        <div class="count">共<span><% out.print(rownum); %></span>条记录</div>
    </body>
</html>

<script type="text/javascript">
    $(function(){
        var isbnNum = $('input[name="isbn"]');
   
        $('#search').click(function(){
            isbnNum.removeClass('border-red');
            if (!isbnNum.val().length) {
                isbnNum.addClass('border-red');
            }else{
                $.ajax({
                    url:'search?',
                    type:"POST",
                    data:{
                      search:isbnNum.val()
                    },
                    success:function(msg){
                        //json数据转为object对象
                    	msg = JSON.parse(msg);
                        if(msg.result==0){
                            alert('没有找到任何数据！');
                        }else{
                            //判断数据是否为空
                            if (jQuery.isEmptyObject(msg)) {
                                return false;
                            }
                            $('.count span').text(msg.result);
                            // 清空表格
                            $('table tr:gt(0)').remove();
                            // 遍历json数据并渲染
                            var str = '<tr>';
                            $.map(msg.data, function(item, index) {
                                var num = 0;
                                $.map(item, function(item, index) {
                                    if (index=='id') {
                                        return true;
                                    };
                                    str+='<td>'+item+'</td>';
                                    if (index=='ISBN') {
                                        num = item;
                                    }
                                });
                                str+='<td><a class="edit" href="edit.jsp?isbn='+num+'">编辑</a></td>'
                                +'<td><a class="del" data-id="'+num+'">删除</a></td></tr>';
                            });
                          
                            $('.tTitle').after(str);
                        }
                    }
                });
            }
        });
    
        // 删除功能
        $('.del').click(function(){
            var isbn = $(this).attr('data-id');
            if (confirm('您确认要删除该图书吗？\nISBN码：'+isbn)) {
                 $.ajax({
                    url:'edit?action=delete',
                    type:"POST",
                    data:{
                      isbn:isbn
                    },
                    success:function(msg){
                        msg = JSON.parse(msg);
                        console.log(msg.result)
                        if (msg.result==1) {
                            alert('删除成功！');
                            location.reload();
                        }else{
                            alert(msg.msg);
                        }
                    }
                });
            }
        });
    })
</script>
