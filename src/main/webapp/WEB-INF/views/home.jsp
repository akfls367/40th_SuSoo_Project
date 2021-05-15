<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%> 
<!doctype html>
<html lang="ja">
  <head>
  <meta charset="UTF-8">
  <title>[メイン画面]</title>
  <!-- 자바스크립트 번역 -->
  <script src="/resources/js/jquery-3.2.1.min.js"></script>
   <script type="text/javascript">      

   function formCheck() {
       // 단어 입력 
       var word = document.getElementById("word").value;

       if (word == null || word.length == 0) {
           alert("翻訳する単語を選択してください。");
           return false;
       }

       var meaning = document.getElementById("meaning").value;

       if (meaning == null || meaning.length == 0) {
           alert("翻訳された単語がありません。");
           return false;
       }

       var title = document.getElementById("wordlist_num").value;

       if (title == 0 || title.length == 0){
          alert("選択された掲示板がありません。");
          return false;
       }


     alert("単語が保存されました！");
       return true;
   }
   
   $(function(){
      $("#translate").on("click",function(){
         var source = $("#source").val();
         var target = $("#target").val();
         var text = $("#text").val();

         $.ajax({
            url : '../translate',
            type : 'post',
            data : {
               source : source,
               target : target,
               text : text
            },
            success : function(data){
               //JSON 형태의 문자열을 JSON 객체로 변환
               var jsonObject = JSON.parse(data);
               console.log(jsonObject);
               
               $("#translatedText").html(jsonObject.message.result.translatedText);
            },
            error : function(e){
               console.log(e);   
            }
         });
         
      });
   });

   $(function(){
      $("#saveTranslate").on("click",function(){
         var source = $("#source").val();
         var target = $("#target").val();
         var text = $("#word").val();

         $.ajax({
            url : '../saveTranslate',
            type : 'post',
            data : {
               source : source,
               target : target,
               text : text
            },
            success : function(data){
               //JSON 형태의 문자열을 JSON 객체로 변환
               var jsonObject = JSON.parse(data);
               console.log(jsonObject);
               
               $("#meaning").html(jsonObject.message.result.translatedText);
            },
            error : function(e){
               console.log(e);   
            }
         });
         
      });
   });
   function logout() {
		if (confirm("ログアウトしますか？")) {
			location.href = "/user/logout";
		}
	}
   </script>
   
   <script type="text/javascript">

   

   
   $(function(){
      $("#changebtn").on("click",function(){
         var temp = document.getElementById($("#source")).val();
         var source = document.getElementById($("#target")).val();
         var target = document.getElementById($("#temp").val();

         alert($("#source option:selected").val());
         alert($("#target option:selected").val());
         alert($("#temp option:selected").val());
         })
   });
   
   </script>
    <!-- Required meta tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">

    <title>SuSoo</title>
  </head>
  <body>
      <!-- nav var -->
      <nav class="navbar navbar-expand-lg navbar-dark bg-info">
          <div class="container-fluid">
              <a class="navbar-brand fs-3 fw-bold" href="home">SuSoo</a>
              <button class="navbar-toggler" type="button"
                      data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                      aria-controls="navbarSupportedContent" aria-expanded="false"
                      aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarSupportedContent">
                  <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                      <li class="nav-item">
                          <a class="nav-link fw-bolder" href="home">翻訳窓</a>
                      </li>
                      <li class="nav-item">
                          <a class="nav-link fw-bolder"
                             href="/word/wordNote">単語帳</a>
                      </li>
                  </ul>
                  <ul class="navbar-nav ml-auto">
                       <li class="nav-item">
                          <span class=" nav-link fw-bolder mb-2">${sessionScope.s_name }さん歓迎します!</span>
                       </li>
                      <li class="nav-item">
                          <a class="nav-link fw-bolder" href="#" 
                          onclick="return logout();">ログアウト</a>
                      </li>
                      <li class="nav-item">
                          <a class="nav-link fw-bolder"
                             href="/user/myPage">マイページ</a>
                      </li>
                  </ul>
              </div>
          </div>
      </nav>

      <!-- 번역 -->
      <div class="row mt-5">
          <div class="col-sm-6">
              <div class="container">
                  <div class="card mx-5 me-0">
                      <div class="card-body">
                          <div>
                              <span class="fw-bolder">翻訳する言語</span> <select id="source" class="btn mb-2 btn-outline-secondary" style="margin-left:20px;">
                                  <option value="ko">韓国語</option>
                                  <option value="en">英語</option>
                                  <option value="ja">日本語</option>
                                  <option value="es">スペイン語</option>
                                  <option value="fr">フランス語</option>
                              </select>
                              <!-- <!-- 언어 스왑 버튼 -->
                              <button class="btn btn-outline" style="float:right" id="changebtn" name="changebtn">
                                  <!-- <img src="/resources/img/change.png" width="20" height="20"/> -->
                              </button>
                          </div>
                          <div class="mt-2">
                              <div class="form-floating">
                                  <textarea class="form-control" style="height: 200px;"
                                            placeholder="Leave a comment here" id="text"></textarea>
                                  <label for="floatingTextarea">翻訳内容を入力してください。</label>
                              </div>
                          </div>
                          <div align="right">
                              <button type="button"
                                      class="btn btn-info btn-lg mt-2 text-light fw-bolder"
                                      id="translate" style="height:50px;">
                                  翻訳する
                              </button>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
          
          <div class="col-sm-6">
              <div class="container">
                  <div class="card mx-0 me-5">
                      <div class="card-body" style="height: 343.2px;">
                          <div>
                              <span class="fw-bolder">翻訳された言語</span> <select id="target" class="btn mb-2 btn-outline-secondary" style="margin-left:20px; text-align:center;">
                                  <option value="ko">韓国語</option>
                                  <option value="en" selected="selected">英語</option>
                                  <option value="ja">日本語</option>
                                  <option value="es">スペイン語</option>
                                  <option value="fr">フランス語</option>
                              </select>
                          </div>
                          <div class="mt-2">
                              <div class="form-floating" id="translatedText">
                                  <textarea class="form-control" style="height: 200px; background-color: white;" readonly="readonly"
                                            placeholder="Leave a comment here" id="translatedText1"></textarea>
                                  <!--  <label for="floatingTextarea"></label>-->
                              </div>
                              <!--  <button type="button" class="btn btn-info btn-lg mt-2 text-white">+단어장 저장</button>-->
                          </div>
                      </div>
                  </div>
              </div>
          </div>
      </div>

   <form action="/word/words" method="post" onsubmit="return formCheck();">
      <!-- 저장 -->
      <div class="row mt-5">
          <div class="col-sm-6">
              <div class="container">
                  <div class="card mx-5 me-0">
                      <div class="card-body">
                          <div class="mt-2">
                              <div class="form-floating">
                                  <textarea class="form-control" style="height: 60px; padding: 17px;"
                                            placeholder="Leave a comment here" id="word" name="word"></textarea>
                              </div>
                          </div>
                          <input type="hidden" id="s_id" name="s_id" value="${sessionScope.s_id }">
                          <div align="right">
                              <div class="btn mt-2 btn-outline-info" style="width: 270px; height:50px;">
                                  <select class="btn mb-5 btn-outline" id="wordlist_num" name="wordlist_num">
                                      <option value="0">--- 掲示板選択 ---</option>
                                      <c:forEach items="${list }" var="wordl">
                                         <option value="${wordl.WORDLIST_NUM }">${wordl.TITLE }</option>
                                      </c:forEach>
                                  </select>
                                  <button class="btn mb-5"   onclick="window.open('../word/wordListForm','window','location=no, directories=no,resizable=no,status=no,toolbar=no,menubar=no, width=600,height=450,left=0, top=0, scrollbars=yes');return false">
                                      <img src="/resources/img/plus.png" width="17" height="20" style="margin-bottom:3px;"/>
                                  </button>
                              </div>
                              <button type="submit"
                                      class="btn btn-info btn-lg mt-2 text-light fw-bolder"style="height:50px;">
                                  単語保存
                              </button>
                              <button type="button"
                                      class="btn btn-info btn-lg mt-2 text-light fw-bolder"
                                      id="saveTranslate" style="height:50px;">
                                  翻訳する
                              </button>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
          <div class="col-sm-6">
              <div class="container">
                  <div class="card mx-0 me-5">
                      <div class="card-body" style="height: 158px;">
                          <div class="mt-2">
                              <div class="form-floating" id="translatedText">
                                  <textarea class="form-control" style="height: 60px; padding: 17px; background-color: white;" readonly="readonly"
                                            placeholder="Leave a comment here" id="meaning" name="meaning"></textarea>
                                  <!--  <label for="floatingTextarea"></label>-->
                              </div>
                              <!--  <button type="button" class="btn btn-info btn-lg mt-2 text-white">+단어장 저장</button>-->
                          </div>
                      </div>
                  </div>
              </div>
          </div>
      </div>
      </form>
      <br>
      <!-- footer -->
      <div class="text-center">
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
  <script>

</script>


</html>