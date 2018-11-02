<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>

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
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>

<script>
$(document).ready(function(){
	$("#update").click(function(){
		$("#updateFrm").submit();
	});
});
</script>
<script type="text/javascript">
$(document).ready(function(){
	$("#update").click(function(){
		var board_no = $("#board_no").val();
		location.href="Update.jsp?board_no="+board_no;
	});
});
</script>
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

    Class.forName("com.mysql.jdbc.Driver"); 

    String url = "jdbc:mysql://localhost:3306/asl_board?serverTimezone=UTC&verifyServerCertificate=false&useSSL=false";

    String mysql_id = "asl"; 

    String mysql_pw = "0705"; 


    // 받아온 파라미터 값을 utf-8로 인코딩

    request.setCharacterEncoding("utf-8");


    // 받아온 파라미터 값을 변수에 담는 부분

    String board_no = request.getParameter("board_no");

    String board_title = request.getParameter("board_title");
    
    String board_type = request.getParameter("board_type"); 

    String board_writer = request.getParameter("board_writer");

    String board_content = request.getParameter("board_content");



    // 데이터 베이스 연동 후 쿼리 적용 하는 부분

    try{

      Connection conn = DriverManager.getConnection(url, mysql_id, mysql_pw);


      String sql = "update board set board_title=?, board_writer=?, board_type=?, board_content=? where board_no=?";

      PreparedStatement pstmt = conn.prepareStatement(sql);


      pstmt.setString(1, board_title);
   
      pstmt.setString(2, board_writer);
      
      pstmt.setString(3, board_type);

      pstmt.setString(4, board_content);

      pstmt.setString(5, board_no);


      pstmt.execute();

  %>


  <!--수정 완료 창 띄운 후에 수정된 게시글 상세보기로 이동 -->

  <script>

    alert("수정완료 되었습니다");

    window.location.href = "Detail.jsp?board_no="+<%=board_no%>;

  </script>



  <%

      pstmt.close();

    }catch(SQLException e){

      out.println(e.toString());

    }

  %>
</div>
</body>
</html>