<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.1.1.min.js"> 
        <script src="/resources/js/scripts.js"></script>
        <!-- Core theme JS-->
        
       
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
	
	<div class="panel-heading">커뮤니티 게시판
		<button id='regBtn' type="button" class="btn btn-xs pull-right">게시글 등록하기</button>
	</div>
	
	<!--  검색 파트  -->
	<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">번호</th>
      <th scope="col">제목</th>
      <th scope="col">작성자</th>
      <th scope="col">작성일</th>
      <th scope="col">수정일</th>
    </tr>
  </thead>
  
  <c:forEach items="${list}" var="board">
  	<tr class="table-active">
  		<td><c:out value="${board.bno }" /></td>
  		<td><a class='move' href='<c:out value="${board.bno }"/>'>
  			<c:out value="${board.title }"/></a></td>
  		<td><c:out value="${board.writer }" /></td>
  		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate }" /></td>
  		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate }" /></td>
  	</tr>
  </c:forEach>
</table>

<!--  
<div class='pull-right'>
	<ul class="pagination">
		<c:if test="${pageMaker.prev }">
			<li class="paginate_button previous"><a href="#">Previous</a></li>
		</c:if>
		<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
			<li class="paginate_button"><a href="#">${num }</a></li>
		</c:forEach>
		<c:if test="${pageMaker.next }">
			<li class="paginate_button next"><a href="#">Next</a></li>
		</c:if>
	</ul>
</div>
-->
	<ul class="pagination">
		<c:if test="${pageMaker.prev }">
		    <li class="page-item">
		      <a class="page-link" href="${pageMaker.startPage -1 }">Previous</a>
		    </li>
		</c:if>
		<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
		    <li class="page-item ${pageMaker.cri.pageNum == num ? 'active':''} "><a class="page-link" href="${num }">${num }</a></li>
		</c:forEach>
			<c:if test="${pageMaker.next }">
		    	<li class="page-item">
	     			 <a class="page-link" href="${pageMaker.endPage + 1 }">Next</a>
	    		</li>
		</c:if>
		    
	</ul>


<form id='actionForm' action="/community/community" method='get'>
	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum }'>
	<input type='hidden' name='amount' value='${pageMaker.cri.amount }'>
</form>

</body>

<script type="text/javascript">
	$(document).ready(
		function(){
			var result = '<c:out value="${result}"/>';	
			
			checkModal(result);
			
			history.replaceState({},null,null);
			
			function checkModal(result){
				
				if(result === '' || history.state){
					return;
				}
				if(parseInt(result) > 0){
					$(".modal-body").html(
							"게시글 " + parseInt(result) + " 번이 등록되었습니.");
				}
				$("#myModal").modal("show");
			}
			
			$("#regBtn").on("click", function(){
				self.location = "/community/register";
			});
			
			var actionForm = $("#actionForm");
			
			$(".page-item a").on("click", function(e){
				e.preventDefault();
				console.log('click');
				actionForm.find("input[name='pageNum']").val($(this).attr("href"));
				actionForm.submit();
			});
			
			$(".move").on("click", function(e){
				e.preventDefault();
				actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'>");
				actionForm.attr("action", "/community/get");
				actionForm.submit();
			});
		});
</script>
</html>