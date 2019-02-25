<%@page import="oracle.net.aso.p"%>
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
<title>일별현황</title>

<body>
<h3 align="center">일별 현황 </h3>

<form>
<select name="year">
<option value="2017">2017년</option>
<option value="2018">2018년</option>
<option value="2019">2019년</option>
</select>
<select name="month">
<option value="01">1월</option>
<option value="02">2월</option>
<option value="03">3월</option>
<option value="04">4월</option>
<option value="05">5월</option>
<option value="06">6월</option>
<option value="07">7월</option>
<option value="08">8월</option>
<option value="09">9월</option>
<option value="10">10월</option>
<option value="11">11월</option>
<option value="12">12월</option>
</select>
<input  value="검색" type="submit">
</form>
<table id="myTable" align="center" style="color:white">
<thead>
<tr><th>년월</th>
<th>건수</th>
<th>합계</th></tr>
</thead>
<tbody>
<% 
Connection conn=jdbcUtil.connect();
						String sql="select to_char(RE_DATE,'yyyy/mm/dd')as yymm,"
								+ " count(*)cnt,sum(PRICE)price"
								+ " from RESERVATION"
								+ " where to_char(RE_DATE,'yyyy/mm')=?"
								+ " GROUP BY to_char(RE_DATE,'yyyy/mm/dd')";
						PreparedStatement pstmt=conn.prepareStatement(sql);
						String year = request.getParameter("year");
						String month= request.getParameter("month");
						if(year==null){
							year="2019";
						}
						if(month==null){
							month="02";
						}
						pstmt.setString(1, year+"/"+month);
						
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