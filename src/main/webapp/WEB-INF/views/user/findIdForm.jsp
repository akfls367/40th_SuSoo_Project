<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>[ 아이디 찾기 ]</title>
    <link rel="stylesheet" href="/resources/css/idStyle.css">
   <script src="https://kit.fontawesome.com/a076d05399.js"></script>
   <script type="text/javascript">
   window.onload = function(){
	   var id = document.getElementById("s_id").value;
	   var err = document.getElementById("err").value;

	   if(id.length == 0 && err.length == 0){
			return false;
		}else if(id.length != 0){
			alert('당신의 id는 ' + id + ' 입니다.');
			document.location.href = "/";
		}else if(err.length != 0){
			alert(err);
			document.location.href = "/user/findIdForm";
		}
		
	return true;
   }
</script>
  </head>
  <body>
      <div class="bg-img">
          <div class="content">
              <header>SuSoo</header>
              <form action="/user/findId" method = "get">
                  <!-- 이름 -->
                  <div class="join-name">
                      <span class="red"> -</span> <span> Name</span>
                  </div>
                  <div class="field">
                      <input type="text" id="s_name" name="s_name" title="이름을 입력해 주세요." required placeholder="  이름을 입력해 주세요.">
                  </div>

                  <!-- 핸드폰 -->
                  <div class="join-name">
                      <span class="red"> -</span> <span> Phone</span>
                  </div>
                  <div class="field">
                      <input type="text" id="s_phone" name="s_phone" pattern="(010)-\d{3,4}-\d{4}" title="핸드폰 ex) 010-0000-0000" required placeholder="  핸드폰 번호를 입력해 주세요.">
                  </div>

                  <!-- 뒤로가기 / ID찾기 -->
                  <div class="formbutton">
                      <input type="button" value="뒤로가기" onclick="history.back(-1)"/> <input type="submit" value="ID 찾기"/>
                  </div>
              </form>
                  <input type="hidden" id="s_id" value="${s_id }">
                  <input type="hidden" id="err" value="${errMsg }">
		</div>
      </div>
	
  </body>
  
</html>
