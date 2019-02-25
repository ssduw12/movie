
<%@page import="common.jdbcUtil"%>
<%@page import="java.sql.ResultSet"%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
		<title>팬더 극장</title>
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
	</head>
	<body class="homepage">

		<%@include file="head.jsp" %>

		<!-- Main -->
		<div id="main">
			<div class="container">
				<div class="row"> 
					
					<!-- Content -->
					<div id="content" class="8u skel-cell-important">
						<section>
						<%
						Connection conn=jdbcUtil.connect();
						String sql="select * from movie where movie_state ='1'";
						PreparedStatement pstmt=conn.prepareStatement(sql);
						ResultSet rs=pstmt.executeQuery();
						rs.next();
						
						
						
						
						
						
						
						%>
							<header>
								<h2><%=rs.getString("movie_name") %>,<%=rs.getString("movie_date").substring(0,10)%></h2>
								
								
							</header>
							<a href="#" class="image full"><img src="./images/<%=rs.getString("movie_img") %>" alt="" /></a>
							<p><%=rs.getString("movie_story") %></p> 
						</section>
					</div>
					
					<!-- Sidebar -->
					<div id="sidebar" class="4u">
						<section>
							<header>
								<h2>영화예정작</h2>
							</header>
							<ul class="style">
								
								<%
								 sql="select * from movie where movie_state ='2'";
								 pstmt=conn.prepareStatement(sql);
								 rs=pstmt.executeQuery();
								while(rs.next()){
								%>
								<li>
									<p class="posted"><%=rs.getString("movie_name") %></p>
									<img src="./images/<%=rs.getString("movie_img")%>" style="width:100px;"/>
									<p class="text"><%=rs.getString("movie_story") %></p>
								</li>
								<%}%>
									
							</ul>
						</section>
					</div>
				</div>
			</div>
		</div>

		<!-- Footer -->
		<div id="featured">
			<div class="container">
				<div class="row">
					<div class="4u">
						
						
						<h2>영화 종영작</h2>
						<% 
						sql="select * from movie where movie_state ='0'";
						pstmt=conn.prepareStatement(sql);
						rs=pstmt.executeQuery();
						rs.next();
						%>
						<a href="#" class="image full"><img src="./images/<%=rs.getString("movie_img")%>"style="width:350px;"/></a>
						<p><%=rs.getString("movie_name") %></p>
						<p class="text"><%=rs.getString("movie_story") %></p>
						<p><a href="#" class="button">홈으로</a></p>
					</div>
					<div class="4u">
						
						<h2>극장지도</h2>
						<iframe  src="map.jsp" width="500px" Height="500px"></iframe>
					</div>
				</div>
			</div>
		</div>


		<%@include file="footer.jsp" %>
		
	</body>
</html>