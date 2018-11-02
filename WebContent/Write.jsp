<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width, height=device-height">
<meta charset="utf-8">
<script src="//code.jquery.com/jquery.min.js"></script>
<link rel="stylesheet" href="menu.css">
<script src="stayMenu.js"></script>
<script src="menu.js"></script>
<meta name="description" content="">

    <meta name="keywords" content="">

    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>

    <script language = "javascript"> // 자바 스크립트 시작


      function Insert()

        {

        var insertFrm = document.insertFrm;

        if( !insertFrm.board_title.value ){

          alert( "글제목을 적어주세요" );

          insertFrm.board_title.focus();

          return;

         }
		
        if( !insertFrm.board_writer.value ){

            alert( "작성자를 적어주세요" );

            insertFrm.board_writer.focus();

            return;

           }


        if( !insertFrm.board_content.value ){

          alert( "글내용을 적어주세요" );

          insertFrm.board_content.focus();

          return;

         }


        insertFrm.submit();

        }


   </script>
   <script>
function getSelectValue(frm)
{
 frm.textValue.value = frm.type.options[frm.type.selectedIndex].text;
}
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
<form name="insertFrm" id="insertFrm" action="insert.jsp">

    <table class="body">

      <tr>

        <th>글제목</th>

        <td><input type="text" id="board_title" name="board_title"></td>

      </tr>

	<tr>

        <th>작성자</th>

        <td><input type="text" id="board_writer" name="board_writer"></td>

      </tr>
      
      <tr>



        <th>질문유형</th>
        <td>
        <select name="board_type" onChange="getSelectValue(this.form);">
        <option value="모바일">모바일</option>
        <option value="데스크탑">데스크탑</option>
        <option value="기타">기타</option>
        </select>
        </td>

      </tr>
	
      <tr>

        <th>글내용</th>

        <td><textarea id="board_content" name="board_content"></textarea></td>

      </tr>

    </table>

  </form>

  <div class="Btn">

    <input type="button" value="등록" id="insert" OnClick="javascript:Insert();">

  </div>

</div>
</body>

</html>