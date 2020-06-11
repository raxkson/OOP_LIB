<%@page contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<HTML>
    <HEAD>
    	<TITLE>도서 대여 시스템 - 추가</TITLE>
    	<jsp:include page="nav.jsp"></jsp:include>
    </HEAD>
    <BODY onload="document.addform.reset();">
    <main role="main" class="container" style="min-height: 100%;padding-top: 60px;width:80%">
    	<div style="width:60%">
        	<H4>도서 추가 하기</H4>
    	</div>
        <form class="form-horizontal"  name="addform" style="width:40%"ACTION="lib-add" METHOD="POST" onsubmit="return check()">
		  <div class="form-group">
		    <label for="id" class="col-sm-2 control-label">ID</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="id" NAME=id placeholder="추가할 책 ID를 입력하세요" required autofocus>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="title" class="col-sm-2 control-label">제목</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="title" NAME=title placeholder="추가할 책 제목을 입력하세요" required>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="writer" class="col-sm-2 control-label">저자</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="writer" NAME=writer placeholder="추가할 책 저자를 입력하세요" required>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="price" class="col-sm-2 control-label">가격</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="price" NAME=price placeholder="추가할 책 가격을 입력하세요" required>
		    </div>
		  </div>
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
		      <button type="submit" class="btn btn-default">추가</button>
		    </div>
		  </div>
		</form>
	</main>
    <jsp:include page="footer.jsp"></jsp:include>
    </BODY>
    <script>
	</script>
</HTML>
