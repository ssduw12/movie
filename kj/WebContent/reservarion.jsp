<%@page import="common.jdbcUtil"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Iridium by TEMPLATED
    templated.co @templatedco
    Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
	<head>
		<title>상영 시간표</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link href='http://fonts.googleapis.com/css?family=Arimo:400,700' rel='stylesheet' type='text/css'>
		<!--[if lte IE 8]><script src="js/html5shiv.js"></script><![endif]-->
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
		<script src="js/skel.min.js"></script>
		<script src="js/skel-panels.min.js"></script>
		<script src="js/init.js"></script>
		<noscript>
			<link rel="stylesheet" href="css/skel-noscript.css" />
			<link rel="stylesheet" href="css/style.css" />
			<link rel="stylesheet" href="css/style-desktop.css" />
		</noscript>
		<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
		<!--[if lte IE 9]><link rel="stylesheet" href="css/ie/v9.css" /><![endif]-->
		<style>
		 table, caption, tbody, tfoot, thead, tr, th, td{
		 	border:1px solid black;
		 	text-align:center;
		 	
		 }
		
		
		</style>
	</head>
	<body>

		<%@include file="head.jsp" %>

		<!-- Main -->
	<div id="main">
			<div class="container">
				<div class="row"> 
			<article id="post-102" class="post-102 page type-page status-publish hentry">

	<header class="entry-header">
		
	<h3 class="page-title" align="center">
			<span align="center">상영시간표</span>
	</h3><br>
	
	<table border align ="center" width = "80%">
	<tr>
    <th>시간표번호</th>
    <th>상영시간</th>
    <th>영화번호</th>
</tr>  
<% 
//1.connect
Connection conn = jdbcUtil.connect();

//2.sql구문 준비
String sql="select sc_no,to_char(open_date,'yy/MM/dd hh24:mi:ss') aa,to_char(open_date,'yy/MM/dd') bb, decode(movie_no,'101','타이타닉','102','캡틴마블','100','보헤미안랩소디','103','어벤져스4엔드게임','104','암수살인','105','스파이더맨 파프롬홈') zxc from scheduler";
PreparedStatement pstmt=conn.prepareStatement(sql);
//3.실행
ResultSet rs=pstmt.executeQuery();
//4. 결과처리
while(rs.next()){
%>

<tr>
		<td><%=rs.getString("sc_no")%></td>
        <td><a href = "reservationPay.jsp?sc_no=<%=rs.getString("sc_no")%>"><%=rs.getString("aa") %></a></td>
        <td><%=rs.getString("zxc")%></td>
</tr>
<%
}
conn.close();
%>
</table>
	
	</header>

	<div class="content-area sidebar-none">
		<div class="content-wrapper">
			<div class="entry-content">
				
		<section id='coming-soon2' class='stag-custom-widget-area '><aside id="stag_widget_recent_posts_grid-17" class="widget stag_widget_recent_posts_grid"><section class="custom-recent-posts layout-post-full"><article id="post-7270" class="post-7270 post type-post status-publish format-standard has-post-thumbnail hentry category-comingsoon category-39 category-nowshowing post-grid">

	<style type="text/css">
		
		.post-background-image-7270 { background-image: url }
	</style>

	<a href="http://55cine.com/2019/01/17/february/" class="post-background-frame"></a>
	<span class="post-overlay"></span>
	<span class="post-background-image post-background-image-7270"></span>

	<div class="post-content-area">
				<header class="entry-header">
			<h2 class="entry-title">
				</h2>		</header>
		
				
			</div>
		</article>
				</div>
			</div>
		</div>

		<%@include file="footer.jsp" %>
	</body>
</html>