<%@page import="common.jdbcUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

		<title>팬더 극장</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link href='http://fonts.googleapis.com/css?family=Arimo:400,700' rel='stylesheet' type='text/css'>
		<link href='//cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css' rel='stylesheet' type='text/css'>
		<!--[if lte IE 8]><script src="js/html5shiv.js"></script><![endif]-->
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
		<script src="//cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
		<script src="js/skel.min.js"></script>
		<script src="js/skel-panels.min.js"></script>
		<style>
		td{
		color:black;
		border:1px solid gray;
		}
			th{
				
				border:1px solid white;
		}
		#myTable_wrapper{
		width:90%;
		margin:auto;
		}
		</style>
		
		<script src="js/init.js"></script>
		<script>
			$(document).ready( function () {
			    $('#myTable').DataTable();
			} );
			
		</script>
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
<meta charset="UTF-8">
<title>월별매출액</title>

<body>
<h3 align="center">월별매출액 </h3>
<table id="myTable" align="center" style="color:white">
<thead>
<tr><th>년월</th>
<th>건수</th>
<th>합계</th></tr>
</thead>
<tbody>
<% 
Connection conn=jdbcUtil.connect();
						String sql="select to_char(RE_DATE,'yyyy/mm')as yymm,"
								+ " count(*)cnt,sum(PRICE)price"
								+ " from RESERVATION"
								+ " GROUP BY to_char(RE_DATE,'yyyy/mm')";
						PreparedStatement pstmt=conn.prepareStatement(sql);
						ResultSet rs=pstmt.executeQuery();
						while(rs.next()){
					 
						
%>
<tr><td><%=rs.getString("yymm") %></td>
	<td><%=rs.getString("cnt")%></td>
	<td><%=rs.getString("price") %></td>
	
	
<%}%>
</tbody>
</table>
</body>
<%@include file="footer.jsp" %>
</html>