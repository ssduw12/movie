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
		<title>팬더극장 개봉예정작</title>
		<style>
		.movieig{
			width:700px;
			align:center;
		}
		body{
			text-align:center;
		}
		.movie{
			font-size:3em;
			height:80px;
			padding:25px;
		}
		</style>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link href='http://fonts.googleapis.com/css?family=Arimo:400,700' rel='stylesheet' type='text/css'>
		<!--[if lte IE 8]><script src="js/html5shiv.js"></script><![endif]-->
		<script src="../javaScript/jquery-3.3.1.js"></script>
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
		<script src="js/skel.min.js"></script>
		<script src="js/skel-panels.min.js"></script>
		<script src="js/init.js"></script>
		<script>
		
		</script>
	</head>
	<body>
		<%@include file="head.jsp" %>
		<div class="movie" style="color:white">★-------개봉예정작-------★</div>
		
		
		<% 
		Connection conn = jdbcUtil.connect();
		
		String sql = "select * from movie where movie_state = '2'";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()){
		
		%>
		<p style="font-size:3em"><%=rs.getString("movie_name") %></p>
		<a href="movie_info.jsp?movie_no=<%=rs.getString("movie_no")%>"><img src="./images/<%=rs.getString("movie_img") %>" class="movieig"></a>
		<p><font size ='5'><%=rs.getString("movie_date").substring(0,10) %></font></p>
		<%} %>
		<%@include file="footer.jsp" %>
	</body>
</html>