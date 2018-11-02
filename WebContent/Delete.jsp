<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>

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
<body  style="background-color: #f2ece5;">
<div class="title"><center><img src="ASL.png" width="20%"></center></div>
<div class="zeta-menu-bar">
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
      <li><a href="List.jsp">글 목록</a></li>
        <li><a href="Write.jsp">글 쓰기</a></li>
      </ul>
    </li> 
  </ul>
</div>
<div class="content">
<%
request.setCharacterEncoding("UTF-8"); //받아오는 값을 한글로 처리


Class.forName("com.mysql.jdbc.Driver"); // mysql 연동

String url = "jdbc:mysql://localhost:3306/asl_board?serverTimezone=UTC&verifyServerCertificate=false&useSSL=false"; // mysql 데이터베이스명

String mysql_id = "asl";   // mysql id값

String mysql_pw = "0705";   // mysql pw값

int board_no = Integer.parseInt(request.getParameter("board_no"));
	try{
				
		 Connection conn = DriverManager.getConnection(url, mysql_id, mysql_pw);    // 실제 DB 연동시도


		String sql = "delete from board WHERE board_no=" + board_no;	
	       PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate(sql);	 
		
		 
%>
<script language=javascript>
   				self.window.alert("해당 글을 삭제하였습니다.");
   				location.href="List.jsp";
</script>

<%
		pstmt.close();
		conn.close();
	
 	} catch(SQLException e) {
		out.println( e.toString() );
	} 

%>
</div>
</body>
</html>