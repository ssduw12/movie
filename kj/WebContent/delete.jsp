<%@page import="common.jdbcUtil"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String movie_no = request.getParameter("movie_no");


	Connection conn = jdbcUtil.connect();

	String sql = "delete from movie where movie_no=?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,movie_no);

	
	pstmt.execute();
	
	response.sendRedirect("getMovie.jsp");
%>
