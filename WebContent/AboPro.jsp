<%@page import="java.util.List"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.File"%>
<%@page import="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width, height=device-height">
<meta charset="utf-8">
<script src="//code.jquery.com/jquery.min.js"></script>
<link rel="stylesheet" href="menu.css">
<script src="stayMenu.js"></script>
<script src="menu.js"></script>
<style type="text/css">
input[type=submit] {
	background-color: #242c53; /* Green */
	border: none;
	color: white;
	padding: 10px 22px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	cursor: pointer;
}

input[type=submit]:before {
	background-color: #242c53; /* Green */
	border: none;
	color: white;
	padding: 10px 22px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	cursor: pointer;
}

input[type=submit]:hover {
	background: rgba(0, 0, 0, 0);
	color: #000000;
	box-shadow: inset 0 0 0 3px #242c53;
}

div#contain {
	width: 80%;
	border: 0px solid black;
}

table.type09 {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;

}
table.type09 thead th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #369;
    border-bottom: 3px solid #036;
}
table.type09 tbody th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #f3f6f7;
}
table.type09 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
</style>
</head>
<body style="background-color: #f2ece5;">
	<div class="title">
		<center>
			<img src="ASL.png" width="20%">
		</center>
	</div>
	<div class="zeta-menu-bar">
		<center>
			<ul class="zeta-menu">
				<li><a href="Au_main.jsp">Home</a></li>
				<li><a href="#0">Desktop</a>
					<ul>
						<li><a href="C_Bookmark.html">북마크 설정법</a></li>
						<li><a href="C_Download.html">다운로드법</a></li>
						<li><a href="C_History.html">사용 기록 확인법</a>
						<li><a href="C_Secretmode.html">시크릿모드 사용법</a>
						<li><a href="C_Smartkey.html">단축키 사용법</a>
						<li><a href="C_Blog.html">블로그 사용법</a>
						<li><a href="C_Ppt.html">ppt 사용법</a>
						<li><a href="C_Emailzip.html">이메일 전송법</a></li>
					</ul></li>

				<li><a href="#0">Moblie</a>
					<ul>
						<li><a href="S_Bookmark.html">북마크 사용법</a></li>
						<li><a href="S_Googlestore.html">구글 스토어 사용법</a></li>
						<li><a href="S_Networkconn.html">네트워크 연결법</a></li>
						<li><a href="S_Secretmode.html">시크릿모드 사용법</a></li>
						<li><a href="S_Alram.html">알람 설정법</a></li>
						<li><a href="S_Changediplay.html">배경화면 바꾸는법</a></li>
						<li><a href="S_Fontsize.html">글자크기 조절법</a></li>
					</ul></li>

				<li><a href="#0">Education</a>
					<ul>
						<li><a href="Education_apply1.html">신청</a></li>
						<li><a href="Information_Education.html">강좌</a></li>
					</ul></li>

				<li><a href="#0">Board</a>
					<ul>
						<li><a href="AboPro.jsp">글 목록</a></li>
						<li><a href="Aboard.jsp">글 쓰기</a></li>
					</ul></li>
			</ul>
		</center>
	</div>
	<div class="content" style="background-color: #f2ece5;">
		<center>
			<h1 style="font-size: 2em;">자유 게시판</h1>
		</center>
		<br> <br>
		<div id="contain">
			
			<%
				String dirPath = application.getRealPath("/WEB-INF/txt");
				//out.println(dirPath);//실제경로

				File dir = new File(dirPath);
				String filenames[] = dir.list();

				/*for(int i=0; i<filenames.length; i++){
					out.println(filenames[i]);
					out.println("<br>");
				}*/
			%>
			<table >
    		<tr>
        		<td>글 번호</td>
        		<td style="margin-left: 5%;">제목</td>
    		</tr>
			</table>
			<%
				for (String filename : filenames) {
			%>
			<table class="type09" border="0">
			<tr>
			<td><%= "1" %></td>
			<td>
			<a href="AboReaderPro.jsp?FILE_NAME=<%=filename%>"><%=filename%></a>
			</td>
			</tr>
			</table>
			<%
				} 
			%>
			<form action="Aboard.jsp" style="float: left;">
				<input type="submit" value="글쓰기">
			</form>
		</div>
</body>
</html>