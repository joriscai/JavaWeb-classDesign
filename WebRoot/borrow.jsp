<%@page import="des.SQLhelper"%>
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
    	<link rel="stylesheet" href="css/bootstrap/css/bootstrap.min.css">
    	<link rel="stylesheet" type="text/css" href="css/base.css">
        <link rel="stylesheet" href="css/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/layout.css">
        <script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
        <script src="sweetalert/sweetalert.min.js"></script> 
		<link rel="stylesheet" type="text/css" href="sweetalert/sweetalert.css">
    </head>
  
    <body>
        <h2 class="title">图书借阅</h2>
        <!-- 搜索框部分 -->
        <div class="search-box clearfix">
            <div class="sBtn">
                <input type='text' name='isbn' class="search" placeholder="输入图书的ISBN号"/>
                <button id="search" class="btn btn-info"><i class="fa fa-search"></i></button>    
            </div> 
        </div>
    	<!-- 数据表格 -->
    	<table border="0" cellpadding="0" cellspacing="0" width="80%">
    	<tr class="tTitle"><td>ISBN码</td><td>书名</td><td>作者</td><td>出版社</td><td>出版时间</td><td>价格</td><td>状态</td><td>操作</td></tr>
        <!-- 获得所有数据 -->
    	<%
    		int count = 0;
    	    	    		SQLhelper db = new SQLhelper();
    	    	    		db.link();
    	    	    		try{
    	    	    			db.rs = db.st.executeQuery("select * from bookinfo where state='在库'");
    	    	    		}catch (Exception e) {
    	    	    			e.printStackTrace();
    	    	    		}
    	    	    		while(db.rs.next()){
    	    	    				count++;
    	    		    			String str = "<tr><td>"+db.rs.getString(2)+"</td><td>"
    	    		    						+db.rs.getString(3)+"</td><td>"
    	    		    						+db.rs.getString(4)+"</td><td>"
    	    		    						+db.rs.getString(5)+"</td><td>"
    	    		    						+db.rs.getString(6)+"</td><td>"
    	    		    						+db.rs.getString(7)+"</td><td>"
    	    		    						+db.rs.getString(8)+"</td><td>";
    	    		    			if(db.rs.getString(8).equals("在库")){
    	    		    				str+="<a class='borrow' data-id='"+db.rs.getString(2)+"'>借阅</a></td></tr>";	    			
    	    		    			}
    	    		    			out.print(str);
    	    	    		}
    	%>
    	</table>
    	<div class="count">共<span><% out.print(count); %></span>条在库记录</div>
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
                    url:'borrow?action=search',
                    type:"POST",
                    data:{
                      isbn:isbnNum.val()
                    },
                    success:function(msg){
                        if(msg=='error'){
                            swal( "搜索错误", "没有找到该ISBN码！","error");
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
                                if (index==7) {
                                    item=='已借出'?str+='<td></td>':str+='<td><a class="borrow" data-id="'+msg[1]+'">借阅</a></td>'
                                }
                            });
                            str+='</tr>';
                            $('.tTitle').after(str);
                        }
                    }
                });
            }
        }
        // 借阅功能
        $('.borrow').click(function(){
            var isbn = $(this).attr('data-id');
            swal({   
				title: "您确认要借阅该书吗？",   
				text: "ISBN码："+isbn,
				type: "info",
				showCancelButton: true,
				confirmButtonColor: "#DD6B55",
				confirmButtonText: "确定",
				cancelButtonText: "取消",
				closeOnConfirm: false,
				closeOnCancel: true 
			}, function(isConfirm){
				if (isConfirm) {
	                 $.ajax({
	                    url:'borrow?action=borrow',
	                    type:"POST",
	                    data:{
	                      isbn:isbn
	                    },
	                    success:function(msg){
	                        if(msg=='0'){
	                        	swal("借阅失败", "请重试或联系系统管理员...", "error");
	                        }else{
	                        	swal({
		      						title: "借阅成功！",
		      						text: "正在刷新...",
		      						type: "success",
		      						showConfirmButton: false,
		      						timer: 800
		      					},function(){
				            	    location.reload();
		      					});
	                            
	                        }
	                    }
	                });
	             }
            });

        });
    })
</script>
