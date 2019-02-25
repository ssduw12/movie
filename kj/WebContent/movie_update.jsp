
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
		<title>영화수정/삭제</title>
	<style>
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
			.mov{
			width:300px;
			margin:auto;
			
			}
			.lab{
			width:50px;
			float:left;
			}
			
			li label{
				width:300px;
				
				font-size:12px;
				font-weight:bold;
				color:white;
				
			}
		</style>
		<script>
		function movie_insert() {
			location = "movie_insert.jsp";
		}
		
		function check() {
			if(document.frm.movie_no.value == "") {
				alert("영화번호가 입력되지 않았습니다.");
				return;
			}
			if(document.frm.movie_name.value == "") {
				alert("영화이름이 입력되지 않았습니다.");
				return;
			}
		
			alert("영화 수정이 완료되었습니다.");
			document.frm.submit();
		}
		function fileUpload(){
			window.open("fileForm.jsp","file","width=300,height=200");
		}
		function del(){
			if(confirm("삭제할까요?")) {
				var no = document.frm.movie_no.value;
				location = "delete.jsp?movie_no="+ no;
			}
			
		}
		</script>
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
		<%
		Connection conn = jdbcUtil.connect();
		String sql = "select * from movie where movie_no=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("movie_no"));
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		
		String movie_no = rs.getString("movie_no");
		String movie_name = rs.getString("movie_name");
		String movie_intro = rs.getString("movie_intro");
		String movie_pd = rs.getString("movie_pd");
		String movie_actor = rs.getString("movie_actor");
		String movie_story = rs.getString("movie_story");
		String movie_date = rs.getString("movie_date");
		String movie_img = rs.getString("movie_img");
		String movie_state = rs.getString("movie_state");
		conn.close();
		%>
		
		
								<h1 style="text-align: center;">영화수정</h1>
								
							
								<article>
								<h2 style="text-align: center;"></h2>
<div class="mov">
<form name="frm" action="movie_updatePro.jsp" method="post">
	<fieldset>
		<legend>수정/삭제</legend>
		<ul>
		<li><label for="movie_no" class="lab">영화번호</label><input type="text" name="movie_no" value="<%=movie_no%>"></li>
		<li><label for="movie_name" class="lab">영화이름</label><input type="text" name="movie_name" value="<%=movie_name%>"></li>
		<li><label for="movie_pd" class="lab">감독</label><input type="text" name="movie_pd" value="<%=movie_pd%>"></li>
		<li><label for="movie_actor" class="lab">출연진</label><input type="text" name="movie_actor" value="<%=movie_actor%>"></li>
		<li><label for="movie_story" class="lab">줄거리</label><textarea rows="10" cols="50" name="movie_story" id="movie_story" value="<%=movie_story%>"></textarea></li>
		<li><label for="movie_date" class="lab">개봉날짜</label><input type="text" name="movie_date" value="<%=movie_date%>"></li>
		<li><label for="movie_img" class="lab">포스터</label><input type="text" name="movie_img" id="movie_img" value="<%=movie_img%>"><button type="button" onclick="fileUpload()">파일첨부</button></li>
		<li><label for="movie_intro" class="lab">예고편</label><input type="text" name="movie_intro" value="<%=movie_intro%>"></li>
		<li><label for="movie_state" class="lab">영화상태</label><select name="movie_state" value="<%=movie_state%>">
		<option value="0">종영작</option>
		<option value="1">현재 상영작</option>
		<option value="2">개봉 예정작</option>
		</select>
		</li>
		
		
		</ul>
	</fieldset>
	
	<fieldset>
		<button type="button" onclick="check()">수정</button>
		<button type="button" onclick="del()">삭제</button>
	</fieldset>
</form>
</div>
</article>
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