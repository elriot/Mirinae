<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">


<title>SB Admin - Bootstrap Admin Template</title>
<%@include file="nav.jsp"%>

<div id="page-wrapper">

	<div class="container-fluid">

		<!-- Page Heading -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">건의사항 </h1>
				<ol class="breadcrumb">
					<li><i class="fa fa-dashboard"></i> <a href="main">Dashboard</a>
					</li>
					<li class="active"><i class="fa fa-table"></i> 1:1 문의사항</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->
<div class="row">
<div class="col-lg-12">
	<div class="table-responsive">
		<table class="table table-bordered table-hover">
		
<form action="csDelete" method="post">



	<tr>
		<th>삭제</th><th>번호</th><th>문의유형</th><th>제목</th><th>작성자</th><th>문의일시</th><th>답변여부</th>
	</tr>
<c:forEach items="${list}" var="cs">
	<tr>
		<td><input type="checkbox" name="check" id ="chk" value="${cs.num}"></td>
		<td>${cs.num}</td>
		<td>${cs.cs_type}</td>
		<td>
			<a href="adminCsDetail?num=${cs.num}">${cs.title}</a>
			<c:if test="${cs.reply eq 'F'}"><span class="label label-danger">New</span></c:if>		
		</td>
		<td>${cs.id}</td>
		<td><fmt:parseDate var="parsed" value="${cs.reg_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
			<fmt:formatDate value="${parsed}" pattern="yyyy-MM-dd HH:mm:ss"/></td>		
		<td><c:choose>
	<c:when test="${cs.reply eq 'T'}">
		<c:out value="답변완료"></c:out>
	</c:when>
	<c:otherwise>
		<c:out value="답변미완료"></c:out>
	</c:otherwise>
</c:choose></td>
	</tr>
</c:forEach>
</table>

<input type="submit" value="삭제" class="btn btn-primary">
</form>


<c:if test="${pageVO.count gt 0}" >
<div id="PageBlock">
	<ul class="pagination">	

	<c:if test="${pageVO.startPage gt pageVO.pageBlock}">
		<li class="page-item"><a class="page-link" href="cs?pageNum=${pageVO.startPage - pageVO.pageBlock}">[이전]</a></li>
	</c:if>
	<%-- 1~10 페이지블록 범위 출력 --%>
	<c:forEach var="i" begin="${pageVO.startPage}" end="${pageVO.endPage}" step="1">
		<c:choose>
			<c:when test="${i eq pageVO.pageNum}">
				<li class="page-item"><a class="page-link" href="cs?pageNum=${i}"><b>${i}</b></a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item"><a class="page-link" href="cs?pageNum=${i}">${i}</a></li>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<%-- [다음] --%>
	<c:if test="${pageVO.endPage lt pageVO.pageCount}">
		<li class="page-item"><a class="page-link" href="cs?pageNum=${pageVO.startPage + pageVO.pageBlock}">[다음]</a></li>
	</c:if>
	</ul>
</div>
</c:if>
		<!-- /.row -->

	</div>
	<!-- /.container-fluid -->
</div>
</div>
<!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

<!-- jQuery -->
<script src="../startbootstrap-sb-admin-3.3.7/js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="../startbootstrap-sb-admin-3.3.7/js/bootstrap.min.js"></script>
</body>

</html>