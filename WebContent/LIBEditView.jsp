<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<HTML>
    <HEAD>
    	<TITLE>도서 대여 시스템 - 수정</TITLE>
    	<jsp:include page="nav.jsp"></jsp:include>
    </HEAD>
    <BODY onload="document.addform.reset();">
    <main role="main" class="container" style="min-height: 100%;padding-top: 60px;width:80%">
    	<div style="width:60%">
        	<H4>도서 수정 하기</H4>
    	</div>
        <form class="form-horizontal"  name="addform" style="width:40%"ACTION="lib-edit" METHOD="POST" onsubmit="return check()">
		  <div class="form-group">
		    <div class="col-sm-10">
		      <input type="hidden" class="form-control" id="id" NAME=id value="${LIB_INDEX.id }" placeholder="${LIB_INDEX.id }">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="title" class="col-sm-2 control-label">제목</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="title" NAME=title value="${LIB_INDEX.title }" placeholder="${LIB_INDEX.title }" required>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="writer" class="col-sm-2 control-label">저자</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="writer" NAME=writer value="${LIB_INDEX.writer }" placeholder="${LIB_INDEX.writer }" required>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="price" class="col-sm-2 control-label">가격</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="price" NAME=price value="${LIB_INDEX.price }" placeholder="${LIB_INDEX.price }" required>
		    </div>
		  </div>
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
		      <button type="submit" class="btn btn-default">수정</button>
		    </div>
		  </div>
		</form>
	</main>
    <jsp:include page="footer.jsp"></jsp:include>
    </BODY>
    <script>
	</script>
</HTML>
