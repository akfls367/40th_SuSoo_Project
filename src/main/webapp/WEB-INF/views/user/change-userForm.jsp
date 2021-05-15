<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8">
    <title> [ 유저 정보 바꾸기 ]</title>
    <link rel="stylesheet" href="/resources/css/change-uesrStyle.css">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script>
        function formCheck() {

            // 이름 
            var nm = document.getElementById("s_name").value;

            if (nm == null || nm.length == 0) {
                alert("이름을 입력해 주세요.");
                return false;
            }

            // 이메일
			var email = document.getElementById("s_email").value;

            if (email == null || email.length == 0) {
                alert("email을 입력해 주세요");
                return false;
            } 
            
            //핸드폰
			var phone = document.getElementById("s_phone").value;

            if (phone == null || phone.length == 0) {
                alert("번호를 입력해 주세요");
                return false;
            } 
            alert('회원정보변경이 완료되었습니다.')
            return true;
        }
    </script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
</head>
<body>
    <form action="/user/changeUser" method="post">
        <div class="bg-img">
            <div class="content">
                <header>SuSoo</header>

                <!-- 아이디 -->
                <div class="join-name">
                    <span class="red"> -</span> ID
                </div>
                <div class="field-rock">
                    <input type="text" id="s_id" name="s_id" value="${sessionScope.loginVO.s_id}" readonly="readonly">
                </div>

                <!-- 이름 -->
                <div class="join-name">
                    <span class="red"> -</span> <span> Name</span>
                </div>
                <div class="field">
                    <input type="text" id="s_name" name="s_name" title="이름을 입력해 주세요." value="${sessionScope.loginVO.s_name}">
                </div>

                <!-- 이메일 -->
                <div class="join-name">
                    <span class="red"> -</span> <span> Email</span>
                </div>
                <div class="field">
                    <input type="email" id="s_email" name="s_email" title="Email을 입력해 주세요." value="${sessionScope.loginVO.s_email}" />
                </div>

                <!-- 핸드폰 -->
                <div class="join-name">
                    <span class="red"> -</span> <span> Phone</span>
                </div>
                <div class="field">
                    <input type="text" id="s_phone" name="s_phone" pattern="(010)-\d{3,4}-\d{4}" title="핸드폰 번호 ex) 010-0000-0000" value="${sessionScope.loginVO.s_phone}">
                </div>

                <!-- 성별 -->
                <div class="join-name">
                    <span class="red"> -</span> <span> Gender</span>
                </div>
                <div class="radio">
					<input type="checkbox" id="s_gender" name="s_gender" checked="checked" value="남자">
					<img src="/resources/img/male.png" id="gendericon" /> <span> 남자 </span>
					<input type="checkbox" id="s_gender" name="s_gender" value="여자"> 
					<img src="/resources/img/female.png" id="gendericonF" />  <span> 여자 </span>
                </div>

                <!-- 리셋 / 회원가입 -->
				<div class="formbutton">
					<input type="button" value="뒤로가기" onclick="history.go(-1)" /> 
					<input type="submit" value="회원정보 수정" onclick="return formCheck();" />
				</div>
			</div>
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js" integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi" crossorigin="anonymous"></script> 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js" integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG" crossorigin="anonymous"></script>
</body>
