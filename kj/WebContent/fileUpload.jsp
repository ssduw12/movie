<%@page import="java.io.File"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String realFolder = " ";	//웹 어플리케이션상의 절대 경로

//파일이 업로드되는 폴더를 지정한다.
String saveFolder = "/upload";
String encType = "utf-8";	//인코딩타입
int maxSize = 5*1024*1024;	//최대 업로드 될 파일크기 5Mb

ServletContext context = getServletContext();
//현재  jsp페이지의 웹 어플리케이션상의 절대 경로를 구현한다.
realFolder = context.getRealPath(saveFolder);
out.println("the realpath is : " + realFolder+"<br>");
String filename="";
try {
	MultipartRequest multi = null;
	
	//전송을 담당할 컴퍼넌트를 생성하고 파일을 전송한다.
	//전송할 파일명을 가지고 있는 객체, 서버상의 절대경로, 최대 업로드될 파일크기, 문자코드
	multi = new MultipartRequest(request,realFolder,
			maxSize,encType,new DefaultFileRenamePolicy());
	
	//Form의 파라미터 목록을 가져온다.
	Enumeration<?> params = multi.getParameterNames();
	
	//파라미터를 출력한다.   
	while(params.hasMoreElements()) {
		String name = (String)params.nextElement();	//전송되는 파라미터
		String value = multi.getParameter(name);	//전송되는 파라미터
		out.println(name + " = " + value +"<br>");
	}
	
	out.println("------------------<br>");
	
	//전송한 파일 정보를 가져와 출력한ㄷ가.
	Enumeration<?> files = multi.getFileNames();
	
	//파일정보가 있다면
	while(files.hasMoreElements()) {
		//input 태그의 속성이 file인 태그의  name 속성값 : vkfkalxjdlfma
		String name = (String)files.nextElement();
		
		//서버에 저장된 파일이름
		 filename = multi.getFilesystemName(name);
	
		//전송된 원래의 파일 이름
		String original = multi.getOriginalFileName(name);
		
		//전송된 파일의 내용타입
		String type = multi.getContentType(name);
		
		//전송된 파일 속성이 file인 태그의  name 속성값을 이용해 파일 객체 생성
		File file = multi.getFile(name);
		
		out.println("파라미터 이름 : " + name + "<br>");
		out.println("실제 파일 이름 : " + original + "<br>");
		out.println("지정된 파일 이름 : " + filename + "<br>");
		out.println("파일타입 : " + type + "<br>");
		
		if(file!=null) {
			out.println("크기 : " + file.length());
			out.println("<br>");
		}
	}
}catch(IOException ioe){
	System.out.println(ioe);
}catch(Exception ex){
	System.out.println(ex);
}
%>
<script>
	alert("파일첨부 완료")
	opener.frm.fileUpload.value = "<%=filename%>"; 
	window.close();
</script>