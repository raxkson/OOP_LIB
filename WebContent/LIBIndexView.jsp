<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<SCRIPT>
	window.onpageshow = (event) => {
	    if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) location.reload(true);
	}
</SCRIPT>
<HTML>
    <HEAD>
	    <TITLE>도서 대여 시스템 - 도서 정보</TITLE>
	    <jsp:include page="nav.jsp"></jsp:include>
    </HEAD>
    <BODY>
    <main role="main" style="min-height: 100%;padding-top: 60px;" class="container round">
        <H3>도서 정보</H3>
        	<H4>제목: ${param.title}</H4>
        	<H4>저자: ${param.writer}</H4>
        	<H4>대여 가능 여부: ${param.rental}</H4>
        	<c:if test="${param.rental eq \"Y\"}">
        		<form ACTION="lib-rent" METHOD="post" class="form-inline">
				  <input type="hidden" NAME=id value="${param.id}">
				  	<button type="submit" class="btn btn-default">대여</button>
				</form>
        	</c:if>
        	<c:if test="${param.rental eq \"N\"}">
	        		<form ACTION="lib-return" METHOD="post" class="form-inline">
					  <input type="hidden" NAME=id value="${param.id}">
					  	<button type="submit" class="btn btn-default">반납</button>
					</form>
	        </c:if>
	</main>
    <jsp:include page="footer.jsp"></jsp:include>
    </BODY>
</HTML>