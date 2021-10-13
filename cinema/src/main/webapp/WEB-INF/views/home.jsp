<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="en">
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.1.1.min.js"> 
        <!-- Core theme JS-->
        
        <script src="/resources/js/scripts.js"></script>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Bare - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="/resources/assets/favicon.ico" />
        <!-- Core theme resources/css (includes Bootstrap)-->
        <link href="/resources/css/bootstrap.min.css" rel="stylesheet" />
    </head>
    <body>
        <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  		<div class="container-fluid">
    	<a class="navbar-brand" href="home">movienet</a>
    	<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
      	<span class="navbar-toggler-icon"></span>
    	</button>

	    <div class="collapse navbar-collapse" id="navbarColor02">
	      <ul class="navbar-nav me-auto">
	        <li class="nav-item">
	          <a class="nav-link active" href="home">Home
	            <span class="visually-hidden">(current)</span>
	          </a>
        	</li>
        	<li class="nav-item">
	          <a class="nav-link" href="/community/community">커뮤니티</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="customLogin">로그인</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="signup">회원가입</a>
	        </li>
	        <li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Dropdown</a>
	          <div class="dropdown-menu">
	            <a class="dropdown-item" href="#">Action</a>
	            <a class="dropdown-item" href="#">Another action</a>
	            <a class="dropdown-item" href="#">Something else here</a>
	            <div class="dropdown-divider"></div>
	            <a class="dropdown-item" href="#">Separated link</a>
	          </div>
	        </li>
	      </ul>
	      
	      <sec:authorize access="isAnonymous()">
	      	<a href="/customLogin">로그인</a>
	     </sec:authorize>
	     <sec:authorize access="isAuthenticated()">
	      	<a href="/customLogout">로그아웃</a>
	     </sec:authorize>
	      
	      <p>
	      <sec:authorize access="isAuthenticated()">
	      	<sec:authentication property="principal.username" var="userid" />
                    <div id="user_id">안녕하세요. ${userid }</div>
	     </sec:authorize>
	    </p>
	     
	    </div>
	  </div>
	</nav>
	<!--  검색 파트  -->
	
	<form action="result" method="post">
	  	<div style="width:70%; margin:auto;" class="form-group">
	      <label for="exampleInputEmail1" class="form-label mt-4">영화 검색</label>
	      <input class="form-control" id="keyword" name="keyword" onKeyUp="find()"
	      			placeholder="영화 제목" value="">
	      <small id="emailHelp" class="form-text text-muted">검색할 영화 제목을 입력해주세요.</small>
	    </div>
	    
	  	<div style="width:70%; margin:auto;" class="d-grid gap-2">
			  <button class="btn btn-lg btn-success btn-block" type="submit" onclick="find()">영화 찾기</button>
		</div>
	    
	    <div id="result2"></div>
    
	</form>
	
	
	<script>
		function find(){
			var keyword = $('#keyword').val();
			$.ajax({
				type: "GET",
				url: "/search.do", 
				data: {keyword : keyword},
				dataType: "json",
				contentType: "application/json; charset:UTF-8",
				error: function(error){
					console.log("error");
				},
				success: function(data){
					$("#result2").empty();
					console.log("success");
					console.log(data);
					
					var html = "";
					var item = data.items;
					
					html += '<table class = "table"><thead><tr><th scope="col">영화 제목</th></tr></thead>';
					html += '<tbody>';
					
					
					for(var i in item){
						
						var title = item[i].title;
						
						html += '<tr>';
						html += '<td>';
						html += title;
						html +=  '</td>';
						html += '</tr>';
						
						
						$('#keyword').empty();
						title = "";
					}
					
					html += '</tbody></table>';
					$("#result2").append(html);
				}
			});
		}
		
		
		
	</script>

    </body>
</html>

