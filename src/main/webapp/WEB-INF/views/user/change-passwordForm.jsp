<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8">
    <title> [ 비밀번호 변경 ]</title>
    <link rel="stylesheet" href="/resources/css/change-password.css">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script>
        function formCheck() {

        // 새로운 비밀번호 입력
        var pw = document.getElementById("s_pw").value;
        var npw = document.getElementById("s_npw").value;
        var pwCheck = document.getElementById("pw_check").value;

        
        if (pw == null || pw.length == 0) {
            alert("비밀번호를 입력해 주세요");
            return false;
        }
        
        if (npw == null || npw.length == 0) {
            alert("새 비밀번호를 입력해 주세요");
            return false;
        } else if (npw.length < 5 || npw.length > 12) {
            alert("새 비밀번호는 5글자 ~ 12글자 사이로 입력해 주세요.");
            return false;
        } else if (npw != pwCheck) {
            alert("새 비밀번호를 다시 확인해 주세요.");
            return false;
            }

        alert("비밀번호변경이 완료되었습니다.");
            return true;
        }
    </script>
</head>
<body>
    <h1 class="ss-title"></h1>
    <div class="bg-img">

        <div class="content">
            <header>SuSoo</header>
            <form action="/user/changePw" method="post" onsubmit="return formCheck();">
            
                <!-- 아이디 -->
                <div class="join-name">
                    <span class="red"> -</span> ID
                </div>
                <div class="field-rock">
                    <input type="text" id="s_id" name="s_id" value="${sessionScope.loginVO.s_id}" readonly="readonly">
                </div>

                <!-- 현재 비밀번호 -->
                <div class="join-name">
                    <span class="red"> -</span> <span> 현재 비밀번호</span>
                </div>
                <div class="field">
                    <input type="password" id="s_pw" name="s_pw" minlength="5" maxlength="12" title="비밀번호를 입력해 주세요." required placeholder="  현재 비밀번호를 입력해 주세요.">
                </div>

                <!-- 새로운 비밀번호 -->
                <div class="join-name">
                    <span class="red"> -</span> <span> 새 비밀번호</span>
                </div>
                <div class="field">
                    <input type="password" id="s_npw" name="s_npw" minlength="5" maxlength="12" title="새 비밀번호를 입력해 주세요." required placeholder="  새 비밀번호를 입력해 주세요.">
                </div>

                <!-- 새로운 비밀번호 확인-->
                <div class="join-name">
                    <span class="red"> -</span> <span> 새 비밀번호 확인</span>
                </div>
                <div class="field">
                    <input type="password" id="pw_check" name="pw_check" minlength="5" maxlength="12" title="새 비밀번호를 다시 입력해 주세요." required placeholder="  새 비밀번호를 다시 입력해 주세요.">
                </div>

                <!-- 뒤로가기 / 비밀번호 변경 -->
                <div class="formbutton">
                    <input type="button" value="뒤로가기" onclick="history.back(-1)" /> <input type="submit" value="PW 변경" />
                </div>
            </form>
        </div>
    </div>
</body>
</html>
