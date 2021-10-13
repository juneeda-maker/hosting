<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
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
	          <a class="nav-link" href="#">Features</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="/community/community">커뮤니티</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="#">About</a>
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
	      <form class="d-flex">
	        <input class="form-control me-sm-2" type="text" placeholder="Search">
	        <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
	      </form>
	    </div>
	  </div>
	</nav>
	
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">Board Read Page</div>
				<div class="panel-body">
						<div class="form-group">
							<label>Bno</label>
							<input class="form-control" name='bno' value='<c:out value="${board.bno }"/>' readonly="readonly">
						</div>
						
						<div class="form-group">
							<label>Text area</label>
							<textarea class="form-control" rows="3" name='content' readonly="readonly"><c:out value="${board.content }" /></textarea>
						</div>
						
						<div class="form-group">
							<label>Writer</label>
							<input class="form-control" name='writer' value='<c:out value="${board.writer }"/>' readonly="readonly">
						</div>
						
						<button data-oper='modify' class="btn btn-default">Modify</button>
						<button data-oper='community' class="btn btn-info">List</button>
						
						<form id='operForm' action="/community/modify" method="get">
							<input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno }"/>'>
							<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
							<input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
						</form>
					
				</div>
			</div>
		</div>
	</div>
	
  <script type="text/javascript">
  	$(document).ready(function(){
  		var operForm = $("#operForm");
  		
  		$("button[data-oper='modify']").on("click", function(e){
  			operForm.attr("action", "/community/modify").submit();
  		});
  		
  		$("button[data-oper='community']").on("click", function(e){
  			operForm.find("#bno").remove();
  			operForm.attr("action","/community/community")
  			operForm.submit();
  		});
  	});
  </script>
 

	    
    

    </body>
</html>