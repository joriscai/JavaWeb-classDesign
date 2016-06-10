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
            .count{
                margin: 10px 0 0 20px;
                float: left;
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
            <div class="count">共<% out.print(rownum); %>条记录</div>
            <div class="sBtn">
                <input type='text' name='isbn' class="search" placeholder="输入图书的ISBN号"/>
                <button id="search" class="btn btn-info"><i class="fa fa-search"></i></button>    
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
    </body>
</html>

<script type="text/javascript">
    $(function(){
        var isbnNum = $('input[name="isbn"]');
        //搜索按钮动画
        $('.btn-info').click(function(){
            isbnNum.fadeIn('slow');
            $(this).addClass('btn-success').removeClass('btn-info').unbind('click');    
            $('.btn-success').on('click',searchFun);
        });
        
        //搜索提交
        var searchFun = function(){
            isbnNum.removeClass('border-red');
            if (!isbnNum.val().length) {
                isbnNum.addClass('border-red');
            }else{
                $.ajax({
                    url:'repay?action=search',
                    type:"POST",
                    data:{
                      isbn:isbnNum.val()
                    },
                    success:function(msg){
                        if(msg=='error'){
                            alert('没有找到该ISBN码！');
                        }else{
                            //json数据转为object对象
                            msg = JSON.parse(msg);
                            //判断数据是否为空
                            if (jQuery.isEmptyObject(msg)) {
                                return false;
                            }
                            // 清空表格
                            $('table tr:gt(0)').remove();
                            // 遍历json数据并渲染
                            var str = '<tr>';
                            $.map(msg, function(item, index) {
                                // console.log(item+"+++"+index)
                                if (index>0) {
                                    str+='<td>'+item+'</td>';
                                }
                            });
                            str+='<td><a class="edit" href="edit.jsp?isbn="'+msg[1]+'">编辑</a></td>'
                                +'<td><a class="del" data-id="'+msg[1]+'">删除</a></td></tr>';
                            $('.tTitle').after(str);
                        }
                    }
                });
            }
        }
        // 编辑功能
        // $('.edit').click(function(){
        //     var isbn = $(this).attr('data-id');
        //     if (confirm('您确认要归还该书吗？\nISBN码：'+isbn)) {
        //          $.ajax({
        //             url:'repay?action=repay',
        //             type:"POST",
        //             data:{
        //               isbn:isbn
        //             },
        //             success:function(msg){
        //                 if(msg=='0'){
        //                     alert('归还失败，请重试！');
        //                 }else{
        //                     alert('归还成功！');
        //                     location.reload();
        //                 }
        //             }
        //         });
        //     }
        // });
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
