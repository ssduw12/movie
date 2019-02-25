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
		<title>팬더극장 개봉예정작 상세페이지</title>
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
		<%
		Connection conn = jdbcUtil.connect();
		
		String sql = "select * from movie where movie_no = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("movie_no"));
		ResultSet rs = pstmt.executeQuery();
		
		rs.next();
		%>
		<%@include file="head.jsp" %>
		<div class="movie" style="color:white">★--------개봉예정작 상세페이지-------★</div>
		<img src="./images/<%=rs.getString("movie_img")%>" class="movieig">
		<p><b><font size ='5' color ="white"><%=rs.getString("movie_name") %> 예고편</font></b></p>
		<p><iframe width="700" height="500" src="<%=rs.getString("movie_intro") %>" 
		frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></p>
		<p><b><font size = 5em color ="white"><%=rs.getString("movie_name") %><%=rs.getString("movie_date") %></font></b><p> 
		<p><b><font size = 5em color ="white">감독 : <%=rs.getString("movie_pd") %></font></b><p>
		<p><b><font size = 5em color ="white">출연 : <%=rs.getString("movie_actor") %></font></b><p>
		<div><p style="width:400px;margin:auto;"><b><font size = 5em color ="white">줄거리 : <%=rs.getString("movie_story") %></font></b><p></div>
		
		<%@include file="footer.jsp" %>
	</body>
</html>