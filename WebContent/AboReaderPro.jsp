<%@page import="java.util.List"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.File"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
</head>
<body style="background-color: #f2ece5;">
<div class="title"><center><img src="ASL.png" width="20%"></center></div>
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
        <li><a href="C_Emailzip.html">이메일 전송법</a>
        </li>
      </ul>
    </li>
    
    <li><a href="#0">Moblie</a>
      <ul>
        <li><a href="S_Bookmark.html">북마크 사용법</a></li>
        <li><a href="S_Googlestore.html">구글 스토어 사용법</a></li>
        <li><a href="S_Networkconn.html">네트워크 연결법</a></li>
        <li><a href="S_Secretmode.html">시크릿모드 사용법</a></li>
        <li><a href="S_Alram.html">알람 설정법</a></li>
        <li><a href="S_Changediplay.html">배경화면 바꾸는법</a></li>
        <li><a href="S_Fontsize.html">글자크기 조절법</a></li>
      </ul>
    </li> 
    
    <li><a href="#0">Education</a>
     <ul>
        <li><a href="Education_apply1.html">신청</a></li>
        <li><a href="Information_Education.html">강좌</a></li>
      </ul>
    </li> 
    
    <li><a href="#0">Board</a>
     <ul>
        <li><a href="AboPro.jsp">글 목록</a></li>
        <li><a href="Aboard.jsp">글 쓰기</a></li>
      </ul>
    </li> 
  </ul>
  </center>
</div>
<div class="content" style="background-color: #f2ece5;">
<% 

	String filename = request.getParameter("FILE_NAME");

%>

<%
	List<String> bizList = null;
	BufferedReader reader = null;
	try{
		String filePath = application.getRealPath("/WEB-INF/txt/"+filename);
		//out.println(filePath);
		
		reader = new BufferedReader(new FileReader(filePath));
		bizList = new ArrayList<String>();
		
		String str;
		while((str = reader.readLine()) != null){
			bizList.add(str);
			if(str == null) break;
			}
		
			String dt = bizList.get(0);
			String nm = bizList.get(1);
			String tt = bizList.get(2);
			String ct = bizList.get(3);
			
%>
		<table border="1" style="border-collapse: collapse; width: 80%; height:50%; margin-left: 10%; margin-top: 5%;">
			<tr>
				<td style="font-size: 15pt; height:5%; width:15%;">작성자</td>
				<td height="5%" width="20%" align="center" ><%= nm %></td>
				<td height="5%" width="10%" align="center" style="font-size: 15pt;">작성일</td>
				<td height="5%" width="20%" align="center"><%= dt %></td>
			</tr>
			<tr>
				<td height="5%" width="20%" align="center" style="font-size: 15pt;">제목</td>
				<td height="5%" width="80%" colspan="3" align="center"><%= tt %></td>
			</tr>
			<tr>
				<td height="20%" width="10%" align="center" style="font-size: 15pt;">내용</td>
				<td height="20%" width="90%" colspan="3"><%= ct %></td>
			</tr>
		</table>
<% 
			
	}catch(Exception e){
		out.println("파일을 읽을 수 없습니다.");
	}
	finally{
		reader.close();
	}
%>

<br>
<a href="AboPro.jsp">글 목록</a>
</div>
</body>
</html>