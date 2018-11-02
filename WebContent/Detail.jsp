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
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#update").click(function(){
		var board_no = $("#board_no").val();
		location.href="Update.jsp?board_no="+board_no;
	});
});

$(document).ready(function(){
	$("#delete").click(function(){
		var board_no = $("#board_no").val();
		location.href="Delete.jsp?board_no="+board_no;
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


    int num = Integer.parseInt(request.getParameter("board_no"));


    try{

      Connection conn = DriverManager.getConnection(url, mysql_id, mysql_pw);

      Statement stmt = conn.createStatement();


      String sql = "select board_title, board_writer, board_type, board_content from board where board_no="+num;

      ResultSet rs = stmt.executeQuery(sql);

      if(rs.next()){

        String board_title = rs.getString(1);

        String board_writer = rs.getString(2);
        
        String board_type = rs.getString(3);
        
        String board_content = rs.getString(4);

  %>

  <table class="body">

    <tr>

      <th style="height:40px;">글제목</th>

      <td><%=board_title%></td>

    </tr>
     <tr>

      <th style="height:40px;">작성자</th>

      <td><%=board_writer%></td>

    </tr>
    
     <tr>

      <th style="height:40px;">질문유형</th>

      <td><%=board_type%></td>

    </tr>
    
    
    <tr>

      <th style="height:200px;">글내용</th>

      <td><%=board_content%></td>

    </tr>

  </table>
  <input type="hidden" id="board_no" name="board_no" value="<%= num %>">
  <%

      rs.close();

      stmt.close();

      conn.close();

      }

    }catch(SQLException e){

      out.println(e.toString());

    }

  %>


  <div class="btnDiv">

    <input type="button" id="update" value="수정">

    <input type="button" id="delete" value="삭제">

  </div>
</div>
</body>
</html>