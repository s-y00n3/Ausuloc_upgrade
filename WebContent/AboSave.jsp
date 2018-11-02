<%@page import="javax.swing.text.Document"%>
<%@page import="java.util.Scanner"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>Write</h2>
<%
request.setCharacterEncoding("UTF-8");
String date = request.getParameter("date");
String name= request.getParameter("name");
String title = request.getParameter("title");
String word = request.getParameter("word");
//String fileName = request.getParameter("fileName");
//Date date = new Date();
//Long time = date.getTime();

String Fname = title;

PrintWriter writer = null;
try{
	String dir = application.getRealPath("/WEB-INF/txt/");
	String filePath = dir + "/" + Fname;
	
	writer = new PrintWriter(filePath);
	

	%>
	<br>
	<hr>
	<% 
	writer.printf("%s %n" , date);
	writer.printf("%s %n", name); //작성자
	writer.printf("%s %n",title); // 파일 이름
	writer.println(word); // 파일 내용
%>
<script>
alert('saved');
document.location.href="AboPro.jsp"
</script>
<% 	
}
catch(IOException ioe){
	out.println("Can't save.");
}
finally{
	try{
		writer.close();
	}
	catch(Exception e){
		
	}
}
%>
</body>
</html>