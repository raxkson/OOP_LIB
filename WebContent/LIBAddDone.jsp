<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<HTML>
    <HEAD>
    	<TITLE>도서 대여 시스템 - 추가</TITLE>
    	<jsp:include page="nav.jsp"></jsp:include>
    </HEAD>
    <BODY>
	    <main role="main" class="container" style="min-height: 100%;padding-top: 60px;">
	    	<c:if test="${param.RESULT == \"Missing\" }">
	    		<H3>모든 데이터를 입력하세요. </H3>
	    	</c:if>
	    	<c:if test="${param.RESULT == \"Duplicate\" }">
	    		<H3>이미 있는 ID 입니다. </H3>
	    	</c:if>
	    	<c:if test="${param.RESULT == \"Unvalid\" }">
	    		<H3>잘못 된 값을 입력하였습니다.</H3>
	    	</c:if>
	    	<button type="button" class="btn btn-secondary" onclick="location='lib-list'">목록으로 돌아가기</button>
	    </main>
    	<jsp:include page="footer.jsp"></jsp:include>
    </BODY>
</HTML>