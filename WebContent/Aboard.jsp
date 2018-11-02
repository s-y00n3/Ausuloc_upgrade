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
div#write {
	width: 100%;
	height: 70%;
	margin-top: 7%;
	margin-bottom: 2%;
	padding-left: 2%;
	padding-right: 2%;
	padding-top: 3%;
	padding-bottom: 2%;
	text-align: left;
	background-color: none;
}
input[type=date] {
    border: none;
    border-bottom: 2px solid #242c53;
    background-color: #f2ece5;

}
input[type=text] {
    border: none;
    border-bottom: 2px solid #242c53;
    background-color: #f2ece5;

}
textarea{
	border: 2px solid #242c53;
    border-radius: 4px;
    background-color: #f2ece5;
}

input[type=submit] {
	background-color: #242c53; /* Green */
	border: none;
	color: white;
	padding: 15px 32px;
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
</style>
</head>
<body style="background-color: #f2ece5;">
	<div class="title" style="background-color: #f2ece5;">
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
		<%
			java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd-HH:mm:ss");
			String today = formatter.format(new java.util.Date());
		%>

		<center>
			<h1 style="font-size: 2em;">게시물을 작성해주세요.</h1>
			<div id="write">
				<form action="AboSave.jsp" method="post">
					<hr>
					작성 시간: <input name="date" value="<%=today%>" readonly="readonly"><br>
					<br>
					<hr>
					<h3>작성자</h3>
					<br> <input type="text" size="20" name="name"><br>
					<br>
					<hr>
					<h3>글 제목</h3>
					<br> <input type="text" size="20" name="title"><br>
					<br>
					<hr>
					<h3>내용</h3>
					<br>
					<textarea cols="50" rows="10" name="word"></textarea>
					<br> <br>
					<hr>
					<center>
						<input type="submit" value='글 등록'
							style="margin-top: 2%; width: 20%;">
					</center>
				</form>
			</div>
		</center>
	</div>
</body>
</html>