<%@page import="common.jdbcUtil"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <%
  Connection conn = jdbcUtil.connect();
  String sql = "select seat_no from reservation r join seat s on(r.re_no=s.re_no) where sc_no=?";
		  
  PreparedStatement pstmt = conn.prepareStatement(sql);
  pstmt.setString(1, request.getParameter("sc_no"));
  ResultSet rs = pstmt.executeQuery();
  String seat="";
  while(rs.next()){
	  seat+=rs.getString("seat_no");
  }
System.out.print(seat);
  %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.seatlist{
	width:1050px;
}
.seat{
	margin:5px;
	padding:15px;
	display:inline-block;
	width:50px;
	height:50px;
	background-color:gray;
	cursor:pointer;
}

.rm{
	margin-right:30px;
}
.aa{
	width:1010px;
	height:50px;
	background-color:gray;
	margin-left:5px;
	padding:10px;
	text-align:center;
}
.seatselect{
	background-color:red;
}
.seat:hover{
	box-shadow:3px 3px red;
}
.seatreserv{
	background-color:blue;
	color:white;
	cursor:default;
}
.seatreserv:hover{
	box-shadow:0px 0px white;
}
</style>
<script>
function selectseat(sname){
	if(document.getElementById(sname).style.backgroundColor=='red')
		document.getElementById(sname).style.backgroundColor='gray';
	else
		document.getElementById(sname).style.backgroundColor='red';
	

	
	var seats = document.getElementsByClassName('seat')
	var selectred ="";
	for(i=0;i<seats.length;i++){
		if(seats[i].style.backgroundColor=='red'){
			selectred+=seats[i].id+',';
		}
	}
	document.frm.seat_no.value=selectred;
}
</script>
</head>ll
<body>
<div class="aa">
screen
</div>
<div class="seatlist">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
var IMP = window.IMP; // 생략가능
IMP.init('imp07439138'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
var seatreserv="<%= seat%>";
for(i=65;i<=70;i++){
	for(j=1;j<=11;j++){
		var rm='';
		if(j==3 || j==8)
			rm='rm';
		var sname=String.fromCharCode(i)+j;
		if(seatreserv.indexOf(sname)>=0){
			document.write('<div id="'+sname+'" class="seat seatreserv '+ rm +' " >'+ sname  +'</div>')
		}else{
			document.write('<div id="'+sname+'" class="seat '+ rm +' " onclick="selectseat(\''+sname+'\')" >'+ sname  +'</div>');
		}
	}
}
function goList(){
	history.go(-1);
}

function insertCheck(){
	if(frm.name.value == ""){
		alert("이름이 입력되지 않았습니다.");
		frm.name.focus();
		return;
	}
	if(frm.tel.value == ""){
		alert("전화번호가 입력되지 않았습니다.");
		frm.tel.focus();
		return;
	}
	if(frm.pw.value == ""){
		alert("비밀번호가 입력되지 않았습니다.");
		frm.pw.focus();
		return;
	}
	
	IMP.request_pay({
	    pg : 'inicis', // version 1.1.0부터 지원.
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '주문명:영화비테스트',
	    amount : 100,
	    buyer_name : frm.name.value,
	    buyer_tel : frm.tel.value,
	    m_redirect_url : 'reservationPay.jsp'
	}, function(rsp) {
	    if ( rsp.success ) {
	        var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	        alert("자리선택이 완료되었습니다.");
	    	document.frm.submit();
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	    }
	    alert(msg);
	}); 
}
</script>

</div>
<%
 sql= "select sc_no,open_date,m.movie_no,m.movie_name from scheduler s join movie m on(s.movie_no=m.movie_no) where s.sc_no=? ";

pstmt = conn.prepareStatement(sql);
pstmt.setString(1, request.getParameter("sc_no"));
rs = pstmt.executeQuery();
rs.next();

String sc_no = rs.getString("sc_no");
String open_date = rs.getString("open_date");
String movie_no = rs.getString("movie_no");
String movie_name = rs.getString("movie_name");
%>

<form name="frm" action="revervationPro.jsp" method="post">
<table border width=70% text-align=center>
<tr><td>price</td><td><input type="text" name="price" value="10000"></td></tr>
<tr><td>seat_no</td><td><input type="text" name="seat_no"></td></tr>
<tr><td>name</td><td><input type="text" name="name"></td></tr>
<tr><td>tel</td><td><input type="text" name="tel"></td></tr>
<tr><td>pw</td><td><input type="text" name="pw"></td></tr>
<tr><input type="hidden" name="sc_no" value="<%= sc_no%>"></tr>
<tr><input type="hidden" name="movie_no" value="<%= movie_no%>"></tr>
<tr><td>open_date</td><td><input type="text" name="open_date" value="<%= open_date%>"></td></tr>
<tr><td>movie_name</td><td><input type="text" name="movie_name" value="<%= movie_name%>"></td></tr>
</table>
<div>
	<button type="button" onclick="insertCheck()">등록</button>
	<button type="button" onclick="goList()">취소</button>
</div>
</form>
</body>
</html>