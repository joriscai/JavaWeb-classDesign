<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
    <head>
        <base href="<%=basePath%>">
        <title>添加图书信息</title>
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
        <link rel="stylesheet" href="css/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/base.css">
        <link rel="stylesheet" href="css/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/layout.css">
        <script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
        <script src="sweetalert/sweetalert.min.js"></script> 
		<link rel="stylesheet" type="text/css" href="sweetalert/sweetalert.css">
		<script src="laydate/laydate.js"></script> 
        <style type="text/css" media="screen">
            .form-control{
                display: inline-block;
                width: 65%;
            }
        </style>
    </head>
  
    <body>
        <h2 class="title">添加图书信息</h2>
        <!-- <form action="edit?action=edit" method='post'> -->
        <ul class="edit-list col-md-5">
            <li>
                <label>ISBN号</label>
                <input type='text' class="form-control" name='isbn' placeholder="ISBN号"/>
            </li>
            <li>
                <label>书名</label>
                <input type='text' class="form-control" name='bookname' placeholder="书名"/>
            </li>
            <li>
                <label>作者名</label>
                <input type='text' class="form-control" name='authorname' placeholder="作者名"/>
            </li>
            <li>
                <label>出版单位</label>
                <input type='text' class="form-control" name='publish' placeholder="出版单位"/>
            </li>
            <li>
                <label>出版时间</label>
                <input type='text' class="form-control laydate-icon" id="time" name='time' placeholder="出版时间(如：1995-02-03)"/>
            </li>
            <li>
                <label>价格</label>
                <input type='text' class="form-control" name='price' placeholder="价格"/>
            </li>
            <li>
                <button class="btn btn-success">提交</button>
            </li>
        </ul>
    </body>
</html>
<script type="text/javascript">
    $(function(){
    	var start = {
			elem: '#time',
			format: 'YYYY-MM-DD',
			istoday: true
		};
		laydate(start);
		laydate.skin('danlan'); /*时间控件风格*/
        // 日期检验（未完善）
        function checkDate(d){
            var ds=d.match(/\d+/g);
            var d=new Date(d.replace(/-/g,'/'));
            if (d=='Invalid Date') {
                return false;
            }else{
                return true;
            }
        }
        // 为空检验
      	var emptyVar = function(obj){
      		  obj.each(function() {
                $(this).val().length ? $(this).removeClass('border-red') : $(this).addClass('border-red') ;
            });
      	}
        $('.edit-list input').on('blur',function(){
            emptyVar($(this));
        })
        // 日期输入框失焦检验
        $('#time').on('blur',function(){
            var obj = $(this);
            if (obj.val().length<7){
                obj.addClass('border-red');
            }
            if (!checkDate(obj.val())) {
                obj.addClass('border-red');
            }
        })

        // 提交检验
        $('.btn').click(function(){      	
            emptyVar($('.edit-list input[type="text"]'));
           	var flag = $('.edit-list').has('.border-red').length;
            if (!flag) {
                $.ajax({
                    url:'edit?action=add',
                    type:"POST",
                    data:{
                        isbn:$('input[name="isbn"]').val(),
                        bookname:$('input[name="bookname"]').val(),
                        authorname:$('input[name="authorname"]').val(),
                        publish:$('input[name="publish"]').val(),
                        time:$('input[name="time"]').val(),
                        price:$('input[name="price"]').val()
                    },
                    success:function(msg){
                        msg = JSON.parse(msg);
                        console.log(msg.result)
                        if (msg.result==1) {
                        
                            swal({
	      						title: "添加成功",
	      						text: "正在跳转...",
	      						type: "success",
	      						showConfirmButton: false,
	      						timer: 700
	      					},function(){
			            	    location.href="showbook";
	      					});
                            
                        }else{
                            swal("添加失败", msg.msg, "error");
                        }
                    }
                });
            }
        });
    });
</script>
