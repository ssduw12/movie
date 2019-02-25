<%@page import="common.jdbcUtil"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	Connection conn = jdbcUtil.connect();
	//예매번호
	String sql="select max(re_no)+1 from reservation";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	rs.next();

	String re_no = rs.getString(1);
	
	//예약정보입력
	String price = request.getParameter("price");
	String seat_no = request.getParameter("seat_no");
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	String pw = request.getParameter("pw");
	String sc_no = request.getParameter("sc_no");
	String movie_no = request.getParameter("movie_no");
	String open_date = request.getParameter("open_date").substring(0,8);
	
	sql ="insert into reservation(re_no,pay,price,name,tel,pw,sc_no,movie_no,re_date) values(?,?,?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, re_no);
	pstmt.setString(2, "card");
	pstmt.setString(3, price);
	pstmt.setString(4, name);
	pstmt.setString(5, tel);
	pstmt.setString(6, pw);
	pstmt.setString(7, sc_no);
	pstmt.setString(8, movie_no);
	pstmt.setString(9, open_date);
	pstmt.executeUpdate();
	
	//좌석정보 입력
	sql ="insert into seat values(?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, re_no);
	pstmt.setString(2, seat_no);
	pstmt.executeUpdate();
	System.out.print("처리완료");
	response.sendRedirect("reservarion.jsp");
%>
