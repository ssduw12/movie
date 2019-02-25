<%@page import="common.jdbcUtil"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");

	String movie_no = request.getParameter("movie_no");
	String movie_name = request.getParameter("movie_name");
	String movie_intro = request.getParameter("movie_intro");
	String movie_pd = request.getParameter("movie_pd");
	String movie_actor = request.getParameter("movie_actor");
	String movie_story = request.getParameter("movie_story");
	String movie_date = request.getParameter("movie_date");
	String movie_img = request.getParameter("movie_img");
	String movie_state = request.getParameter("movie_state");
	
	Connection conn = jdbcUtil.connect();
	String sql = "update movie set movie_name=?,movie_intro=?,movie_pd=?,movie_actor=?,movie_story=?,movie_date=?,movie_img=?,movie_state=?"+
				" where movie_no=?";

	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,movie_name);
	pstmt.setString(2,movie_intro);
	pstmt.setString(3,movie_pd);
	pstmt.setString(4,movie_actor);
	pstmt.setString(5,movie_story);
	pstmt.setString(6,movie_date);
	pstmt.setString(7,movie_img);
	pstmt.setString(8,movie_state);
	pstmt.setString(9,movie_no);
	pstmt.executeUpdate();
	
	System.out.print("건이 수정됨");
	response.sendRedirect("getMovie.jsp");
%>
