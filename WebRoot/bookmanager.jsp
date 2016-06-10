<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>图书信息管理系统</title>
    <link rel="stylesheet" type="text/css" href="css/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/base.css">
    <script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <style type="text/css" media="screen">
    a, a:visited{
      color: blue;
    }
    .top{
      	background: #191e23;
        padding: 10px;
        max-width: 100%;
    }
    .top h2{
    	margin: 0px;
    	color: white;	
     	font-weight: 400;
      display: inline-block;
    }
    .top .wel{
      float: right;
      color: white; 
    	display: inline-block;
      font-size: 16px;
    }
    .wel ul{
      display: flex;
      height: 30px;
      line-height: 30px;
    }
    .wel li{
      text-align: center;
      padding: 0 20px;
      border-right: 1px solid black;
    }
    .wel li:hover{
      background: black;
    }
    .text-color{
    	color: white;
    }
    /*导航栏*/
    #nav{
      height: 100%;
      float: left;
      background: #f7f7f7;
      width: 195px;
      text-align: center;
      font-size: 18px;
      border-right: 1px solid #dae3e9; 
    }
    #nav ul{
      padding: 20px;
      padding-top: 100px; 
    }
    #nav li{
      border-bottom: 1px solid #dae1e8; 
      padding: 0;
      position: relative;
    }
    #nav a{
      color: rgb(110, 130, 155);
      display: block;
      padding: 15px 0;
    }
    #nav a:hover,#nav .active{
      color: black;
      font-weight: 500;
    }
    iframe{
      border: 0px;
    }
    .content{
      background: white;
    }
    /*
    
     */
    .pointer {
        position: absolute;
        right: 0px;
        top: 20px;
        display: none;
    }
    .pointer .arrow, .pointer .arrow_border {
        border-color: transparent #fff transparent transparent;
        border-width: 11px;
        border-style: solid;
        font-size: 0;
        left: 50%;
        line-height: 0;
        margin: 0 auto;
        position: absolute;
        top: 0;
        width: 0;
        z-index: 1002;
        left: 0;
        margin-left: 45%;
    }
    .pointer .arrow_border {
        border-color: transparent rgb(192, 210, 221) transparent transparent;
        border-width: 11px;
        margin-left: -1px;
        border-style: solid;
        z-index: 1001;
        top: 0px;
    }
    a:hover{
      cursor: pointer;
    }
  </style>

  </head>
  
  <body>
  <!-- 头部 -->
  	<div class="top">
     <a href="#"><h2>图书信息管理系统</h2></a>
      <div class='wel'>
      	<ul>
          <li>
            <%
              HttpSession session1 = request.getSession();
              out.print(""+session1.getAttribute("username"));
             %>
          </li>
          <li class="logout"><a title="退出"><i class="fa fa-sign-out text-color"></i></a></li>
        </ul>
	      
       </div>
    </div>
    <!-- 左侧导航栏 -->
    <nav id="nav">
      <ul>
        <li>
          <a href='welcome.jsp' title="首页" class="active" target="bodyframe">首&nbsp;&nbsp;&nbsp;页</a>
          <div class="pointer" style="display:block">
              <div class="arrow"></div>
              <div class="arrow_border"></div>
          </div>
        </li>
        <li>
          <a href='add.jsp' title="添加图书" target="bodyframe">添加图书</a>
          <div class="pointer">
              <div class="arrow"></div>
              <div class="arrow_border"></div>
          </div>
        </li>
        <li>
          <a href='showbook' title="图书信息浏览" target="bodyframe">图书浏览</a>
          <div class="pointer">
              <div class="arrow"></div>
              <div class="arrow_border"></div>
          </div>
        </li>
    <!--     <li>
          <a href='search.jsp?id=first' title="图书信息查询" target="bodyframe">图书信息查询</a>
          <div class="pointer">
              <div class="arrow"></div>
              <div class="arrow_border"></div>
          </div>
        </li> -->
        <li>
          <a href='borrow.jsp?id=first' title="图书借阅" target="bodyframe">图书借阅</a>
          <div class="pointer">
              <div class="arrow"></div>
              <div class="arrow_border"></div>
          </div>
        </li>
        <li>
          <a href='repay.jsp?id=first' title="图书归还" target="bodyframe">图书归还</a>
          <div class="pointer">
              <div class="arrow"></div>
              <div class="arrow_border"></div>
          </div>
        </li>
        <li class="logout">
          <a title="退出系统">退出系统</a>
          <div class="pointer">
              <div class="arrow"></div>
              <div class="arrow_border"></div>
          </div>
        </li>
      </ul>
    </nav>
    <!-- 浮动框架 -->
    <div class="content">
      <iframe src='welcome.jsp' id="bodyframe" name="bodyframe" ></iframe>      
    </div>
  </body>
</html>
<script type="text/javascript">
  $(function(){
    //浮动框架、导航高度
    var clientH = $(window).height(),
        clientW = $(window).width();
    $('#nav').height(clientH-50);
    $('iframe').css({
      height:clientH-54,
      width:clientW-220
    });
    //导航栏效果
    $('#nav li').click(function(){
      $('#nav .pointer').hide();
      $(this).children('.pointer').show();
      // console.log($(this).children('a').siblings('a'));
      $('#nav a').removeClass('active');
      $(this).children('a').addClass('active');
    });
    //退出确认
    $('.logout').click(function(){
      if (confirm('您确认退出系统吗？')) {
        top.location.href='logout';
      }
    })
  })
</script>