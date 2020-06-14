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
        	<table class="table table-bordered">
			  <tbody>
			    <tr>
			      <th scope="row" style="width:20%">제목</th>
			      <td colspan="3">${param.title}</td>
			    </tr>
			    <tr>
			      <th scope="row">작가</th>
			      <td>${param.writer}</td>
			      <th scope="row" style="width:15%">가격</th>
			      <td>${param.price}</td>
			    </tr>
			    <tr>
			      <th scope="row">대여 가능 여부</th>
			      <td>${param.rental}</td>
			      <th scope="row">대여 횟수</th>
			      <td>${param.count}</td>
			    </tr>
			  </tbody>
			</table>
        	<div style="width:30%">
	        	<c:if test="${param.rental eq \"Y\"}">
	        		<form style="width:20%;display:inline-grid;" ACTION="lib-rent" METHOD="post" class="form-inline">
					  <input type="hidden" NAME=id value="${param.id}">
					  	<button type="submit" class="btn btn-default">대여</button>
					</form>
	        	</c:if>
	        	<c:if test="${param.rental eq \"N\"}">
		        		<form style="width:20%;display:inline-grid;" ACTION="lib-return" METHOD="post" class="form-inline">
						  <input type="hidden" NAME=id value="${param.id}">
						  	<button type="submit" class="btn btn-default">반납</button>
						</form>
		        </c:if>
		        <form style="width:20%;display:inline-grid;" ACTION="lib-delete" METHOD="post" class="form-inline">
						  <input type="hidden" NAME=id value="${param.id}">
						  	<button type="submit" class="btn btn-default">삭제</button>
				</form>
				<form style="width:20%;display:inline-grid;" ACTION="LIBEditView.jsp" METHOD="get" class="form-inline">
						  <input type="hidden" NAME=id value="${param.id}">
						  <input type="hidden" NAME=title value="${param.title}">
						  <input type="hidden" NAME=writer value="${param.writer}">
						  <input type="hidden" NAME=price value="${param.price}">
						  	<button type="submit" class="btn btn-default">수정</button>
				</form>
			</div>
	</main>
    <jsp:include page="footer.jsp"></jsp:include>
    </BODY>
</HTML>