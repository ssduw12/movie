
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
		<title>로그인</title>
		<style>
		body{
         font-family: "맑은 고딕";
         font-size: 30px;
         color: #333;
		}
		#login-form{
         width:200px;
         height:300px;
         margin:100px auto;
         border: 1px solid gray;
         border-radius: 5px;
         padding: 15px;
		}
		#login-form input, #login-form label{
         display:block;
		}
		#login-form label{
         margin-top: 10px;
		}
		#login-form input{
   		 margin-top: 5px;
		}
		.logintitle{
			text-align:center;
			font-size:40px;
			margin-top:20px;
			font-family: 'Arimo', sans-serif; 		
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
	<body class="login.jsp">
		
		
		<%@include file="head.jsp" %>
		
		<div class="logintitle">로그인 폼</div>
		<form id="login-form" method="post" action="loginPro.jsp">
		<label class="legend">아이디</label>
		<input type="text" id="id" name="id" maxlength="50">
		<label class="legend">패스워드</label>
		<input type="text" id="passwd" name="passwd" maxlength="50"><br>
		<label class="lo"><input type="submit" value="로그인"></label>
		</form>					
		<%@include file="footer.jsp" %>
	
	</body>
</html>