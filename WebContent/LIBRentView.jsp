<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<HTML>
    <HEAD>
	    <TITLE>도서 대여 시스템 - 대여</TITLE>
	    <jsp:include page="nav.jsp"></jsp:include>
    </HEAD>
    <BODY onload="document.rentform.reset();">
    <main role="main" class="container" style="min-height: 100%;padding-top: 60px;">
        <H4>도서 대여 하기</H4>
        <div class="input-group mb-3" style="width:100%">
        <form ACTION="lib-rent" METHOD="post" class="form-inline" name="rentform">
		  <input style="width:80%; display: inline-block;" type="text" class="form-control" placeholder="대여할 책 ID를 입력하세요" name="id" aria-label="ID" aria-describedby="basic-addon" required autofocus>
		<div style="width:10%; display:inline-block;" class="input-group-append">
		    <button class="btn btn-outline-secondary" type="submit">대여</button>
		  </div>
		</form>
		</div>
	</main>
    </BODY>
    <jsp:include page="footer.jsp"></jsp:include>
</HTML>