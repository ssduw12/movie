
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
	<title>영화등록</title>
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
				width:120px;
				float:left;
				font-size:12px;
				font-weight:bold;
				color:blue;
				
			}
		</style>
		<script>
		function movie_insert() {
			location = "movie_insert.jsp";
		}
		
		function insertCheck() {
			if(document.frm.movie_no.value == "") {
				alert("영화번호가 입력되지 않았습니다.");
				return;
			}
			if(document.frm.movie_name.value == "") {
				alert("영화이름이 입력되지 않았습니다.");
				return;
			}
			
			alert("영화 등록이 완료되었습니다.");
			document.frm.submit();
		}
		function fileUpload(){
			window.open("fileForm.jsp","file","width=300,height=200");
		}
		function ask(){
			location = "getMovie.jsp";
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
		<!-- Main -->
		<div id="main">
			<div class="container">
				<div class="row"> 
					
					<!-- Content -->
					<div id="content" class="12u skel-cell-important">
						
				<h1 style="text-align: center;">영화등록</h1>
				<% 
				
				Connection conn = jdbcUtil.connect();
				String sql = "select max(movie_no)+1 from movie";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				rs.next();
				
				%>
							
	<article>
		<h2 style="text-align: center;"></h2>
			<div class="mov">
	<form name="frm" action="movie_insertPro.jsp" method="post">
	<fieldset>
		<legend>등록</legend>
		<ul>
		<li><label for="movie_no" class="lab">영화번호</label><input type="text" name="movie_no" id="movie_no" value="<%=rs.getString(1)%>"></li>
		<li><label for="movie_name" class="lab">영화이름</label><input type="text" name="movie_name" id="movie_name"></li>
		<li><label for="movie_pd" class="lab">감독</label><input type="text" name="movie_pd" id="movie_pd"></li>
		<li><label for="movie_actor" class="lab">출연진</label><input type="text" name="movie_actor" id="movie_actor"></li>
		<li><label for="movie_story" class="lab">줄거리</label><textarea rows="10" cols="50" name="movie_story" id="movie_story"></textarea></li>
		<li><label for="movie_date" class="lab">개봉날짜</label><input type="text" name="movie_date" id="movie_date"></li>
		<li><label for="movie_img" class="lab">포스터</label><input type="text" name="movie_img" id="movie_img"><button type="button" onclick="fileUpload()">파일첨부</button></li>
		<li><label for="movie_intro" class="lab">예고편</label><input type="text" name="movie_intro" id="movie_intro"></li>
		<li><label for="movie_state" class="lab">영화상태</label><select name="movie_state">
		<option value="0">종영작</option>
		<option value="1">현재 상영작</option>
		<option value="2">개봉 예정작</option>
		</select>
		</li>
		</ul>
	</fieldset>
	<fieldset>
		<button type="submit" onclick="insertCheck()">등록</button>
		<button type="reset" onclick="reset()">다시쓰기</button>
		<button type="button" onclick="ask()">조회</button>
	</fieldset>
	</form>
		</div>
		</article>
		</div></div></div></div>
		<%@include file="footer.jsp" %>
		
		
	</body>
</html>