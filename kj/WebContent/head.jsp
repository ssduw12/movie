<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Header -->
		<div id="header">
			<div class="container"> 
				
				<!-- Logo -->
				<div id="logo">
					<h1><a href="#">팬더극장</a></h1>
					<span>Design by KJ</span>
				</div>
				
				<!-- Nav -->
				<nav id="nav">
					<ul>
						<li <%if (request.getRequestURI().indexOf("index.jsp")>=0) out.print("class='active'"); %>><a href="index.jsp">홈</a></li>
						<li <%if (request.getRequestURI().indexOf("reservarion.jsp")>=0) out.print("class='active'"); %>><a href="reservarion.jsp">예매하기</a></li>
						<li <%if (request.getRequestURI().indexOf("movie_sc.jsp")>=0) out.print("class='active'"); %>><a href="movie_sc.jsp">개봉예정작</a></li>
						<li <%if (request.getRequestURI().indexOf("introduce.jsp")>=0) out.print("class='active'"); %>><a href="introduce.jsp">극장안내</a></li>
						<li <%if (request.getRequestURI().indexOf("readmin.jsp")>=0) out.print("class='active'"); %>><a href="readmin.jsp">예매관리</a></li>
											<%
					if(session.getAttribute("id") == null){
						
						%>
						<li <%if (request.getRequestURI().indexOf("login.jsp")>=0) out.print("class='active'"); %>><a href="login.jsp">로그인</a></li>
						<%
					}					
					%>
																<%
					if(session.getAttribute("id") != null){
						
						%>
						<li <%if (request.getRequestURI().indexOf("logout.jsp")>=0) out.print("class='active'"); %>><a href="logout.jsp">로그아웃</a></li>
						<%
					}					
					%>
					</ul>
					
					<%
					if(session.getAttribute("id") != null){
						
						%>
						<ul>
						<li <%if (request.getRequestURI().indexOf("getMovie.jsp")>=0) out.print("class='active'"); %>><a href="getMovie.jsp">영화목록</a></li>
						<li <%if (request.getRequestURI().indexOf("movie_insert.jsp")>=0) out.print("class='active'"); %>><a href="movie_insert.jsp">영화등록</a></li>
						<li <%if (request.getRequestURI().indexOf("salestatusday.jsp")>=0) out.print("class='active'"); %>><a href="salestatusday.jsp">일매출현황</a></li>
						<li <%if (request.getRequestURI().indexOf("salestatusmoth.jsp")>=0) out.print("class='active'"); %>><a href="salestatusmoth.jsp">월매출현황</a></li>
					</ul>
						
						<%
					}					
					%>
				</nav>
			</div>
		</div>