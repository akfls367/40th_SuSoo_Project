<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
  <head>
  <script type="text/javascript" src="/resources/js/jquery-3.2.1.min.js"></script>
  <script type="text/javascript">
  
			function logout() {
				if (confirm("로그아웃 하시겠습니까?")) {
					location.href = "/user/logout";
				}
			}

			function hideWord() {
				$(".card-header").each(function(index,item){
					$(this).css("background-color","#212529");
				});
			};

			function hideMeaning() {
				$(".card-title").each(function(index,item){
					$(this).css("background-color","#212529");
				});
			};

			function Original() {
				$(".card-header").each(function(index,item){
					$(this).css("background-color","#f0f1f2");
				});
				$(".card-title").each(function(index,item){
					$(this).css("background-color","#f8f9fa");
				});
			};
		</script>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">

    <title>SuSoo</title>
  </head>
  <body>
  
  <!-- nav var -->
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
						href="/home">번역창</a></li>
					<li class="nav-item"><a class="nav-link fw-bolder"
						href="/word/wordNote">단어장</a></li>
				</ul>
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link fw-bolder" href="#"
						onclick="return logout();">로그아웃</a></li>
					<li class="nav-item"><a class="nav-link fw-bolder"
						href="/user/myPage">마이페이지</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- 숨김 기능 -->
	<div class="container mt-2">
		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			<button class="btn btn-light me-md-2" type="button" onclick="return hideWord();">단어 숨김</button>
			<button class="btn btn-light" type="button" onclick="return hideMeaning();">뜻 숨김</button>
			<button class="btn btn-light" type="button" onclick="return Original();">원래대로</button>
		</div>
	</div>
	
	<!-- content -->
	<c:forEach items="${words }" var="words">
		<c:if test="${words.checking == 1 }">
			<div class="container">
				<div class="row mt-2">
					<div class="col" style="background-color: #f8f9fa">
						<div class="card text-dark bg-light mb-3 mt-3">
							<div class="card-header">${words.word }</div>
							<div class="card-body">
								<h5 class="card-title">${words.meaning }</h5>
							</div>
						</div>
						<div class="card text-dark bg-light mb-3">
							<div class="card-body">${words.indate }
								<a href="/word/deleteWord?word_num=${words.word_num }&num=1"><img class="rounded float-end" alt="trash" src="/resources/img/trashcan.png"></a>
								<a href="/word/toNotMemoWord?word_num=${words.word_num }"><img class="rounded float-end me-3" alt="check" src="/resources/img/check1.png" style="width: 22px"></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:if>
	</c:forEach>
	
	

	<!-- footer -->
	<div class = "text-center">
		<hr />
		<p>2021 SCIT, SuSoo Project</p>
		イ·スヨン<br>
		コ·ビョンス
	</div>
	
    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js" integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js" integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG" crossorigin="anonymous"></script>
    -->
  </body>
</html>

