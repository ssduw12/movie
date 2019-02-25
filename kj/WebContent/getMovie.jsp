
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
	<title>영화조회</title>
		<style>
			a{
				font-color:white;
			}
			ul{
				list-style-type:none;
			}
			form fieldset{
				margin-bottom:10px;
			}
			form legend{
				font-size:15px;
				color:#006666;
				font-weight:600;
			}
			
			form ul li{
				list-style:none;
				font-size:12px;
				margin:10px 0;
			}
			li label{
				width:120px;
				float:left;
				font-size:12px;
				font-weight:bold;
				color:blue;
				
			}
			.tbl{
			margin:auto;
				color:white;
				border : 1px solid white;
				text-align:center;
			}
			.tbl td{
			color:white;
			border:1px solid white;
			}
			.tbl th{
				border:1px solid white;
			}
		</style>
		
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
	<body class="movie_insert.jsp">
		<%@include file="head.jsp" %>
		<section>
		<table class="tbl">
			<h1 align="center">영화조회</h1>
			<tr>
				<th>영화번호</th>
				<th>영화제목</th>
				<th>예고편</th>
				<th>영화감독</th>
				<th>출연배우</th>
				<th>개봉일자</th>
				<th>포스터</th>
				<th>영화상태</th>
			</tr>
				<%				
			Connection conn = jdbcUtil.connect();
			
			String sql = "select movie_no,movie_name,movie_intro,movie_pd,movie_actor,"+
						" TO_CHAR(movie_date,'YYYY/MM/DD') md,movie_img," +
						" decode (movie_state,'0','종영작','1','현재 상역작','2','개봉예정작','미정') movie_state from movie";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
			%>
			<tr>
			<td><%=rs.getString("movie_no") %></td>
			<td><a href="movie_update.jsp?movie_no=<%=rs.getString("movie_no") %>"><%=rs.getString("movie_name") %></a></td>
			<td><%=rs.getString("movie_intro") %></td>
			<td><%=rs.getString("movie_pd") %></td>
			<td><%=rs.getString("movie_actor") %></td>
			<td><%=rs.getString("md") %></td>
			<td><img src="images/<%=rs.getString("movie_img")%>" style="width:40px"></td>
			<td><%=rs.getString("movie_state") %></td>
			</tr>
			<%	
			}
					%>
		</table>
		<%@include file="footer.jsp" %>
		<!-- Copyright -->
		<div id="copyright">
			<div class="container">
			Design: <a href="http://templated.co">TEMPLATED</a> Images: <a href="http://unsplash.com">Unsplash</a> (<a href="http://unsplash.com/cc0">CC0</a>)
			</div>
		</div>
		</section>
	</body>
</html>