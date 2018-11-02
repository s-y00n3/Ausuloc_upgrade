<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<!doctype html>
<html lang="ko">
<head>
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width, height=device-height">
<meta charset="utf-8">
<meta name="description" content="">
<meta name="keywords" content="">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="menu.css">
<script src="stayMenu.js"></script>
<script src="menu.js"></script>
<style type="text/css">
table.type06 {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    margin: 20px 10px;
}
table.type06 th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
}
table.type06 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
}
table.type06 .even {
    background: #red;
}
</style>
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

    Class.forName("com.mysql.jdbc.Driver"); // mysql 연동

    String url = "jdbc:mysql://localhost:3306/asl_board?serverTimezone=UTC&verifyServerCertificate=false&useSSL=false"; // mysql 데이터베이스명

    String mysql_id = "asl";   // mysql id값

    String mysql_pw = "0705";   // mysql pw값

    int total = 0;


    try{

      Connection conn = DriverManager.getConnection(url, mysql_id, mysql_pw);    // 실제 DB 연동시도

      Statement stmt = conn.createStatement();

      String totalSql = "select count(*) from board;";  // 총 글갯수를 찾는 sql문

      ResultSet rs = stmt.executeQuery(totalSql);


      if(rs.next()){            // 결과가 있다면 true값을 반환합니다

        total = rs.getInt(1);   // total에 전체 글 갯수 값 대입

      }


      // total은 나중에 페이징 처리시 사용


      String listSql = "select board_no, board_writer, board_type, board_title, board_date from board;"; // 전체 리스트를 가져오는 sql문

      rs = stmt.executeQuery(listSql);


      // try catch에서 오류가없을시에 출력되는 내용입니다

  %>

  <table class="type06" border="1">

    <tr>

      <th>글번호</th>

      <th>작성자</th>
      
      <th>질문유형</th>

      <th>글제목</th>

      <th>작성일자</th>

    <tr>


  <%

  // total이 0일때, 곧 게시글이 아무것도 없을때 출력되는 내용입니다.

    if(total==0){

  %>

    <tr>

      <td>게시글이 존재하지 않습니다</td>

    </tr>

  <%

  // total이 0이 아닐때 변수를 선언해주고 출력되는 내용을 순서에 맞게 대입하는 내용입니다.

    } else{

      while(rs.next()){ //rs값이 있을때까지 반복합니다.

        int board_no = rs.getInt(1);           // sql문의 첫번째 컬럼내용을 담습니다.

        String board_writer = rs.getString(2);   // sql문의 두번째 컬럼내용을 담습니다.

        String board_type = rs.getString(3);   // sql문의 두번째 컬럼내용을 담습니다.
        
        String board_title = rs.getString(4); // sql문의 세번째 컬럼내용을 담습니다.
		
        String board_date = rs.getString(5);

  // 실제 리스트가 출력되는 부분 입니다.

  %>

    <tr>

      <td><%=board_no%></td>

	  <td><%=board_writer%></td>
	  
	  <td><%=board_type%></td>
	  
      <td><a href="Detail.jsp?board_no=<%=board_no%>"><%=board_title %></a></td>

      <td><%=board_date%></td>

    </tr>
    
    

  <%

      }

    }

    rs.close();

    conn.close();

    stmt.close();

  }catch(SQLException e){

    out.println(e.toString());

  }

  %>
  </table>
      <a href="Write.jsp"><input type="button" value="글쓰기"></a>
</div>

</body>
</html>