<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!doctype html>
<html lang="en">
  <head>
  <script type="text/javascript">
  
			function logout() {
				if (confirm("ログアウトしますか？")) {
					location.href = "/user/logout";
				}
			}
			
			function delete1() {
				if (confirm("삭제하시겠습니까?")) {
					location.href = "/word/deleteWordNote?wordlist_num=${wordl.WORDLIST_NUM }";
				}
			}
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

	<!-- content -->
	<div class="container">
		<div class="row mt-2" style="background-color: #f8f9fa">
			<div class="row row-cols-1 row-cols-md-3 g-4 text-center mb-5 mx-auto" style="width: 400px">
				<div class="col">
					<div class="card h-100">
						<div class="card-body">
							<h5 class="card-title fw-bold">
								<a href="/word/words" style="color: black; text-decoration: none;">
									全体
								</a>
							</h5>
						</div>
						<div class="card-footer">
							<small class="text-muted fw-bolder">${cnt }</small>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card h-100">
						<div class="card-body">
							<h5 class="card-title fw-bold">
								<a href="/word/notMemoWords" style="color: black; text-decoration: none;">
									未暗記
								</a>
							</h5>
						</div>
						<div class="card-footer">
							<small class="text-muted fw-bolder">${notMemoCnt }</small>
						</div>
					</div>
				</div>
				<div class="col">
					<div class="card h-100">
						<div class="card-body">
							<h5 class="card-title fw-bolder">
								<a href="/word/memoWords" style="color: black; text-decoration: none;">
									空覚え
								</a>
							</h5>
						</div>
						<div class="card-footer">
							<small class="text-muted fw-bolder">${memoCnt }</small>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row mt-2">
			<div class="col" style="background-color: #f8f9fa">
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">単語帳の一覧</th>
							<th scope="col"></th>
							<th scope="col"></th>
							<th scope="col" class="text-end">
							<a type="button"><img alt="" src="/resources/img/plus.png" onclick="window.open('../word/wordListForm','window','location=no, directories=no,resizable=no,status=no,toolbar=no,menubar=no, width=600,height=450,left=0, top=0, scrollbars=yes');return false"></a>
							</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list }" var="wordl">
							<tr>
								<th><a href="/word/wordList?wordlist_num=${wordl.WORDLIST_NUM }&s_id=${sessionScope.loginID}" style="color: black; text-decoration: none;">${wordl.TITLE }</a>
								</th>
								<th scope="col"></th>
								<th scope="col"></th>
								<th scope="col" class="text-end">
									<a href="/word/deleteWordNote?wordlist_num=${wordl.WORDLIST_NUM }" >
										<img class="text-end" alt="trash" src="/resources/img/trashcan.png">
									</a>
								</th>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
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