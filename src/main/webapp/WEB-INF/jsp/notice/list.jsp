<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../header.jsp"%>
<div class="container">
	<div class="row">
		<div class="col-pg-8 col-md-10 mx-auto">  
<!-- List Content -->
<h1 class="text-center">공지 & 이벤트</h1>
<table class="table table-hover">
  <tr>
    <th>글번호</th><th>글제목</th><th>작성일</th><th>조회수</th>
  </tr>
<c:choose>
  <c:when test="${not empty list}">
    <c:forEach var="notice" items="${list}">
    <tr>
      <td>${notice.nt_num}</td>
      <td><a href="content?nt_num=${notice.nt_num}&pageNum=${page.pageNum}">${notice.nt_subject}</a></td>
      <td>${notice.nt_writeDate}</td>
      <td>${notice.nt_readCount}</td>
    </tr>
    </c:forEach>
  </c:when>
  <c:otherwise>
    <tr>
      <td colspan="4">게시판 글 없음</td>
    </tr>
  </c:otherwise>
</c:choose>
</table>


<c:if test="${page.count gt 0}">
<ul class="pagination">
  <%-- [이전] --%>
  <c:if test="${page.startPage gt page.pageBlock}">
    <li class="page-item"><a class="page-link" href="list?pageNum=${page.startPage - page.pageBlock}">Previous</a></li>
  </c:if>
  <%-- 1~10 페이지블록 범위 출력 --%>
  <c:forEach var="i" begin="${page.startPage}" end="${page.endPage}" step="1">    
     <c:choose>
      <c:when test="${i eq page.pageNum}">
        <li class="page-item"><a class="page-link" href="list?pageNum=${i}"><b>${i}</b></a></li>
      </c:when>
      <c:otherwise>
        <li class="page-item"><a class="page-link" href="list?pageNum=${i}">${i}</a></li>
      </c:otherwise>
    </c:choose> 
  </c:forEach>
  <%-- [다음] --%>
  <c:if test="${page.endPage lt page.pageCount}">
    <li class="page-item"><a class="page-link" href="list?pageNum=${page.startPage + page.pageBlock}">Next</a></li>
   <%--  <a href="list?pageNum=${page.startPage + page.pageBlock}">[다음]</a> --%>
  </c:if>
</ul>
</c:if>
<%-- 
<c:if test="${sessionScope.mb_ID eq 'admin'}">
  <input type="button" value="글쓰기" onclick="location.href='insert?pageNum=${page.pageNum}'">
</c:if> --%>

</div>
</div>
</div>
<%@include file="../footer.jsp"%>