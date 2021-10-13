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
    	<a class="navbar-brand" href="/home">movienet</a>
    	<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
      	<span class="navbar-toggler-icon"></span>
    	</button>

	    <div class="collapse navbar-collapse" id="navbarColor02">
	      <ul class="navbar-nav me-auto">
	        <li class="nav-item">
	          <a class="nav-link active" href="/home">Home
	            <span class="visually-hidden">(current)</span>
	          </a>
        	</li>
	        <li class="nav-item">
	          <a class="nav-link" href="/community/community">커뮤니티</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="/customLogin">로그인</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="/signup">회원가입</a>
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
	    </div>
	  </div>
	</nav>
	
	
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    	<div class="modal-dialog">
    		<div class="modal-content">
    			<div class="modal-header">
    				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    				<h4 class="modal-title" id="myModalLabel">게시글 등록</h4>
    			</div>
    			<div class="modal-body">처리가 완료되었습니다.</div>
    			<div class="modal-footer">
    				<button type="button" class="btn btn-default" data-bs-dismiss="modal">Close</button>
    				<button type="button" class="btn btn-primary">Save Changes</button>
    			</div>
    		</div>
    	</div>
    </div>

	
	<!--  검색 파트  -->


	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-panel panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Please Sign In</h3>
					</div>
					<div class="panel-body">
						<form role="form" method='post' action="/login">
							<fieldset>
								<div class="form-group" style="margin:20px;">
									<input class="form-control" placeholder="userid"
										name="username" type="text" autofocus>
								</div>
								<div class="form-group" style="margin:20px;">
									<input class="form-control" placeholder="Password"
										name="password" type="password" value="">
								</div>
								<!--  
								<div class="checkbox">
									<label> <input name="remember-me" type="checkbox">Remember
										Me
									</label>
								</div>
								-->
								<c:if test="${error eq 'N' }">
									<small id="emailHelp" class="form-text text-muted">존재하지 않는 아이디 혹은 비밀번호가 틀립니다.</small>
								</c:if>
								<!-- Change this to a button or input when using this as a form -->
								<a class="btn btn-lg btn-success btn-block" style="margin:20px;">Login</a>
							</fieldset>
							<!--  
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
							-->
						</form>
						   
    
					</div>
				</div>
			</div>
		</div>
	</div>
	
    

    
    
   
	<script type="text/javascript">
	
    
    	$(".btn-success").on("click",function(e){
			 e.preventDefault();
		    $("form").submit();
    	});  
		    
		
	</script>
	
</body>
</html>
