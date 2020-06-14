<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css" integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous">
<link rel="stylesheet" href="css/style.css">
	<div class="loader">
    <div class="spinner-border text-primary" role="status">
      <span class="sr-only">Loading...</span>
    </div>
  	</div>
	<nav class="navbar navbar-default navbar-fixed-top"">
	  <div class="container-fluid">
	    <!-- Brand and toggle get grouped for better mobile display -->
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <a class="navbar-brand" href="index.jsp">도서 대여 시스템</a>
	    </div>
	
	    <!-- Collect the nav links, forms, and other content for toggling -->
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	      <ul class="nav navbar-nav">
	      	<li class="dropdown <c:if test="${param.RETURN != 'true' && pageContext.request.requestURI == '/Library/LIBListView.jsp'}">active</c:if>">
	          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">책 목록<span class="caret"></span></a>
	          <ul class="dropdown-menu">
	            <li><a href="lib-list">목록</a></li>
	            <li><a href="lib-list?SORT=count">대여량 기준</a></li>
	            <li><a href="lib-list?SORT=rented">대여된 책 기준</a></li>
	            <li><a href="lib-list?SORT=rentable">대여 가능한 책 기준</a></li>
	          </ul>
	        </li>
	        <li class="<c:if test="${pageContext.request.requestURI == '/Library/LIBRentView.jsp'}">active</c:if>"><a href="LIBRentView.jsp">대여<span class="sr-only">(current)</span></a></li>
	      	<li class="<c:if test="${param.RETURN == 'true'}">active</c:if>"><a href="lib-list?RETURN=true">반납<span class="sr-only">(current)</span></a></li>
	      	<li class="<c:if test="${pageContext.request.requestURI == '/Library/LIBAddView.jsp'}">active</c:if>"><a href="LIBAddView.jsp">추가<span class="sr-only">(current)</span></a></li>
	      </ul>
	      <form class="navbar-form navbar-left" ACTION="lib-list?FIND=true" METHOD="GET">
	        <div class="form-group">
	          <input type="hidden" name="FIND" value="true">
	          <input type="text" class="form-control" placeholder="책 제목을 입력 해주세요" name="QUERY">
	        </div>
	        <button type="submit" class="btn btn-default">Search</button>
	      </form>
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>
	<script>
		
	</script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>