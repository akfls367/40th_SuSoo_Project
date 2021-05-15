<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title> [ 비밀번호 찾기 ] </title>
    <link rel="stylesheet" href="/resources/css/pwStyle.css">
   <script src="https://kit.fontawesome.com/a076d05399.js"></script>
   <script type="text/javascript">
   window.onload = function(){
	   var pw = document.getElementById("s_pw").value;
	   var err = document.getElementById("err").value;

	   if(pw.length == 0 && err.length == 0){
			return false;
		}else if(pw.length != 0){
			alert('당신의 PW는 ' + pw + ' 입니다.');
			document.location.href = "/";
		}else if(err.length != 0){
			alert(err);
			document.location.href = "/user/findPwForm";
		}
		
	return true;
   }
   </script>
  </head>
  <body>
      <div class="bg-img">
          <div class="content">
              <header>SuSoo</header>
              <form action="/user/findPw" method="get">
                  <!-- 아이디 -->
                  <div class="join-name">
                      <span class="red"> -</span> ID
                  </div>
                  <div class="field">
                      <input type="text" id="s_id" name="s_id" minlength="5" maxlength="12" title="ID를 입력해 주세요." required placeholder="  ID를 입력해 주세요.">
                  </div>

                  <!-- 이메일 -->
                  <div class="join-name">
                      <span class="red"> -</span> <span> Email</span>
                  </div>
                  <div class="field">
                      <input type="email" id="s_email" name="s_email" title="Email을 입력해 주세요." required placeholder="  email을 입력해 주세요.">
                  </div>

                  <!-- 뒤로가기 / PW찾기 -->
                  <div class="formbutton">
                      <input type="button" value="뒤로가기" onclick="history.back(-1)" /> <input type="submit" value="PW 찾기" />
                  </div>
              </form>
                  <input type="hidden" id = "s_pw" value="${s_pw }">
                  <input type="hidden" id = "err" value="${errMsg }">
          </div>
      </div>


  </body>
</html>
