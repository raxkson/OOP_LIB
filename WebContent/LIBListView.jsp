<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<SCRIPT>
window.onpageshow = (event) => {
    if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) location.reload();
}
</SCRIPT>
<HTML>
    <HEAD>
    	<TITLE>도서 대여 시스템 - 목록</TITLE>
    	<jsp:include page="nav.jsp"></jsp:include>
    </HEAD>
    <BODY>
    <main role="main" class="container" style="min-height: 100%;padding-top: 60px;">
    	<c:choose>
	    	<c:when test="${param.FIND != null}">
	    		<H4>검색 목록 보기 : ${param.QUERY}</H4>
	    	</c:when>
    		<c:otherwise>
        		<H4>도서 목록 보기</H4>
    		</c:otherwise>
    	</c:choose>
    	  
        <TABLE class="table table-striped table-hover">
            <TR class="table-light">
                <TD scope="col" style="width:10%">ID</TD>
                <TD scope="col" style="width:30%">제목</TD>
                <TD scope="col" style="width:15%">저자</TD>
                <TD scope="col" style="width:15%">가격</TD>
                <TD scope="col" style="width:5%">대여 가능</TD>
                <TD scope="col" style="width:10%">대여 횟수</TD>
                <c:if test="${param.RETURN == \"true\" }">
                	<TD style="width:10%; height:0%; padding:0px auto">반납</TD>
                </c:if>
            </TR>
            <c:if test="${LIB_LIST.listSize > 0}">
            <c:forEach var="cnt" begin="0" end="${LIB_LIST.listSize - 1}">
            	<FORM id="return" ACTION="lib-return" METHOD="post">
                 <INPUT TYPE="hidden" name="id" value="${LIB_LIST.id[cnt]}">
        		 <input type="submit" id="submit-form" class="hidden" />
        		</FORM> 
                <TR <c:if test="${param.RETURN != \"true\"}">onClick="location.href='LIBIndexView.jsp?id=${LIB_LIST.id[cnt]}&title=${LIB_LIST.title[cnt]}&writer=${LIB_LIST.writer[cnt]}&price=${LIB_LIST.price[cnt]}&rental=${LIB_LIST.rental[cnt]}'"</c:if>>
                    <TD>${LIB_LIST.id[cnt]}</TD>
                    <TD>${LIB_LIST.title[cnt]}</TD>
                    <TD>${LIB_LIST.writer[cnt]}</TD>
                    <TD><fmt:formatNumber value="${LIB_LIST.price[cnt]}" />원</TD>
                    <TD>${LIB_LIST.rental[cnt]}</TD>
                    <TD>${LIB_LIST.count[cnt]}</TD>
                    <c:if test="${param.RETURN == \"true\" }">
                    	<TD><LABEL for="submit-form">반납</LABEL></TD>
                    </c:if>
                </TR>
            </c:forEach>
            </c:if>
        </TABLE>
        <div class="btn-toolbar text-center" style="width: 100%" role="toolbar" aria-label="Toolbar with button groups">
	        <div class="btn-group mr-2" style="width:35%; float:none; margin:0 auto" role="group" aria-label="First group">
	        	<c:if test="${param.PAGE > 9}">
	        		<fmt:parseNumber value="${param.PAGE / 10 }" var="prevPage" integerOnly="TRUE" type="NUMBER"></fmt:parseNumber>
	        		<button type="button" class="btn btn-secondary" onclick="location='lib-list?PAGE=${prevPage * 10 - 1}'">이전</button>
	        	</c:if>
	        <c:choose>
	        	<c:when test="${param.SORT == \"rented\"}">
	        		<c:forEach var="cnt" begin="0" end="10" >
			        	<c:if test="${LIB_LIST.pageIndex[cnt] != null}">
			        		<button type="button" class="btn btn-secondary <c:if test="${LIB_LIST.pageIndex[cnt] eq param.PAGE }">active</c:if>" onclick="location='lib-list?SORT=${param.SORT}&PAGE=${LIB_LIST.pageIndex[cnt]}'">${LIB_LIST.pageIndex[cnt]}</button>
			       		</c:if>
	        		</c:forEach>
	        	</c:when>
	        	<c:when test="${param.SORT == \"rentable\"}">
	        		<c:forEach var="cnt" begin="0" end="10" >
			        	<c:if test="${LIB_LIST.pageIndex[cnt] != null}">
			        		<button type="button" class="btn btn-secondary <c:if test="${LIB_LIST.pageIndex[cnt] eq param.PAGE }">active</c:if>" onclick="location='lib-list?SORT=${param.SORT}&PAGE=${LIB_LIST.pageIndex[cnt]}'">${LIB_LIST.pageIndex[cnt]}</button>
			       		</c:if>
	        		</c:forEach>
	        	</c:when>
	        	<c:when test="${param.SORT == \"count\"}">
	        		<c:forEach var="cnt" begin="0" end="10" >
			        	<c:if test="${LIB_LIST.pageIndex[cnt] != null}">
			        		<button type="button" class="btn btn-secondary <c:if test="${LIB_LIST.pageIndex[cnt] eq param.PAGE }">active</c:if>" onclick="location='lib-list?SORT=${param.SORT}&PAGE=${LIB_LIST.pageIndex[cnt]}'">${LIB_LIST.pageIndex[cnt]}</button>
			       		</c:if>
	        		</c:forEach>
	        	</c:when>
	        	<c:when test="${param.RETURN == \"true\"}">
	        		<c:forEach var="cnt" begin="0" end="10" >
			        	<c:if test="${LIB_LIST.pageIndex[cnt] != null}">
			        		<button type="button" class="btn btn-secondary <c:if test="${LIB_LIST.pageIndex[cnt] eq param.PAGE }">active</c:if>" onclick="location='lib-list?RETURN=${param.RETURN}&PAGE=${LIB_LIST.pageIndex[cnt]}'">${LIB_LIST.pageIndex[cnt]}</button>
			       		</c:if>
	        		</c:forEach>
	        	</c:when>
	        	<c:when test="${param.find == \"true\"}">
	        		<c:forEach var="cnt" begin="0" end="10" >
			        	<c:if test="${LIB_LIST.pageIndex[cnt] != null}">
			        		<button type="button" class="btn btn-secondary <c:if test="${LIB_LIST.pageIndex[cnt] eq param.PAGE }">active</c:if>" onclick="location='lib-list?FIND=${param.FIND}&PAGE=${LIB_LIST.pageIndex[cnt]}'">${LIB_LIST.pageIndex[cnt]}</button>
			       		</c:if>
	        		</c:forEach>
	        	</c:when>
	        	<c:otherwise>
	        		<c:forEach var="cnt" begin="0" end="10" >
			        	<c:if test="${LIB_LIST.pageIndex[cnt] != null}">
			        		<button type="button" class="btn btn-secondary <c:if test="${LIB_LIST.pageIndex[cnt] eq param.PAGE }">active</c:if>" onclick="location='lib-list?PAGE=${LIB_LIST.pageIndex[cnt]}'">${LIB_LIST.pageIndex[cnt]}</button>
			       		</c:if>
	        		</c:forEach>
	        	</c:otherwise>
	        </c:choose>
	        <c:choose>
	        	<c:when test="${(LIB_LIST.lastPage ne true) and (LIB_LIST.lastSize > 10) and (param.page < 10) }">
	        		<button type="button" class="btn btn-secondary" onclick="location='lib-list?PAGE=10'">다음</button>
	        	</c:when>
	        	<c:when test="${LIB_LIST.lastPage ne true && not ((LIB_LIST.lastSize / 10) * 10 < param.PAGE) ne true }">
	        		<fmt:parseNumber value="${param.PAGE / 10}" var="nextPage" integerOnly="TRUE" type="NUMBER"></fmt:parseNumber>
	        
	        		<button type="button" class="btn btn-secondary" onclick="location='lib-list?PAGE=${(nextPage + 1) * 10}'">다음</button>
	        	</c:when>
	        </c:choose>
	        </div>
        </div>
     </main>
    	<jsp:include page="footer.jsp"></jsp:include>
    </BODY>
</HTML>