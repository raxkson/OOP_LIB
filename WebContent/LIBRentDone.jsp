<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<HTML>
    <HEAD>
    	<TITLE>도서 대여 시스템 - 대여</TITLE>
    	<jsp:include page="nav.jsp"></jsp:include>
    </HEAD>
    <BODY>
    <main role="main" style="min-height: 100%;padding-top: 60px;" class="container">
    	<c:if test="${param.RESULT == \"Missing\" }">
    		<H3>올바른 데이터를 입력하세요. </H3>
    	</c:if>
    	<c:if test="${param.RESULT == \"Rented\" }">
    		<H3>이미 대여된 책입니다. </H3>
    	</c:if>
    	<c:if test="${param.RESULT == \"None\" }">
    		<H3>존재하지 않는 ID입니다. </H3>
    	</c:if>
    </main>
    <jsp:include page="footer.jsp"></jsp:include>
    </BODY>
</HTML>