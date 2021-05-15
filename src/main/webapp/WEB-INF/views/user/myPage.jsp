<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8">
    <title>[ マイページ ]</title>
    <title>Transparent Login Form UI</title>
    <link rel="stylesheet" href="/resources/css/myPageStyle.css">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script>
        function logout() {
            if (confirm("ログアウトしますか？")) {
                location.href = "/user/logout";
            }
        }
    </script>
<!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-info">
		<div class="container-fluid">
			<a class="navbar-brand fs-3 fw-bold" href="/home">SuSoo</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link fw-bolder"
						href="/home">翻訳窓</a></li>
					<li class="nav-item"><a class="nav-link fw-bolder"
						href="/word/wordNote">単語帳</a></li>
				</ul>
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link fw-bolder" href="#"
						onclick="return logout();">ログアウト</a></li>
					<li class="nav-item"><a class="nav-link fw-bolder"
						href="/user/myPage">マイページ</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="bg-img">

		<div class="content">

			<div class="content1">
				<div class="mypage-main">
					<h3 class="header">My page</h3>
					<br />

					<table>
						<tr>
							<td width="120" height="45" class="line"><span class="red">
									-</span> ID</td>
							<td class="line"><span> ${sessionScope.loginVO.s_id}
							</span></td>
						</tr>

						<tr>
							<td width="120" height="45" class="line"><span class="red">
									-</span> 名前</td>
							<td class="line"><span>
									${sessionScope.loginVO.s_name} </span></td>
						</tr>

						<tr>
							<td width="120" height="45" class="line"><span class="red">
									-</span> Email</td>
							<td class="line"><span>
									${sessionScope.loginVO.s_email} </span></td>
						</tr>

						<tr>
							<td width="120" height="45" class="line"><span class="red">
									-</span> Phone</td>
							<td class="line"><span>
									${sessionScope.loginVO.s_phone} </span></td>
						</tr>

					</table>
				</div>
			</div>

			<div class="content2">
				<div class="mypage-sub">
					<h3 class="header">SuSoo</h3>
					<br />

					<table class="change">
						<tr>
							<td width="170" height="45"><span class="red-s"> -</span> <a
								class="a-tag" href="/user/change-userForm"> 会員情報の変更</a></td>
							<td width="170" height="45"><span class="red-s"> -</span> <a
								class="a-tag" href="/user/change-passwordForm"> パスワード変更</a></td>
						</tr>
					</table>
					<br />
					<table class="word">
						<tr>
							<td width="130" height="100" class="text"><strong>すべての単語</strong><br /> <br/>
									<button class="btn mb-5"   onclick="window.open('../word/wordListForm','window','location=no, directories=no,resizable=no,status=no,toolbar=no,menubar=no, width=600,height=450,left=0, top=0, scrollbars=yes');return false">
                                      <img src="/resources/img/all.png" width="64" height="64" style="margin-bottom:3px;"/>
                                  	</button>
									</td>
							<td width="130" class="text"><strong>未暗記</strong><br /> <br/>
							<button class="btn mb-5"   onclick="window.open('../word/wordListForm','window','location=no, directories=no,resizable=no,status=no,toolbar=no,menubar=no, width=600,height=450,left=0, top=0, scrollbars=yes');return false">
                                      <img src="/resources/img/mi.png" width="64" height="64" style="margin-bottom:3px;"/>
                                  </button>
							</td>
							<td width="130" class="text"><strong>空覚え</strong><br /> <br/>
							<button class="btn mb-5"   onclick="window.open('../word/wordListForm','window','location=no, directories=no,resizable=no,status=no,toolbar=no,menubar=no, width=600,height=450,left=0, top=0, scrollbars=yes');return false">
                                      <img src="/resources/img/am.png" width="64" height="64" style="margin-bottom:3px;"/>
                                  </button>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>

</body>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js" integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js" integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG" crossorigin="anonymous"></script>
</html>