<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<SCRIPT>

	
</SCRIPT>
<HTML>
    <HEAD><TITLE>도서 대여 시스템 - 반납</TITLE></HEAD>
    <BODY>
    <main role="main" class="container" style="min-height: 100%;padding-top: 60px;">
        <H4>도서 목록 보기</H4>
	        <div>
	        <TABLE border="1">
	            <TR>
	                <TD width=40>ID</TD>
	                <TD width=300>제목</TD>
	                <TD width=80>저자</TD>
	                <TD width=90>가격</TD>
	                <TD width=70>대여 가능</TD>
	                <TD width=70>대여 횟수</TD>
	                <TD width=60>반납</TD>
	            </TR>
	            <c:forEach var="cnt" begin="0" end="${LIB_LIST.listSize - 1}">
	                <TR>
	                    <TD>${LIB_LIST.id[cnt]}</TD>
	                    <TD>${LIB_LIST.title[cnt]}</TD>
	                    <TD>${LIB_LIST.writer[cnt]}</TD>
	                    <TD>${LIB_LIST.price[cnt]}</TD>
	                    <TD>${LIB_LIST.rental[cnt]}</TD>
	                    <TD>${LIB_LIST.count[cnt]}</TD>
	                    <TD><a href="lib-return?RETURN=${LIB_LIST.id[cnt]}">반납</a></TD>
	                </TR>
	            </c:forEach>
	        </TABLE>
	        <c:forEach var="cnt" begin="0" end="10" >
	        	<c:if test="${LIB_LIST.pageIndex[cnt] != null}">
	        		<button type="submit" name="returnbtn" onclick="location='lib-return?PAGE=${LIB_LIST.pageIndex[cnt]}'">${LIB_LIST.pageIndex[cnt]}</button>
	       		</c:if>
	        </c:forEach>
	        </div>
        </main>
    	<jsp:include page="footer.jsp"></jsp:include>
    </BODY>
</HTML>
